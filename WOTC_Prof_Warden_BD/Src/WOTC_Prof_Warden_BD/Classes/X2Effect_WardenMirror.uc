class X2Effect_WardenMirror extends X2Effect_Persistent config(WardenSkills);

function bool ChangeHitResultForTarget(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, bool bIsPrimaryTarget, const EAbilityHitResult CurrentResult, out EAbilityHitResult NewHitResult)
{ 
    local X2AbilityToHitCalc_StandardAim Aim;

    Aim = X2AbilityToHitCalc_StandardAim(AbilityState.GetMyTemplate().AbilityToHitCalc);
    
    if (Aim == none || Aim.bIndirectFire)
        return false;

    switch (CurrentResult)
    {		
    case eHit_Crit:
        NewHitResult = eHit_Graze;	
        return true;
    case eHit_Success:
        NewHitResult = eHit_Graze;		
        return true;
    case eHit_Graze:
        NewHitResult = eHit_Graze;
        return true;
    default:
        break;
    }
    return false; 
}

function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState)
{
    local XComGameStateContext_Ability  AbilityContext;
    local XComGameState_Unit            TargetUnit;
    local XComGameState_Unit            WardenUnit;

    WardenUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));
    if (WardenUnit != none)
        WardenUnit.SetUnitFloatValue('BD_MirrorReturnFireDamage', CurrentDamage, eCleanup_BeginTurn);

    if (NewGameState == none)
        return 0;
	//`log("Mirror Return Fire Damage:" @ CurrentDamage,,'BDLOG');
    AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());
    if (AbilityContext == none)
    {
        TargetUnit = XComGameState_Unit(TargetDamageable);
        `XEVENTMGR.TriggerEvent('MirrorManualTick', TargetUnit, TargetUnit, NewGameState);
        return -CurrentDamage;
    }

    return 0;
}

static function EventListenerReturn OnUnitTookDamage(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Unit                TargetUnit;
    local XComGameState_Unit                AttackerUnit;
    local XComGameState_Unit                WardenUnit;
    local XComGameState_Effect              EffectState;
    local XComGameState_Ability             ReturnFireAbility;
    local StateObjectReference              ReturnFireAbilityRef;
    local XComGameStateContext_Ability      AbilityContext;
    local bool                              bWasGrazed;
    local int                               i;
    local XComGameState_Player              Player;
    local UnitValue                         LastReturnFireAttackUV;

    TargetUnit = XComGameState_Unit(EventSource);
    EffectState = XComGameState_Effect(CallbackData);
    Player = XComGameState_Player(`XCOMHISTORY.GetGameStateForObjectID(TargetUnit.ControllingPlayer.ObjectID));

    // Only fire for the unit this effect is applied to
    if (EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID != TargetUnit.ObjectID)
        return ELR_NoInterrupt;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
    if (AbilityContext == none)
        return ELR_NoInterrupt;

    // Check primary target hit result
    bWasGrazed = (AbilityContext.ResultContext.HitResult == eHit_Graze);

    // Check multi-target hit results if not already confirmed
    if (!bWasGrazed)
    {
        for (i = 0; i < AbilityContext.InputContext.MultiTargets.Length; i++)
        {
            if (AbilityContext.InputContext.MultiTargets[i].ObjectID == TargetUnit.ObjectID)
            {
                if (AbilityContext.ResultContext.MultiTargetHitResults[i] == eHit_Graze)
                    bWasGrazed = true;
                break;
            }
        }
    }

    if (!bWasGrazed)
        return ELR_NoInterrupt;

    // Find the Warden via the effect's source reference
    WardenUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

    if (WardenUnit == none)
    {
        //`log("Mirror not returning fire - Warden unit not found",,'BDLOG');
        `XEVENTMGR.TriggerEvent('MirrorManualTick', Player, TargetUnit, GameState);
        return ELR_NoInterrupt;
    }

    // Check Warden unit conditions
    if (WardenUnit.IsImpaired() || WardenUnit.IsBurning() || WardenUnit.IsPanicked())
    {
        //`log("Mirror not returning fire - Warden impaired/burning/panicked",,'BDLOG');
        `XEVENTMGR.TriggerEvent('MirrorManualTick', Player, TargetUnit, GameState);
        return ELR_NoInterrupt;
    }

    // Prevent double firing from the same attack when multiple Mirror instances are active
    WardenUnit.GetUnitValue('BD_MirrorLastReturnFireAttack', LastReturnFireAttackUV);
    if (int(LastReturnFireAttackUV.fValue) == GameState.HistoryIndex)
        return ELR_NoInterrupt;

    WardenUnit.SetUnitFloatValue('BD_MirrorLastReturnFireAttack', GameState.HistoryIndex, eCleanup_BeginTurn);

   // Find the return fire ability on the Warden
    ReturnFireAbilityRef = WardenUnit.FindAbility('Warden_BD_MirrorReturnFire');
    ReturnFireAbility = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(ReturnFireAbilityRef.ObjectID));

    // Get the attacker from the ability context
    AttackerUnit = XComGameState_Unit(GameState.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));

    if (AttackerUnit == none)
    {
        AttackerUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));
    }

    if (ReturnFireAbility == none || AttackerUnit == none)
    {
        //`log("Mirror not returning fire - ability or attacker not found",,'BDLOG');
        `XEVENTMGR.TriggerEvent('MirrorManualTick', Player, TargetUnit, GameState);
        return ELR_NoInterrupt;
    }

    //`log("Mirror triggering return fire from Warden against " $ AttackerUnit.GetFullName(),,'BDLOG');
    ReturnFireAbility.AbilityTriggerAgainstSingleTarget(AttackerUnit.GetReference(), false);
    `XEVENTMGR.TriggerEvent('MirrorManualTick', Player, TargetUnit, GameState);

    return ELR_NoInterrupt;
}

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
    local X2EventManager    EventMgr;
    local Object            EffectObj;
    
    EventMgr = `XEVENTMGR;
    EffectObj = EffectGameState;

    // Unregister from turn-based ticking — we tick manually
    EventMgr.UnRegisterFromEvent(EffectObj, 'PlayerTurnEnded');

    // Register for manual tick
    EventMgr.RegisterForEvent(EffectObj, 'MirrorManualTick', OnPlayerTurnTickedWrapper, ELD_OnStateSubmitted,,,, EffectGameState);

    // Register for damage taken to trigger return fire
    EventMgr.RegisterForEvent(EffectObj, 'UnitTakeEffectDamage', OnUnitTookDamage, ELD_OnStateSubmitted,,, true, EffectGameState);
}

static function EventListenerReturn OnPlayerTurnTickedWrapper(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
    local XComGameState_Unit   TargetUnit;
    local XComGameState_Effect EffectGameState;

    EffectGameState = XComGameState_Effect(CallbackData);
    TargetUnit = XComGameState_Unit(EventSource);

    if (EffectGameState != none && TargetUnit != none && EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID == TargetUnit.ObjectID)
    {		
        return EffectGameState.OnPlayerTurnTicked(EventData, EventSource, GameState, Event, CallbackData);
    }
    return ELR_NoInterrupt;
}
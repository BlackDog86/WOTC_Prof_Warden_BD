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

    // Only handle the no-context case here — absorb damage and tick the shield
    if (NewGameState == none)
        return 0;

    AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());
    if (AbilityContext == none)
    {
        TargetUnit = XComGameState_Unit(TargetDamageable);
        `LOG("Mirror absorbing no-context damage of " $ CurrentDamage,,'BDLOG');
        `XEVENTMGR.TriggerEvent('MirrorManualTick', TargetUnit, TargetUnit, NewGameState);
        return -CurrentDamage;
    }

    return 0;
}

static function EventListenerReturn OnUnitTookDamage(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Unit                TargetUnit;
    local XComGameState_Unit                AttackerUnit;
    local XComGameState_Effect              EffectState;
    local XComGameState_Ability             ReturnFireAbility;
    local StateObjectReference              ReturnFireAbilityRef;
    local XComGameStateContext_Ability      AbilityContext;
    local bool                              bWasGrazed;
    local int                               i;
	local XComGameState_Player				Player;

    TargetUnit = XComGameState_Unit(EventSource);
    EffectState = XComGameState_Effect(CallbackData);
	Player = XComGameState_Player(`XCOMHISTORY.GetGameStateForObjectID(TargetUnit.ControllingPlayer.ObjectID));

    // Only fire for the unit this effect is applied to
    if (EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID != TargetUnit.ObjectID)
        return ELR_NoInterrupt;

    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
    if (AbilityContext == none)
        return ELR_NoInterrupt; // Handled by GetDefendingDamageModifier

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

    // Check unit conditions
    if (TargetUnit.IsImpaired() || TargetUnit.IsBurning() || TargetUnit.IsPanicked())
    {
        `LOG("Mirror not returning fire - unit impaired/burning/panicked",,'BDLOG');
        `XEVENTMGR.TriggerEvent('MirrorManualTick', Player, TargetUnit, GameState);
        return ELR_NoInterrupt;
    }

    // Find the return fire ability on the Warden
    ReturnFireAbilityRef = TargetUnit.FindAbility('Warden_BD_MirrorReturnFire');
    ReturnFireAbility = XComGameState_Ability(
        `XCOMHISTORY.GetGameStateForObjectID(ReturnFireAbilityRef.ObjectID));

    // Get the attacker from the ability context
    AttackerUnit = XComGameState_Unit(
        `XCOMHISTORY.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));

    if (ReturnFireAbility == none || AttackerUnit == none)
    {
        `LOG("Mirror not returning fire - ability or attacker not found",,'BDLOG');
        `XEVENTMGR.TriggerEvent('MirrorManualTick', Player, TargetUnit, GameState);
        return ELR_NoInterrupt;
    }

    `LOG("Mirror triggering return fire against " $ AttackerUnit.GetFullName(),,'BDLOG');
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
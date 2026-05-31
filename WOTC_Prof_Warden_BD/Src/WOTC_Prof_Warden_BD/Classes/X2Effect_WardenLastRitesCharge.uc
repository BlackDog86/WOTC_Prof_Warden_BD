class X2Effect_WardenLastRitesCharge extends X2Effect_Persistent;

var name LastRitesChargeCountValue;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local XComGameState_Unit        SourceUnit;
    local XComGameState_Ability     SoulBladeState;
    local StateObjectReference      SoulBladeRef;
    local int                       ChargeCount;
	local XComGameState_Unit		TargetUnit;
    super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);

    TargetUnit = XComGameState_Unit(kNewTargetState);
	SourceUnit = XComGameState_Unit(NewGameState.GetGameStateForObjectID(
        ApplyEffectParameters.SourceStateObjectRef.ObjectID));
    
	`log("Target Unit:" @ TargetUnit.GetMyTemplateName() @ "Source Unit:" @ SourceUnit.GetMyTemplateName());
	if (SourceUnit == none)
        SourceUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(
            ApplyEffectParameters.SourceStateObjectRef.ObjectID));

    if (SourceUnit == none)
        return;

    SoulBladeRef = SourceUnit.FindAbility('Warden_BD_SoulBlade');
    if (SoulBladeRef.ObjectID > 0)
    {
        SoulBladeState = XComGameState_Ability(NewGameState.GetGameStateForObjectID(SoulBladeRef.ObjectID));
        if (SoulBladeState == none)
        {
		    SoulBladeState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(SoulBladeRef.ObjectID));
		}
        if (SoulBladeState != none)
        {
		    ChargeCount = SoulBladeState.GetCharges();
			SoulBladeState.iCharges = 0;
		}
    }

    `LOG("LastRitesCharge: Storing " $ ChargeCount $ " charges on target" @ TargetUnit.GetMyTemplateName(),,'BDLOG');
	TargetUnit.SetUnitFloatValue(default.LastRitesChargeCountValue, ChargeCount, eCleanup_BeginTactical);
}

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
    local X2EventManager    EventMgr;
    local Object            EffectObj;
	local XComGameState_Unit TargetUnit;
	
	TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));

    EventMgr = `XEVENTMGR;
    EffectObj = EffectGameState;

    EventMgr.RegisterForEvent(EffectObj, 'UnitTakeEffectDamage', OnLastRitesTargetDamaged, ELD_OnStateSubmitted,, TargetUnit,, EffectGameState);
}

static function EventListenerReturn OnLastRitesTargetDamaged(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Unit                    TargetUnit;
    local XComGameState_Effect                  EffectState;
    local XComGameStateContext_Ability          AbilityContext;
    local DamageResult                          LastDamage;
    local name                                  DamageType;
    local bool                                  bWasGrazed, bWasPsionic;
    local int                                   i;
    local AvailableAction                       Action;
    local AvailableTarget                       Target;
    local XComGameStateContext_EffectRemoved    EffectRemovedState;
    local XComGameState                         NewGameState;
    local XComGameState_Unit                    PlacingUnit;
    local vector                                TargetLoc;
    local array<vector>                         TargetLocs;
    local UnitValue                             DetonatedUV;

    TargetUnit = XComGameState_Unit(EventSource);
    EffectState = XComGameState_Effect(CallbackData);

    if (EffectState.ApplyEffectParameters.TargetStateObjectRef.ObjectID != TargetUnit.ObjectID)
        return ELR_NoInterrupt;

    // Guard against double firing within the same game state submission
    TargetUnit.GetUnitValue('BD_LastRitesDetonated', DetonatedUV);
    if (DetonatedUV.fValue > 0)
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

    // Check if damage was psionic
    if (TargetUnit.DamageResults.Length > 0)
    {
        LastDamage = TargetUnit.DamageResults[TargetUnit.DamageResults.Length - 1];
        foreach LastDamage.DamageTypes(DamageType)
        {
            if (DamageType == 'Psi')
            {
                bWasPsionic = true;
                break;
            }
        }
    }

    if (!bWasPsionic)
        return ELR_NoInterrupt;

    // Find the placing unit and detonation ability
    PlacingUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(
        EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

	if (PlacingUnit == none)
        return ELR_NoInterrupt;

	Action.AbilityObjectRef = PlacingUnit.FindAbility('Warden_BD_LastRitesDetonation');
    if (Action.AbilityObjectRef.ObjectID == 0)
        return ELR_NoInterrupt;

    Action.AvailableCode = 'AA_Success';
    TargetLoc = `XWORLD.GetPositionFromTileCoordinates(TargetUnit.TileLocation);
    Target.PrimaryTarget = TargetUnit.GetReference();
    Action.AvailableTargets.AddItem(Target);
    TargetLocs.AddItem(TargetLoc);

    `LOG("LastRitesCharge: Detonating against " $ TargetUnit.GetFullName(),,'BDLOG');

    // Set detonation flag before firing so subsequent listener calls see it
    NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("LastRites Detonation Flag");
    TargetUnit = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', TargetUnit.ObjectID));
    TargetUnit.SetUnitFloatValue('BD_LastRitesDetonated', 1, eCleanup_BeginTactical);
    `TACTICALRULES.SubmitGameState(NewGameState);

    if (class'XComGameStateContext_Ability'.static.ActivateAbility(Action, 0, TargetLocs, ,,,GameState.HistoryIndex))
    {
        EffectRemovedState = class'XComGameStateContext_EffectRemoved'.static.CreateEffectRemovedContext(EffectState);
        NewGameState = `XCOMHISTORY.CreateNewGameState(true, EffectRemovedState);
        EffectState.RemoveEffect(NewGameState, GameState);
        `TACTICALRULES.SubmitGameState(NewGameState);
    }

    return ELR_NoInterrupt;
}

simulated function OnEffectRemoved(const out EffectAppliedData ApplyEffectParameters, XComGameState NewGameState, bool bCleaned, XComGameState_Effect RemovedEffectState)
{
    local XComGameState_Unit        TargetUnit;
    local StateObjectReference      DetonationAbilityRef;
    local AvailableAction           Action;
    local AvailableTarget           Target;
    local vector                    TargetLoc;
    local array<vector>             TargetLocs;
    local UnitValue                 DetonatedUV;

    super.OnEffectRemoved(ApplyEffectParameters, NewGameState, bCleaned, RemovedEffectState);

    if (bCleaned)
        return;

    TargetUnit = XComGameState_Unit(NewGameState.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));
    if (TargetUnit == none)
        TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));

    if (TargetUnit == none)
        return;

    // Don't fire if already detonated this game state submission
    TargetUnit.GetUnitValue('BD_LastRitesDetonated', DetonatedUV);
    if (DetonatedUV.fValue > 0)
        return;

    DetonationAbilityRef = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ApplyEffectParameters.SourceStateObjectRef.ObjectID)).FindAbility('Warden_BD_LastRitesDetonation');

    if (DetonationAbilityRef.ObjectID <= 0)
        return;

    Action.AbilityObjectRef = DetonationAbilityRef;
    Action.AvailableCode = 'AA_Success';
    TargetLoc = `XWORLD.GetPositionFromTileCoordinates(TargetUnit.TileLocation);
    Target.PrimaryTarget = TargetUnit.GetReference();
    Action.AvailableTargets.AddItem(Target);
    TargetLocs.AddItem(TargetLoc);

    `LOG("LastRitesCharge: Duration expired, detonating against " $ TargetUnit.GetFullName(),,'BDLOG');
    class'XComGameStateContext_Ability'.static.ActivateAbility(Action, 0, TargetLocs);
}
defaultproperties
{
    LastRitesChargeCountValue = "BD_LastRitesChargeCount"
}
class X2Effect_WardenStatusEffectCounter extends X2Effect_Persistent;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	
	local StateObjectReference		EffectRef;
	local XComGameStateHistory		History;
	local XComGameState_Effect		EffectState;
	local XComGameState_Unit		NewSourceUnit, TargetUnit;
	local UnitValue					CurrentConsumeCounter;
	local int						EffectCounter;
	local array<name>				effectsToCheck;

	// Add all of the effects we want to check on the unit to a local array:
	effectsToCheck.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	effectsToCheck.AddItem(class'X2AbilityTemplateManager'.default.PanickedName);
	effectsToCheck.AddItem(class'X2AbilityTemplateManager'.default.DazedName);
	effectsToCheck.AddItem(class'X2AbilityTemplateManager'.default.BlindedName);
	effectsToCheck.AddItem(class'X2AbilityTemplateManager'.default.ObsessedName);
	effectsToCheck.AddItem(class'X2AbilityTemplateManager'.default.BerserkName);
	effectsToCheck.AddItem(class'X2AbilityTemplateManager'.default.ShatteredName);
	effectsToCheck.AddItem(class'X2AbilityTemplateManager'.default.StunnedName);
	effectsToCheck.AddItem(class'X2StatusEffects'.default.UnconsciousName);
	effectsToCheck.AddItem(class'X2StatusEffects'.default.BurningName);
	effectsToCheck.AddItem(class'X2StatusEffects'.default.AcidBurningName);
	effectsToCheck.AddItem(class'X2StatusEffects'.default.PoisonedName);
	effectsToCheck.AddItem(class'X2StatusEffects'.default.BleedingName);
	effectsToCheck.AddItem(class'X2StatusEffects'.default.UnconsciousName);
	effectsToCheck.AddItem(class'X2Effect_ParthenogenicPoison'.default.EffectName);

	History = `XCOMHISTORY;
	TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));

	if (TargetUnit == none)
	{
		return;
	}
	
	foreach TargetUnit.AffectedByEffects(EffectRef)
	{
		EffectState = XComGameState_Effect(History.GetGameStateForObjectID(EffectRef.ObjectID));
		if( EffectState != None )
		{
			`log("StatusEffectCounter: Checking effect: " @ EffectState.GetX2Effect().EffectName);
			If (effectsToCheck.Find(EffectState.GetX2Effect().EffectName) != INDEX_NONE)			
			{
			EffectCounter = EffectCounter + 1;
			`log("StatusEffectCounter: Check Passed: " @ EffectState.GetX2Effect().EffectName @ ":New Counter Value:" @effectCounter);
			}
			Else
			{
			`log("StatusEffectCounter: Check failed: " @ EffectState.GetX2Effect().EffectName);
			}
		}						
	}	
	NewSourceUnit = XComGameState_Unit(NewGameState.GetGameStateForObjectID(ApplyEffectParameters.SourceStateObjectRef.ObjectID));
		If (NewSourceUnit != none)
		{
		NewSourceUnit.GetUnitValue(class'X2Ability_Warden'.default.ConsumeBonusDamageValue, CurrentConsumeCounter);
		NewSourceUnit.SetUnitFloatValue(class'X2Ability_Warden'.default.ConsumeBonusDamageValue, CurrentConsumeCounter.fValue + effectCounter);
		`log("Consume unit value: " @ CurrentConsumeCounter.fValue + effectCounter);
		}
}

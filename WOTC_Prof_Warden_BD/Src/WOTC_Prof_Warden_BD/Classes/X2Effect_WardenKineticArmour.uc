class X2Effect_WardenKineticArmour extends X2Effect_ModifyStats config(WardenSkills);

var config int KINETIC_ARMOUR_SHIELD_HP_PERCENTAGE;
var const name KineticArmorValue;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameStateContext_Ability	AbilityContext;
	local XComGameState_Unit			TargetUnit;
	local StatChange					NewStatChange;

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());
	if (AbilityContext == none)
		return;
	
	TargetUnit = XComGameState_Unit(kNewTargetState); 		
	
	NewStatChange.StatType = eStat_ShieldHP;
	NewStatChange.StatAmount = Round((TargetUnit.GetMaxStat(eStat_HP) * float(KINETIC_ARMOUR_SHIELD_HP_PERCENTAGE) / 100.0f));
	NewEffectState.StatChanges.AddItem(NewStatChange);

	super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
}

function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState) 
{ 
		local XComGameState_Unit	TargetUnit;
		local XComGameState_Unit	NewTargetUnit;
		local int					InitialShield;
		local UnitValue				UV;
		local int					DamageReducedSoFar;
		local int					DamageReduction;
    
		TargetUnit = XComGameState_Unit(TargetDamageable);    
		InitialShield = TargetUnit.GetMaxStat(eStat_HP) * float(KINETIC_ARMOUR_SHIELD_HP_PERCENTAGE) / 100.0f;
  
		//Get the amount of plating available from the unitvalue vairable and assign it to local UV
		TargetUnit.GetUnitValue(KineticArmorValue, UV);
    
		//Get the float value and assign it to a new variable
		DamageReducedSoFar = UV.fValue;    
		DamageReduction = InitialShield - DamageReducedSoFar;
    
		if (DamageReduction > CurrentDamage)
		{    
		DamageReduction = CurrentDamage;
		}
    
		if (NewGameState != none)
		{
		NewTargetUnit = XComGameState_Unit(NewGameState.GetGameStateForObjectID(TargetUnit.ObjectID));
		NewTargetUnit.SetUnitFloatValue(KineticArmorValue, DamageReduction, eCleanup_BeginTactical);
		}

		return -DamageReduction;
	}

defaultproperties
{
    KineticArmorValue = "BD_KineticArmor_Value"
	DuplicateResponse = eDupe_Ignore
	EffectName = "X2Effect_WardenKineticArmor_Effect"
}
class X2Effect_WardenKineticArmor extends X2Effect_ModifyStats config(WardenSkills);

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
	NewStatChange.StatAmount = Round((TargetUnit.GetMaxStat(eStat_HP) * float(class'X2Ability_Warden'.default.KINETIC_ARMOR_SHIELD_HP_PERCENTAGE) / 100.0f));
	TargetUnit.SetUnitFloatValue(class'X2Ability_Warden'.default.KineticArmorExpendedShields, 0, eCleanup_BeginTactical);
	`Log("Kinetic Armour Activated: Setting expended shields to 0");
	NewEffectState.StatChanges.AddItem(NewStatChange);

	super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
}

function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState) 
{ 
		local XComGameState_Unit	TargetUnit, NewTargetUnit;
		local int					InitialShield, ExpendedShieldHP, ActiveShieldHP, NewExpendedShieldHP, CurrentBonusDamageValue;
		local UnitValue				UV, UV2;

	TargetUnit = XComGameState_Unit(TargetDamageable);    
	InitialShield = TargetUnit.GetMaxStat(eStat_HP) * float(class'X2Ability_Warden'.default.KINETIC_ARMOR_SHIELD_HP_PERCENTAGE) / 100.0f;
	`Log("Initial shield is: " @InitialShield);
		
	If(CurrentDamage != 0) 
		{		
		//Get the amount of plating missing before the attack and assign it locally
			TargetUnit.GetUnitValue(class'X2Ability_Warden'.default.KineticArmorExpendedShields, UV);
			TargetUnit.GetUnitValue(class'X2Ability_Warden'.default.KineticArmorBonusDamageValue, UV2);

			ExpendedShieldHP = UV.fValue;
			`log("ExpendedShieldHP= " @UV2.fValue);		
			CurrentBonusDamageValue = UV2.fValue;
			`log("CurrentBonusDamageValue= " @UV2.fValue);		

			ActiveShieldHP = InitialShield - ExpendedShieldHP;
				// Calculate the expended amount of shields based on the incoming damage				
				if (ActiveShieldHP > CurrentDamage)
				{    
				NewExpendedShieldHP = CurrentDamage + ExpendedShieldHP;
				CurrentBonusDamageValue += CurrentDamage;
				}
				else
				{
				NewExpendedShieldHP = InitialShield;
				CurrentBonusDamageValue += ActiveShieldHP;
				}
						
			`log("NewExpendedShieldHP: " @NewExpendedShieldHP);
			`log("NewBonusDamageValue: " @CurrentBonusDamageValue);		
			
			// Set the appropriate unitvalues				
			if (NewGameState != none)
			{
			NewTargetUnit = XComGameState_Unit(NewGameState.GetGameStateForObjectID(TargetUnit.ObjectID));
			NewTargetUnit.SetUnitFloatValue(class'X2Ability_Warden'.default.KineticArmorExpendedShields, NewExpendedShieldHP, eCleanup_BeginTactical);
			NewTargetUnit.SetUnitFloatValue(class'X2Ability_Warden'.default.KineticArmorBonusDamageValue, CurrentBonusDamageValue, eCleanup_BeginTactical);
			}
		}
		// We don't actually need to modify incoming damage
		return 0;
	}

//Event to Remove the persistent effect once the shields are gone
function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMgr;
	local XComGameState_Unit UnitState;
	local Object EffectObj;

	EventMgr = `XEVENTMGR;

	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
	EffectObj = EffectGameState;

	EventMgr.RegisterForEvent(EffectObj, 'ShieldsExpended', EffectGameState.OnShieldsExpended, ELD_OnStateSubmitted, , UnitState);
}
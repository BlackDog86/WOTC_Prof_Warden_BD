class X2Effect_WardenKineticArmorDamage extends X2Effect_Persistent config(WardenSkills);

var config int KINETIC_ARMOR_SHIELD_DAMAGE_PERCENTAGE;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local XComGameState_Item			SourceWeapon;
	local X2Effect_ApplyWeaponDamage	DamageEffect;
	local XComGameState_Unit			NewSourceUnit;
	local UnitValue						UV;
	local int							BonusDamage;

	SourceWeapon = AbilityState.GetSourceWeapon();
	//InitialShield = Attacker.GetMaxStat(eStat_HP) * float(KINETIC_Armor_SHIELD_HP_PERCENTAGE) / 100.0f;

	// Get the bonus damage unitvalue
	Attacker.GetUnitValue(class'X2Ability_Warden'.default.KineticArmorBonusDamageValue, UV);
	`log("Kinetic Armor Bonus Damage UnitValue = " @UV.fValue);
	// If the source weapon exists
	if (SourceWeapon != none)
		{
		// Bonus damage = amount of shields lost / shielding factor, rounding up damage to weapon
		BonusDamage = Round((UV.fValue)*((default.KINETIC_ARMOR_SHIELD_DAMAGE_PERCENTAGE)/100));			
		`log("Bonus damage to apply = " @BonusDamage);			
				// Damage preview
				if (NewGameState == none)
					{			
					return BonusDamage;
					}				
				
				//	only add the bonus damage when the damage effect is applying the weapon's base damage
				DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(AppliedData.EffectRef));			
				if (DamageEffect != none && !DamageEffect.bIgnoreBaseDamage)
					{
					// Reset the bonus damage unitvalue
					NewSourceUnit = XComGameState_Unit(NewGameState.GetGameStateForObjectID(Attacker.ObjectID));
					NewSourceUnit.SetUnitFloatValue(class'X2Ability_Warden'.default.KineticArmorBonusDamageValue,0);					
					`log("Kinetic Shot taken - Resetting Bonus Damage Unitvalue to 0");
					// Also reset the expended warden shields back to 0 if we don't have any left (this should hopefully make shields granted by other stuff not matter in respect of bonus damage)
					//	If (InitialShield - int(UV2.fValue) <= Attacker.GetCurrentStat(eStat_ShieldHP))
					//	{
					//	Attacker.SetUnitFloatValue(class'X2Effect_WardenKineticArmor'.default.KineticArmorExpendedShields, 0, eCleanup_BeginTactical);
					//	`log("Shot taken and no kinetic shields left - setting Unit Value to 0");
					//	}
					return BonusDamage;
					}						
		}
	return 0;
}

class X2Effect_WardenConsumeDamage extends X2Effect_Persistent config(WardenSkills);

var config int CONSUME_DAMAGE_MULTIPLIER;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local XComGameState_Item			SourceWeapon;
	local X2Effect_ApplyWeaponDamage	DamageEffect;
	local XComGameState_Unit			NewSourceUnit;
	local UnitValue						UV;
	local int							BonusDamage;

	SourceWeapon = AbilityState.GetSourceWeapon();

	// Get the bonus damage unitvalue
	Attacker.GetUnitValue(class'X2Ability_Warden'.default.ConsumeBonusDamageValue, UV);
	`log("Consume Bonus Damage UnitValue = " @UV.fValue);
	// If the source weapon exists
	if (SourceWeapon != none)
		{		
		BonusDamage = Round(UV.fValue * CONSUME_DAMAGE_MULTIPLIER);			
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
					NewSourceUnit.SetUnitFloatValue(class'X2Ability_Warden'.default.ConsumeBonusDamageValue,0);					
					`log("Consume Shot taken - Resetting Bonus Damage Unitvalue to 0 & removing effect");
					EffectState.RemoveEffect(NewGameState,NewGameState);
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

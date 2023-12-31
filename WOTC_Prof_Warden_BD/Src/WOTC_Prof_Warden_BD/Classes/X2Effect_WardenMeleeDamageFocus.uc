class X2Effect_WardenMeleeDamageFocus extends X2Effect_Persistent config (Wardenskills);

var config int MELEEFOCUS_MAXIMUM_BONUS;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local XComGameState_Item			SourceWeapon;
	local X2Effect_ApplyWeaponDamage	DamageEffect;
	local UnitValue						UV, UV2;
	local int							BonusDamage;

	SourceWeapon = AbilityState.GetSourceWeapon();
	Attacker.GetUnitValue(class'X2Ability_Warden'.default.MeleeStanceValueName, UV2);
	
	// If the source weapon exists
	if (SourceWeapon != none)
		{
		//If source weapon is secondary and unit is in melee stance
		If(SourceWeapon.InventorySlot == eInvSlot_SecondaryWeapon && int(UV2.fValue) == 1)
				{
				`log("Unit is using sword from melee stance - grant bonus damage:");
				// Fetch the sword focus counter from the unit
				Attacker.GetUnitValue(class'X2Ability_Warden'.default.MeleeFocusCounterValueName, UV);
				BonusDamage = int(UV.fValue);
				`log("Current value of Melee Stance Counter is: " @UV.fValue);			
				// Cap the maximum damage to 3
				if (BonusDamage > default.MELEEFOCUS_MAXIMUM_BONUS)
					{
					BonusDamage = default.MELEEFOCUS_MAXIMUM_BONUS;
					}
				`log("Adding bonus damage of: " @BonusDamage);
				//	no game state means it's for damage preview
				if (NewGameState == none)
					{				
					return BonusDamage;
					}
				//	only add the bonus damage when the damage effect is applying the weapon's base damage
				DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(AppliedData.EffectRef));
			
				if (DamageEffect != none && !DamageEffect.bIgnoreBaseDamage)
					{
					return BonusDamage;
					}			
				}
		}				
	return 0;
}

class X2Effect_WardenRangedDamageFocus extends X2Effect_Persistent;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local XComGameState_Item			SourceWeapon;
	local X2Effect_ApplyWeaponDamage	DamageEffect;
	local UnitValue						UV, UV2;
	local int							BonusDamage;

	// Get the weapon used for the attack
	SourceWeapon = AbilityState.GetSourceWeapon();
	
	// Get the current ranged stance unit value & assign locally
	Attacker.GetUnitValue(class'X2Ability_Warden'.default.RangedStanceValueName, UV2);
	
	// If the source weapon exists
	if (SourceWeapon != none)
		{
		//If source weapon is primary, unit is in melee stance & the attack isn't an overwatch shot
		If(SourceWeapon.InventorySlot == eInvSlot_PrimaryWeapon && int(UV2.fValue) == 1 && AbilityState.GetMyTemplateName() != 'Overwatch')
				{
				`log("Unit is using gun in ranged stance");
				// Fetch the gun focus counter from the unit
				Attacker.GetUnitValue(class'X2Ability_Warden'.default.GunFocusCounterValueName, UV);
				BonusDamage = int(UV.fValue) -1;
				`log("Current value of Ranged Stance Counter is: " @UV.fValue);		
				
				// Cap the maximum damage to 3
				if (BonusDamage > 3)
					{
					BonusDamage = 3;
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

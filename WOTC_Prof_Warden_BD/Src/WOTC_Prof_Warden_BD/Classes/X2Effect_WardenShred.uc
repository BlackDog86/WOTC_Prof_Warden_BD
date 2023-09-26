class X2Effect_WardenShred extends X2Effect_ApplyWeaponDamage config(WardenSkills);
/*
var config WeaponDamageValue WardenBladeShredder_BonusDmg;

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef)
{
	local WeaponDamageValue ShredValue;
	local X2WeaponTemplate WeaponTemplate;

	ShredValue = EffectDamageValue;             //  in case someone has set other fields in here, but not likely

	// Setting up guaranteed damage for HalfSword even if WardenBladeShredder is not active - this is done here so that the preview damage is not showing the wrong numbers - same goes for WardenWinding - EN Roa
	if ((SourceWeapon != none) && (SourceUnit != none) && !SourceUnit.HasSoldierAbility('WardenBladeShredder'))
	{
		WeaponTemplate = X2WeaponTemplate(SourceWeapon.GetMyTemplate());
		if (WeaponTemplate != none && AbilityState.IsMeleeAbility() && AbilityState.GetMyTemplateName() == 'WardenHalfSword')
		{
			ShredValue = class'X2Item_WardenWeapons'.default.WardenHalfSword_Dmg;
		}
		if (WeaponTemplate != none && AbilityState.IsMeleeAbility() && AbilityState.GetMyTemplateName() == 'WardenWinding')
		{
			ShredValue.Rupture += WindingRupture;
		}
	}

	if ((SourceWeapon != none) && (SourceUnit != none) && SourceUnit.HasSoldierAbility('WardenBladeShredder'))   // Only works if a unit has WardenBladeShredder - EN Roa
	{
		WeaponTemplate = X2WeaponTemplate(SourceWeapon.GetMyTemplate());
		if (WeaponTemplate != none && AbilityState.IsMeleeAbility())
		{
			ShredValue = default.WardenBladeShredder_BonusDmg;
						

			if (WeaponTemplate.WeaponTech == 'magnetic')
				ShredValue.Shred += default.WardenMagneticShred;
			else if (WeaponTemplate.WeaponTech == 'beam')
				ShredValue.Shred += default.WardenBeamShred;
			else
				ShredValue.Shred += default.WardenConventionalShred;
		}
	}
	return ShredValue;
}

DefaultProperties
{
	bAllowFreeKill=true
	bIgnoreBaseDamage=false
}
*/
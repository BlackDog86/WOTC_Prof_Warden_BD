class X2Effect_WardenSwordDamage extends X2Effect_ApplyWeaponDamage config(WardenSkills);

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef) 
{
	if (SourceUnit.IsUnitAffectedByEffectName('Warden_BD_SoulBlade'))
	EffectDamageValue.Damage = EffectDamageValue.Damage * 2;	
	return EffectDamageValue;
}
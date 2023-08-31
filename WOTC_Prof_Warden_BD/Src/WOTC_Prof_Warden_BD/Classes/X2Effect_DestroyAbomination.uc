class X2Effect_DestroyAbomination extends X2Effect_ApplyWeaponDamage;

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef)
{
    
	local WeaponDamageValue DamageValue; 

    DamageValue = EffectDamageValue;

    DamageValue.Damage = 1.5 * SourceUnit.GetMaxStat(eStat_HP);
	
    return DamageValue;
}

defaultproperties
{
    bIgnoreBaseDamage = true
}
// This is an Unreal Script
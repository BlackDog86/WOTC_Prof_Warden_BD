class X2Effect_EbbAndFlowDischarge extends X2Effect_ApplyWeaponDamage;

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef)
{
    local WeaponDamageValue DamageValue;
    local int PsiDamage;

    PsiDamage = int(SourceUnit.GetCurrentStat(eStat_PsiOffense) / 20);

    //`log("EbbAndFlowDischarge: PsiOffense=" $ SourceUnit.GetCurrentStat(eStat_PsiOffense) $ " Damage=" $ PsiDamage,,'BDLOG');

    DamageValue.Damage = PsiDamage;

    return DamageValue;
}
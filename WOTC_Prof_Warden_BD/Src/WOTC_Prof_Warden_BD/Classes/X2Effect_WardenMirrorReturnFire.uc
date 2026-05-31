class X2Effect_WardenMirrorReturnFire extends X2Effect_ApplyWeaponDamage;

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef)
{
    local WeaponDamageValue DamageValue;
    local UnitValue         DamageUV;
    local float             StoredDamage;

    SourceUnit.GetUnitValue('BD_MirrorReturnFireDamage', DamageUV);
    StoredDamage = DamageUV.fValue;

    `LOG("Mirror return fire - StoredDamage: " $ StoredDamage $ " MIRROR_RETURN_FULL_DAMAGE: " $ class'X2Ability_Warden'.default.MIRROR_RETURN_FULL_DAMAGE,,'BDLOG');

    if (class'X2Ability_Warden'.default.MIRROR_RETURN_FULL_DAMAGE && class'X2Effect_ApplyWeaponDamage'.default.GRAZE_DMG_MULT > 0)
    {
        DamageValue.Damage = int(StoredDamage / class'X2Effect_ApplyWeaponDamage'.default.GRAZE_DMG_MULT);
    }
    else
    {
        DamageValue.Damage = int(StoredDamage);
    }

    `LOG("Mirror return fire - Final damage to deal: " $ DamageValue.Damage,,'BDLOG');

    return DamageValue;
}
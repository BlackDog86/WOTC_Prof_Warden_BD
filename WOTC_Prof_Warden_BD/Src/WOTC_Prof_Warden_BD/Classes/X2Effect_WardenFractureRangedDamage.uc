class X2Effect_WardenFractureRangedDamage extends X2Effect_ApplyWeaponDamage;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local XComGameState_Unit        SourceUnit;
    local XComGameState_Ability     ImbueAmmoState;
    local StateObjectReference      ImbueAmmoRef;

    // Find source unit - read from History since we only need it
    // to look up the ImbueAmmo ability reference
    SourceUnit = XComGameState_Unit(
        `XCOMHISTORY.GetGameStateForObjectID(
            ApplyEffectParameters.SourceStateObjectRef.ObjectID));

    if (SourceUnit == none)
    {
        `LOG("FractureRangedDamage: SourceUnit not found, skipping",,'BDLOG');
        return;
    }

    // Find ImbueAmmo ability ref from the unit
    ImbueAmmoRef = SourceUnit.FindAbility('Warden_BD_ImbueAmmo');
    if (ImbueAmmoRef.ObjectID <= 0)
    {
        `LOG("FractureRangedDamage: ImbueAmmo ability not found, skipping",,'BDLOG');
        return;
    }

    // Get ImbueAmmo state from NewGameState - this is the shared mutable
    // object that FractureRanged_BuildGameState pre-modified with +3 charges
    // and that previous target iterations have already decremented
    ImbueAmmoState = XComGameState_Ability(
        NewGameState.GetGameStateForObjectID(ImbueAmmoRef.ObjectID));

    // If not in NewGameState yet, pull it in - this shouldn't normally
    // happen since FractureRanged_BuildGameState pre-adds it, but handles
    // edge cases gracefully
    if (ImbueAmmoState == none)
        ImbueAmmoState = XComGameState_Ability(
            NewGameState.ModifyStateObject(
                class'XComGameState_Ability', ImbueAmmoRef.ObjectID));

    if (ImbueAmmoState == none)
    {
        `LOG("FractureRangedDamage: Could not get mutable ImbueAmmo state, skipping",,'BDLOG');
        return;
    }

    // If no charges remain, skip this target - no damage applied
    if (ImbueAmmoState.iCharges <= 0)
    {
        `LOG("FractureRangedDamage: No charges remaining, skipping target",,'BDLOG');
        return;
    }

    // Consume one charge and apply damage via parent
    ImbueAmmoState.iCharges -= 1;

    `LOG("FractureRangedDamage: Charge consumed, " $ ImbueAmmoState.iCharges $ " remaining",,'BDLOG');

    super.OnEffectAdded(ApplyEffectParameters, kNewTargetState,
        NewGameState, NewEffectState);
}
class X2Effect_WardenFractureRangedDamage extends X2Effect_ApplyWeaponDamage;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local XComGameState_Unit        SourceUnit;
    local XComGameState_Ability     ImbueAmmoState;
    local StateObjectReference      ImbueAmmoRef;
    local XComGameState_Unit        TargetUnit;
    local UnitValue                 AlreadyHitUV;

    SourceUnit = XComGameState_Unit(
        `XCOMHISTORY.GetGameStateForObjectID(
            ApplyEffectParameters.SourceStateObjectRef.ObjectID));

    if (SourceUnit == none)
    {
        //`log("FractureRangedDamage: SourceUnit not found, skipping",,'BDLOG');
        return;
    }

    ImbueAmmoRef = SourceUnit.FindAbility('Warden_BD_ImbueAmmo');
    if (ImbueAmmoRef.ObjectID <= 0)
    {
        //`log("FractureRangedDamage: ImbueAmmo ability not found, skipping",,'BDLOG');
        return;
    }

    ImbueAmmoState = XComGameState_Ability(
        NewGameState.GetGameStateForObjectID(ImbueAmmoRef.ObjectID));

    if (ImbueAmmoState == none)
        ImbueAmmoState = XComGameState_Ability(
            NewGameState.ModifyStateObject(
                class'XComGameState_Ability', ImbueAmmoRef.ObjectID));

    if (ImbueAmmoState == none)
    {
        //`log("FractureRangedDamage: Could not get mutable ImbueAmmo state, skipping",,'BDLOG');
        return;
    }

    // Guard against double hits on the same target (primary + multi-target)
    TargetUnit = XComGameState_Unit(kNewTargetState);
    if (TargetUnit != none)
    {
        TargetUnit.GetUnitValue('BD_FractureRangedHit', AlreadyHitUV);
        if (AlreadyHitUV.fValue > 0)
        {
            //`log("FractureRangedDamage: Target already hit this activation, skipping",,'BDLOG');
            return;
        }
        TargetUnit = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', TargetUnit.ObjectID));
        TargetUnit.SetUnitFloatValue('BD_FractureRangedHit', 1, eCleanup_BeginTactical);
    }

    if (ImbueAmmoState.iCharges <= 0)
    {
        //`log("FractureRangedDamage: No charges remaining, skipping target",,'BDLOG');
        return;
    }

    ImbueAmmoState.iCharges -= 1;

    //`log("FractureRangedDamage: Charge consumed, " $ ImbueAmmoState.iCharges $ " remaining",,'BDLOG');

    super.OnEffectAdded(ApplyEffectParameters, kNewTargetState,
        NewGameState, NewEffectState);
}
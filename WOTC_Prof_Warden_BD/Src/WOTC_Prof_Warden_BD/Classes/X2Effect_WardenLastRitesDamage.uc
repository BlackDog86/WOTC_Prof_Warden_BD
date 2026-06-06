class X2Effect_WardenLastRitesDamage extends X2Effect_ApplyWeaponDamage config (WardenSkills);

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local UnitValue					ChargeCountUV;
    local int						ChargeCount;
    local XComGameState_Item		SourceWeapon;
    local XComGameState_Ability		AbilityState;
    local WeaponDamageValue			BaseDamageValue;
	local XComGameState_Unit		TargetUnit;
   
	TargetUnit = XComGameState_Unit(kNewTargetState);
    //`log("Target Unit:" @ TargetUnit.GetMyTemplateName(),,'BDLOG');
	TargetUnit.GetUnitValue(class'X2Effect_WardenLastRitesCharge'.default.LastRitesChargeCountValue, ChargeCountUV);
    ChargeCount = int(ChargeCountUV.fValue);

    if (ChargeCount <= 0)
    {
        //`log("LastRitesDamage: No charges stored, skipping damage",,'BDLOG');
        return;
    }

    // Get source weapon to read base damage
    AbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(ApplyEffectParameters.AbilityStateObjectRef.ObjectID));
    if (AbilityState != none)
    {
        SourceWeapon = AbilityState.GetSourceWeapon();
        if (SourceWeapon != none)
        {
            SourceWeapon.GetBaseWeaponDamageValue(TargetUnit, BaseDamageValue);
            EffectDamageValue.Damage = (BaseDamageValue.Damage + class'X2Ability_Warden'.default.SOULBLADE_DAMAGE_BONUS) * ChargeCount;
            EffectDamageValue.Spread = BaseDamageValue.Spread * ChargeCount;
        }
    }

    // Shred equal to charge count, ignore base weapon damage since we calculated it manually
    EffectDamageValue.Shred = ChargeCount;
    bIgnoreBaseDamage = true;

    //`log("LastRitesDamage: Detonating with " $ ChargeCount $ " charges, damage: " $ EffectDamageValue.Damage,,'BDLOG');

    super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
}
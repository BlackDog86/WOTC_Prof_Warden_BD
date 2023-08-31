//Remove Everything!
class X2Effect_Consume extends X2Effect_RemoveEffectsByDamageType;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Unit		UnitState;
	local XComGameState_Ability		AbilityState;
	
	AbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(ApplyEffectParameters.AbilityStateObjectRef.ObjectID));
	UnitState = XComGameState_Unit(kNewTargetState);
		
	if (AbilityState != none && UnitState != none)
		`XEVENTMGR.TriggerEvent('DRFlyover', AbilityState, UnitState, NewGameState);
	
	super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
}

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local XComGameState_Item SourceWeapon;
	local WeaponDamageValue DamageValue;
	local XComGameState_Unit TargetUnit;

	TargetUnit = XComGameState_Unit(TargetDamageable);

	//  only add bonus damage on a crit, flanking, while in shadow
	if(AppliedData.AbilityResultContext.HitResult == eHit_Crit && Attacker.IsSuperConcealed() && TargetUnit != none && TargetUnit.IsFlanked(Attacker.GetReference()))
	{
		SourceWeapon = AbilityState.GetSourceWeapon();
		SourceWeapon.GetBaseWeaponDamageValue(none, DamageValue);

		// Double the Crit damage
		return DamageValue.Crit;
	}

	return 0;
}
class X2Effect_WardenMirrorReturnFire extends X2Effect_ApplyWeaponDamage;

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef)
{
	local DamageResult						LastDamageResult;	
	local WeaponDamageValue					DamageValue;		
	local int								i;

	If(SourceUnit.IsUnitAffectedByEffectName(class'X2Ability_Warden'.default.MirrorEffectName))
		{
		// Since some damage forms can occur 'after' the activating ability (e.g. grenade blowing up a car) we need to check the whole damageresults array
		for (i = 0; i < SourceUnit.DamageResults.Length; i++)
			{
				LastDamageResult = SourceUnit.DamageResults[i];	
				`LOG("Array position" @ i @ "Caused damage to unit of" @ LastDamageResult.DamageAmount);
				`LOG("Array position" @ i @ "Removed shield HP of" @ LastDamageResult.ShieldHP);
				`LOG("Array position" @ i @ "had ability context" @ LastDamageResult.Context);
				`LOG("Array position" @ i @ "ability object ID is" @ LastDamageResult.SourceEffect.AbilityStateObjectRef.ObjectID);
				if (LastDamageResult.SourceEffect.AbilityStateObjectRef.ObjectID != 0)		
					{
					DamageValue.Damage = LastDamageResult.DamageAmount;			
					`LOG("Damage to deal is" @ DamageValue.Damage);	
					}			
			}
		Return DamageValue;
		}
}
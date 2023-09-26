class X2Effect_WardenMirror extends X2Effect_DamageImmunity config(WardenSkills);

function bool ChangeHitResultForTarget(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, bool bIsPrimaryTarget, const EAbilityHitResult CurrentResult, out EAbilityHitResult NewHitResult)
{ 
	local X2AbilityToHitCalc_StandardAim	Aim;

		Aim = X2AbilityToHitCalc_StandardAim( AbilityState.GetMyTemplate().AbilityToHitCalc);
	If ( Aim == none || Aim.bReactionFire == false ) { return false;}

		switch (CurrentResult)
		{
		case eHit_Crit:
			NewHitResult = eHit_Graze;
			return true;
		case eHit_Success:
			NewHitResult = eHit_Graze;
			return true;
		case eHit_Graze:
			NewHitResult = eHit_Graze;
			return true;
		default:
			break;
		}	

	return false; 
}

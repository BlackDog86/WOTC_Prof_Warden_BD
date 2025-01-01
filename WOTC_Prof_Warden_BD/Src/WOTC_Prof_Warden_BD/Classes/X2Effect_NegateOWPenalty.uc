class X2Effect_NegateOWPenalty extends X2Effect_Persistent;

function ModifyReactionFireSuccess(XComGameState_Unit UnitState, XComGameState_Unit TargetState, out int Modifier)
{
	local float	StandardAim;
	local float	ReactionFireAim;

	StandardAim = UnitState.GetCurrentStat(eStat_Offense);
	ReactionFireAim = ((1.0f-class'X2AbilityToHitCalc_StandardAim'.default.REACTION_FINALMOD) * StandardAim);
	
	Modifier = Round(StandardAim - ReactionFireAim);	
}
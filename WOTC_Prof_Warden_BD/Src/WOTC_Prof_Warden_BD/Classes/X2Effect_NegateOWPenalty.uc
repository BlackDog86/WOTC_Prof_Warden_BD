class X2Effect_NegateOWPenalty extends X2Effect_Persistent;

function ModifyReactionFireSuccess(XComGameState_Unit UnitState, XComGameState_Unit TargetState, out int Modifier)
{
	local int	StandardAim;
	local float	ReactionFireAim;

	StandardAim = UnitState.GetCurrentStat(eStat_Offense);
	ReactionFireAim = Round(0.7 * StandardAim);
	
	Modifier = StandardAim - Int(ReactionFireAim);	
}
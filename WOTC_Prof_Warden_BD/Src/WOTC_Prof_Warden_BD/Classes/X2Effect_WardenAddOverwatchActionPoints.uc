class X2Effect_WardenAddOverwatchActionPoints extends X2Effect_ReserveOverwatchPoints;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Unit TargetUnitState;
	local int i;

	TargetUnitState = XComGameState_Unit(kNewTargetState);
	if( TargetUnitState != none )
	{
		for (i = 0; i < NumPoints; ++i)
		{
			TargetUnitState.ReserveActionPoints.AddItem(GetReserveType(ApplyEffectParameters, NewGameState));
		}
	}
}
class BD_Condition_ImmuneToFalling extends X2Condition;

event name CallMeetsCondition(XComGameState_BaseObject kTarget)
{ 
	local XComGameState_Unit TargetUnit;

	TargetUnit = XComGameState_Unit(kTarget);

	if ( !TargetUnit.GetMyTemplate().bImmueToFalling )
	{
		return 'AA_Success';
	}

	return 'AA_UnitIsWrongType';
}
class X2Condition_WardenTargetRankRequirement extends X2Condition;

// Variables to pass into the condition check:
var int		iMinRank;			//»» Values of -1 (default) mean no min/max
var int		iMaxRank;			//»» Values of -1 (default) mean no min/max
var string	LogEffectName;		//»» Used only to identify the indiviual effect within an ability being evaluated in the Log output.
var name	ExcludeProject;		//»» HQ Project that excludes effects with this condition, regardless of rank (used for projects that grant a higher tier effect, etc.)
var name	GiveProject;		//»» HQ Project that grants effects with this condition, regardless of rank (used for projects that grant this tier effect, etc.)


event name CallAbilityMeetsCondition(XComGameState_Ability kAbility, XComGameState_BaseObject kTarget)
{
	local XComGameState_Unit				SourceUnit;
	local int								iUnitRank;
	local XComGameState_Player				PlayerState;
		
	// Get Unit's XComGameState_Unit and Rank
	SourceUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(kAbility.OwnerStateObject.ObjectID));
	iUnitRank = SourceUnit.GetSoldierRank();
	
	// Check for Player Strategy Projects (AWC Unlocks) that should supercede rank checks
	PlayerState = XComGameState_Player(`XCOMHISTORY.GetGameStateForObjectID(SourceUnit.ControllingPlayer.ObjectID));
	if (PlayerState != none && PlayerState.SoldierUnlockTemplates.Length > 0 && ExcludeProject != '')
	{
		if (PlayerState.SoldierUnlockTemplates.Find(ExcludeProject) != -1) { return 'AA_UnitRankOutOfRange'; }
	}

	// If a maximum rank applies and the unit's rank is above this maximum, fail check
	if (iMaxRank != -1 && iUnitRank > iMaxRank) { return 'AA_UnitRankOutOfRange'; }

	if (PlayerState != none && PlayerState.SoldierUnlockTemplates.Length > 0 && GiveProject != '')
	{
		if (PlayerState.SoldierUnlockTemplates.Find(GiveProject) != -1) { return 'AA_Success'; }
	}

	// If a minimum rank applies and the target's rank is below this minimum, fail check
	if (iMinRank != -1 && iUnitRank < iMinRank) { return 'AA_UnitRankOutOfRange'; }

	return 'AA_Success';
}


defaultproperties
{
	iMinRank = -1
	iMaxRank = -1
}
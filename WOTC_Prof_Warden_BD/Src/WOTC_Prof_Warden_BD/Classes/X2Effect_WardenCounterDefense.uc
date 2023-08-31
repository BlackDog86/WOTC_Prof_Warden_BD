class X2Effect_WardenCounterDefense extends X2Effect_Persistent config(WardenSkills);

	var config int RANGEDSTANCE_I_CDEF_BONUS;
	var config int RANGEDSTANCE_II_CDEF_BONUS;
	var config int RANGEDSTANCE_III_CDEF_BONUS;
	var int AttackerRank;

function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{	
	local ShotModifierInfo				ModInfo;
	local GameRulesCache_VisibilityInfo VisInfo;
	local float 						TargetDefense;
	local int							DefenseReduction;

	// Do not apply modifiers to abilities coming from a weapon 
	if (EffectState.ApplyEffectParameters.ItemStateObjectRef.ObjectID != AbilityState.SourceWeapon.ObjectID) return;
	
	// Get target's Defense from character template (base stat) and from other effects.
	TargetDefense = Target.GetCurrentStat(eStat_Defense);

	//	Get target's Defense from Cover, if any.
	if (Target.CanTakeCover() && `TACTICALRULES.VisibilityMgr.GetVisibilityInfo(Attacker.ObjectID, Target.ObjectID, VisInfo))
	{	
		switch (VisInfo.TargetCover)
		{
			case CT_MidLevel:
				TargetDefense += class'X2AbilityToHitCalc_StandardAim'.default.LOW_COVER_BONUS;
			case CT_Standing:
				TargetDefense += class'X2AbilityToHitCalc_StandardAim'.default.HIGH_COVER_BONUS;
			default:
				break;
		}
	}
	
	// Don't need to compensate for enemy Defense if they don't have any.
	if (TargetDefense <= 0)
	{
		return;
	}	
	
	if (AttackerRank == 1)
	{
		DefenseReduction = default.RANGEDSTANCE_I_CDEF_BONUS;
	}
	else if (AttackerRank == 2)
	{
		DefenseReduction = default.RANGEDSTANCE_II_CDEF_BONUS;
	}
	else if (AttackerRank == 3)
	{
		DefenseReduction = default.RANGEDSTANCE_III_CDEF_BONUS;
	}

	ModInfo.ModType = eHit_Success;
	ModInfo.Reason = FriendlyName;
	ModInfo.Value = Min(TargetDefense, DefenseReduction); // Give bonus aim equal to the lowest between the target's current defense and defense reduction
	ShotModifiers.AddItem(ModInfo);
	
	// Test cases:
	// DefenseReduction = 20, TargetDefense = 60, Aim Bonus = 20.
	// DefenseReduction = 40, TargetDefense = 20, Aim Bonus = 20 (we can't compensate more defense than the target has)
}

defaultproperties
{
	DuplicateResponse = eDupe_Ignore
}
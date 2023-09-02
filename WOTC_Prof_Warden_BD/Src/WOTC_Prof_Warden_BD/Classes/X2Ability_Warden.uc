class X2Ability_Warden extends X2Ability config(Wardenskills);

// Global variables
var const name SpecialMomentumAP;
var const name MeleeStanceValueName;
var const name RangedStanceValueName;
var const name SoulBladeValueName;
var const name FlowAPGrantedValueName;
var const name MeleeStanceHitEffectName;
var const name MeleeStanceMobilityEffectName;
var const name RangedStanceCDefEffectName;
var const name RangedStanceReturnFireEffectName;
var const name EbbDefenseEffectName;
var const name FlowMobilityEffectName;
var const name KineticArmourEffectName;
var const name BlockadeDREffectName;
var const name BlockadeImmunityEffectName;
var const name KineticArmourRFEffectName;

//var config int	MELEESTANCE_I_HIT_BONUS;
//var config int	MELEESTANCE_II_HIT_BONUS;
//var config int	MELEESTANCE_III_HIT_BONUS;
var config int	MELEESTANCE_I_DAMAGE_BONUS;
var config int	MELEESTANCE_II_DAMAGE_BONUS;
var config int	MELEESTANCE_III_DAMAGE_BONUS;
var config int	MELEESTANCE_I_MOBILITY_BONUS;
var config int	MELEESTANCE_II_MOBILITY_BONUS;
var config int	MELEESTANCE_III_MOBILITY_BONUS;

var config int	RETURNFIRE_I_NUMBEROFTIMES;
var config int	RETURNFIRE_II_NUMBEROFTIMES;
var config int	RETURNFIRE_III_NUMBEROFTIMES;

var config int	KINETICARMOUR_I_SHIELDHP;
var config int	KINETICARMOUR_II_SHIELDHP;
var config int	KINETICARMOUR_III_SHIELDHP;
var config int	PILLAR_COOLDOWN;
var config int	PILLAR_DURATION;

var config array<name> DESTROYABOMINATION_PERMITTED_ENEMIES;

// Template creation - Do over-rides for cost based ability colours
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(Warden_BD_MeleeStance());	
	Templates.AddItem(Warden_BD_RangedStance());	
	Templates.AddItem(Warden_BD_EbbAndFlow());
	Templates.AddItem(Warden_BD_EbbAndFlowDummy());
	Templates.AddItem(Warden_BD_ApplyAdditionalDamage());
	Templates.AddItem(Warden_BD_Rewind());
	Templates.AddItem(Warden_BD_Blockade());	
	Templates.AddItem(Warden_BD_KineticArmour());
	Templates.AddItem(Warden_BD_KineticArmour_ReturnFire());
	Templates.AddItem(Warden_BD_SoulBlade());
	Templates.AddItem(Warden_BD_DestroyAbomination());	
//	Templates.AddItem(Warden_BD_Consume());
	Templates.AddItem(Warden_BD_Refocus());	
//	Templates.AddItem(Warden_BD_MindWard());	
//	Templates.AddItem(Warden_BD_Revenge());
//	Templates.AddItem(Warden_BD_Torrent());	
//	Templates.AddItem(Warden_BD_WardensRage());	
//	Templates.AddItem(Warden_BD_WardensMark());
//	Templates.AddItem(Warden_BD_WardensTide());
//	Templates.AddItem(Warden_BD_SilencingScream());	
//	Templates.AddItem(Warden_BD_Fissure());
//	Templates.AddItem(Warden_BD_WardensCharge());
//	Templates.AddItem(Warden_BD_Imprison());
//	Templates.AddItem(Warden_BD_WardensReflection());
//	Templates.AddItem(Warden_BD_StrongWill());
//	Templates.AddItem(Warden_BD_Retribution());
	Templates.AddItem(Warden_BD_Pillar());
	Templates.AddItem(WOTC_Prof_Warden_BD_AcademyAbility());
	return Templates;
}

// Melee Stance - Change speech lines, Add custom anim
static final function X2AbilityTemplate Warden_BD_MeleeStance()
{
	local X2AbilityTemplate										Template;
	local X2AbilityTrigger_EventListener						MeleeTrigger;
	local X2Effect_SetUnitValue									SetUnitValueEffect;
	local X2Effect_ClearUnitValue								ClearUnitValueEffect, ClearUnitValueEffect2;
	local X2Condition_WOTC_APA_Class_TargetRankRequirement		RankCondition1, RankCondition2, RankCondition3;
	local X2Effect_PersistentStatChange							MobilityEffect1, MobilityEffect2, MobilityEffect3;						

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_MeleeStance');

	// Create Ranks for Proficiency Effects
	RankCondition1 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition1.iMinRank = -1;	// No minimum rank for level 1 bonuses
	RankCondition1.iMaxRank = 2;	// Max rank is 1 below minimum rank for level 2 bonuses
	RankCondition1.LogEffectName = "Melee Hit 1";	// EffectName to use in logs
	RankCondition1.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock1';

	RankCondition2 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition2.iMinRank = 3;
	RankCondition2.iMaxRank = 5;
	RankCondition2.LogEffectName = "Melee Hit 2";
	RankCondition2.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock2';
	RankCondition2.GiveProject = 'WOTC_Prof_Warden_BD_Unlock1';
	
	RankCondition3 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition3.iMinRank = 6;
	RankCondition3.iMaxRank = -1;	// No max rank for level 3 bonuses
	RankCondition3.LogEffectName = "Melee Hit 3";
	RankCondition3.GiveProject = 'WOTC_Prof_Warden_BD_Unlock2';	 
	
	// # Icon Setup
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_swordSlash";
	SetHidden(Template);

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	

	MeleeTrigger = new class'X2AbilityTrigger_EventListener';
	MeleeTrigger.ListenerData.EventID = 'TriggerMeleeStance';
	MeleeTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	MeleeTrigger.ListenerData.Filter = eFilter_Unit;
	MeleeTrigger.ListenerData.Priority = 50;
	MeleeTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(MeleeTrigger);

	// # Shooter Conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	MobilityEffect1 = new class'X2Effect_PersistentStatChange';
	MobilityEffect1.EffectName = default.MeleeStanceMobilityEffectName;
	MobilityEffect1.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);
	MobilityEffect1.AddPersistentStatChange(eStat_Mobility, default.MELEESTANCE_I_MOBILITY_BONUS);
	MobilityEffect1.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	MobilityEffect1.DuplicateResponse = eDupe_Ignore;
	MobilityEffect1.TargetConditions.AddItem(RankCondition1);
	Template.AddTargetEffect(MobilityEffect1);

	MobilityEffect2 = new class'X2Effect_PersistentStatChange';
	MobilityEffect2.EffectName = default.MeleeStanceMobilityEffectName;
	MobilityEffect2.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);
	MobilityEffect2.AddPersistentStatChange(eStat_Mobility, default.MELEESTANCE_II_MOBILITY_BONUS);
	MobilityEffect2.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	MobilityEffect2.DuplicateResponse = eDupe_Ignore;
	MobilityEffect2.TargetConditions.AddItem(RankCondition2);
	Template.AddTargetEffect(MobilityEffect2);

	MobilityEffect3 = new class'X2Effect_PersistentStatChange';
	MobilityEffect3.EffectName = default.MeleeStanceMobilityEffectName;
	MobilityEffect3.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);
	MobilityEffect3.AddPersistentStatChange(eStat_Mobility, default.MELEESTANCE_III_MOBILITY_BONUS);
	MobilityEffect3.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	MobilityEffect3.DuplicateResponse = eDupe_Ignore;
	MobilityEffect3.TargetConditions.AddItem(RankCondition3);
	Template.AddTargetEffect(MobilityEffect3);
				
	SetUnitValueEffect = new Class'X2Effect_SetUnitValue';
	SetUnitValueEffect.UnitName = default.MeleeStanceValueName;
	SetUnitValueEffect.NewValueToSet = 1;
	SetUnitValueEffect.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetUnitValueEffect);

	ClearUnitValueEffect = new Class'X2Effect_ClearUnitValue';
	ClearUnitValueEffect.UnitValueName = default.RangedStanceValueName;
	Template.AddTargetEffect(ClearUnitValueEffect);

	ClearUnitValueEffect2 = new Class'X2Effect_ClearUnitValue';
	ClearUnitValueEffect2.UnitValueName = default.FlowAPGrantedValueName;
	`Log("I just cleared the Flow AP unitvalue from melee stance");
	Template.AddTargetEffect(ClearUnitValueEffect2);

	// # State and Visualization	
	Template.CustomSelfFireAnim = 'HL_IdleA';
	Template.Hostility = eHostility_Neutral;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;
}
// Ranged Stance - Change speech lines, Add custom anim
static final function X2AbilityTemplate Warden_BD_RangedStance()
{
	local X2AbilityTemplate										Template;	
	local X2AbilityTrigger_EventListener						RangedTrigger;
	local X2Effect_SetUnitValue									SetUnitValueEffect;
	local X2Effect_ClearUnitValue								ClearUnitValueEffect, ClearUnitValueEffect2;
	local X2Condition_WOTC_APA_Class_TargetRankRequirement		RankCondition1, RankCondition2, RankCondition3;
	local X2Effect_WardenCounterDefense							IgnoreCoverEffect1, IgnoreCoverEffect2, IgnoreCoverEffect3;
	local X2Effect_ReturnFire									ReturnFireEffect1,ReturnFireEffect2,ReturnFireEffect3;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_RangedStance');
	
	//Create Ranks for Proficiency Effects
	RankCondition1 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition1.iMinRank = -1;	// No minimum rank for level 1 bonuses
	RankCondition1.iMaxRank = 2;	// Max rank is 1 below minimum rank for level 2 bonuses
	RankCondition1.LogEffectName = "Ranged Hit 1";	// EffectName to use in logs
	RankCondition1.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock1';

	RankCondition2 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition2.iMinRank = 3;
	RankCondition2.iMaxRank = 5;
	RankCondition2.LogEffectName = "Melee Hit 2";
	RankCondition2.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock2';
	RankCondition2.GiveProject = 'WOTC_Prof_Warden_BD_Unlock1';
	
	RankCondition3 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition3.iMinRank = 6;
	RankCondition3.iMaxRank = -1;	// No max rank for level 3 bonuses
	RankCondition3.LogEffectName = "Ranged Hit 3";
	RankCondition3.GiveProject = 'WOTC_Prof_Warden_BD_Unlock2';	

	// # Icon Setup
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_runandgun";
	SetHidden(Template);

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	//Trigger ranged stance whenever anything fires off the appropriate eventlistener ID
	RangedTrigger = new class'X2AbilityTrigger_EventListener';
	RangedTrigger.ListenerData.EventID = 'TriggerRangedStance';
	RangedTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	RangedTrigger.ListenerData.Filter = eFilter_Unit;
	RangedTrigger.ListenerData.Priority = 50;
	RangedTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(RangedTrigger);

	// AND activate Ranged Stance at the start of combat 
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// # Shooter Conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	
	// # Effects	
	IgnoreCoverEffect1 = new class'X2Effect_WardenCounterDefense';
	IgnoreCoverEffect1.EffectName = default.RangedStanceCdefEffectName;
	IgnoreCoverEffect1.AttackerRank = 1;
	IgnoreCoverEffect1.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);	
	IgnoreCoverEffect1.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);
	IgnoreCoverEffect1.DuplicateResponse = eDupe_Ignore;
	IgnoreCoverEffect1.TargetConditions.AddItem(RankCondition1);	
	Template.AddTargetEffect(IgnoreCoverEffect1);

	IgnoreCoverEffect2 = new class'X2Effect_WardenCounterDefense';
	IgnoreCoverEffect2.EffectName = default.RangedStanceCdefEffectName;
	IgnoreCoverEffect2.AttackerRank = 2;
	IgnoreCoverEffect2.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);
	IgnoreCoverEffect2.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);
	IgnoreCoverEffect2.DuplicateResponse = eDupe_Ignore;
	IgnoreCoverEffect2.TargetConditions.AddItem(RankCondition2);	
	Template.AddTargetEffect(IgnoreCoverEffect2);

	IgnoreCoverEffect3 = new class'X2Effect_WardenCounterDefense';
	IgnoreCoverEffect3.EffectName = default.RangedStanceCdefEffectName;
	IgnoreCoverEffect3.AttackerRank = 3;
	IgnoreCoverEffect3.BuildPersistentEffect(1, true, false, false,eGameRule_PlayerTurnEnd);
	IgnoreCoverEffect3.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);
	IgnoreCoverEffect3.DuplicateResponse = eDupe_Ignore;
	IgnoreCoverEffect3.TargetConditions.AddItem(RankCondition3);	
	Template.AddTargetEffect(IgnoreCoverEffect3);
	
	ReturnFireEffect1 = new class'X2Effect_ReturnFire';	
	ReturnFireEffect1.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);
	ReturnFireEffect1.EffectName = default.RangedStanceReturnFireEffectName;
	ReturnFireEffect1.MaxPointsPerTurn = default.RETURNFIRE_I_NUMBEROFTIMES;
	ReturnFireEffect1.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,"", Template.AbilitySourceName);
	ReturnFireEffect1.DuplicateResponse = eDupe_Ignore;
	ReturnFireEffect1.TargetConditions.AddItem(RankCondition1);
	Template.AddTargetEffect(ReturnFireEffect1);

	ReturnFireEffect2 = new class'X2Effect_ReturnFire';
	ReturnFireEffect2.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);
	ReturnFireEffect2.EffectName = default.RangedStanceReturnFireEffectName;
	ReturnFireEffect2.MaxPointsPerTurn = default.RETURNFIRE_II_NUMBEROFTIMES;
	ReturnFireEffect2.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,"", Template.AbilitySourceName);
	ReturnFireEffect2.DuplicateResponse = eDupe_Ignore;
	ReturnFireEffect2.TargetConditions.AddItem(RankCondition2);
	Template.AddTargetEffect(ReturnFireEffect2);
	
	ReturnFireEffect3 = new class'X2Effect_ReturnFire';
	ReturnFireEffect3.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);
	ReturnFireEffect3.EffectName = default.RangedStanceReturnFireEffectName;
	ReturnFireEffect3.MaxPointsPerTurn = default.RETURNFIRE_III_NUMBEROFTIMES;
	ReturnFireEffect3.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,"", Template.AbilitySourceName);
	ReturnFireEffect3.DuplicateResponse = eDupe_Ignore;
	ReturnFireEffect3.TargetConditions.AddItem(RankCondition3);
	Template.AddTargetEffect(ReturnFireEffect3);

	SetUnitValueEffect = new Class'X2Effect_SetUnitValue';
	SetUnitValueEffect.UnitName = default.RangedStanceValueName;
	SetUnitValueEffect.NewValueToSet = 1;
	SetUnitValueEffect.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetUnitValueEffect);

	ClearUnitValueEffect = new Class'X2Effect_ClearUnitValue';
	ClearUnitValueEffect.UnitValueName = default.MeleeStanceValueName;
	Template.AddTargetEffect(ClearUnitValueEffect);

	ClearUnitValueEffect2 = new Class'X2Effect_ClearUnitValue';
	ClearUnitValueEffect2.UnitValueName = default.FlowAPGrantedValueName;
	`Log("I just cleared the Flow AP unitvalue from ranged stance");
	Template.AddTargetEffect(ClearUnitValueEffect2);

	// # State and Visualization
	Template.Hostility = eHostility_Neutral;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
	Template.CustomSelfFireAnim = 'HL_IdleA';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	// Set up eventlisteners
	Template.AddAbilityEventListener('AbilityActivated', SpecialAPTrigger_EventListenerFn, ELD_OnStateSubmitted, eFilter_Unit);
	Template.AddAbilityEventListener('AbilityActivated', ApplyAdditionalDamage_EventListenerFn, ELD_OnStateSubmitted, eFilter_Unit);

	return Template;
}

static final function X2AbilityTemplate Warden_BD_EbbAndFlowDummy()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCost_ActionPoints							ActionPointCost;	
	local X2Effect_Persistent									PersistentEffect;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_EbbAndFlowDummy');
	
	// # Icon Setup
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.IconImage = "img:///Warden_BD_PerkIcons.UIPerk_WardenFlow";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	Template.AbilityCosts.AddItem(ActionPointCost);		

	PersistentEffect = new class'X2Effect_Persistent';
	PersistentEffect.BuildPersistentEffect(1, false, true);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(PersistentEffect);

	// # Shooter Conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	
	// # State and Visualization
	// TODO: Figure out better activation speech (limited to existing lines in XComCharacterVoiceBank.uc)
	Template.ActivationSpeech = 'RunAndGun';
		
	// TODO: Figure out more fitting confirm sound or use standard.
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	Template.Hostility = eHostility_Neutral;
	Template.bShowActivation = true;
	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	
	return Template;
}

// Ebb & Flow
static final function X2AbilityTemplate Warden_BD_EbbandFlow()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCost_ActionPoints							ActionPointCost;	
	local X2Effect_TriggerEvent									TriggerMeleeEvent;
	local X2Effect_TriggerEvent									TriggerRangedEvent;
	local X2Condition_Unitvalue									CheckMeleeStance;
	local X2Condition_Unitvalue									CheckRangedStance;
	local X2Condition_Unitvalue									CheckFlowAPsGranted;
	local X2AbilityTrigger_EventListener						EventListener;
	local X2Effect_RemoveEffects								RemoveMeleeEffects, RemoveRangedEffects;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_EbbandFlow');
	
	// # Icon Setup
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_regeneration";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	
	
	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = 'PlayerTurnBegun';
	EventListener.ListenerData.Filter = eFilter_Player;
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(EventListener);

	// Check if flow APs were granted on the last turn
	CheckFlowAPsGranted = new Class'X2Condition_Unitvalue';
	CheckFlowAPsGranted.AddCheckValue(default.FlowAPGrantedValueName,1,eCheck_Exact);
	
	// Only fire if flow APs were granted before
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityShooterConditions.AddItem(CheckFlowAPsGranted);
	Template.AddShooterEffectExclusions();
	
	// Check if we're in melee stance
	CheckMeleeStance = new Class'X2Condition_Unitvalue';
	CheckMeleeStance.AddCheckValue(default.MeleeStanceValueName,1,eCheck_Exact);

	// Remove melee stance persistent effects if we're switching
	RemoveMeleeEffects = new Class'X2Effect_RemoveEffects';
	RemoveMeleeEffects.EffectNamesToRemove.AddItem(default.MeleeStanceHitEffectName);
	RemoveMeleeEffects.EffectNamesToRemove.AddItem(default.MeleeStanceMobilityEffectName);
	RemoveMeleeEffects.TargetConditions.AddItem(CheckMeleeStance);
	Template.AddTargetEffect(RemoveMeleeEffects);

	// Then trigger ranged stance
	TriggerRangedEvent = new Class'X2Effect_TriggerEvent';
	TriggerRangedEvent.TriggerEventName = 'TriggerRangedStance';
	TriggerRangedEvent.TargetConditions.AddItem(CheckMeleeStance);
	Template.AddTargetEffect(TriggerRangedEvent);

	// Check if we're in ranged stance
	CheckRangedStance = new Class'X2Condition_Unitvalue';
	CheckRangedStance.AddCheckValue(default.RangedStanceValueName,1,eCheck_Exact);

	//  If we are, remove ranged stance persistent effects 
	RemoveRangedEffects = new Class'X2Effect_RemoveEffects';
	RemoveRangedEffects.EffectNamesToRemove.AddItem(default.RangedStanceCDefEffectName);
	RemoveRangedEffects.EffectNamesToRemove.AddItem(default.RangedStanceReturnFireEffectName);
	RemoveRangedEffects.TargetConditions.AddItem(CheckRangedStance);
	Template.AddTargetEffect(RemoveRangedEffects);

	// Then trigger melee stance 
	TriggerMeleeEvent = new Class'X2Effect_TriggerEvent';
	TriggerMeleeEvent.TriggerEventName = 'TriggerMeleeStance';	
	TriggerMeleeEvent.TargetConditions.AddItem(CheckRangedStance);
	Template.AddTargetEffect(TriggerMeleeEvent);

	// TODO: Figure out more fitting confirm sound or use standard.
	Template.Hostility = eHostility_Neutral;
	Template.bShowActivation = false;
	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	
	return Template;

}
// Rewind
static function X2AbilityTemplate Warden_BD_Rewind()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2Condition_Unitvalue				CheckStance;
	local X2AbilityCooldown					Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Rewind');
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_codex_teleport";

	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// # Shooter Conditions - Unit must be in melee stance to activate the ability
	CheckStance = new Class'X2Condition_Unitvalue';
	CheckStance.AddCheckValue(default.MeleeStanceValueName,1,eCheck_Exact);
	Template.AbilityShooterConditions.AddItem(CheckStance);	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	
	// Vis
	Template.bSkipFireAction = false;
	Template.ModifyNewContextFn = Rewind_ModifyActivatedAbilityContext;	
	Template.BuildNewGameStateFn = class'X2Ability_Cyberus'.static.Teleport_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_Cyberus'.static.Teleport_BuildVisualization;
	Template.CinescriptCameraType = "Avatar_TriggerDamagedTeleport";
	
	return template;
}
// Blockade
static function X2AbilityTemplate Warden_BD_Blockade()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2Condition_Unitvalue				CheckStance;
	local X2AbilityCooldown					Cooldown;
	local X2Effect_Blockade					BlockadeDREffect;
	local X2Effect_DamageImmunity			BlockadeImmunityEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Blockade');
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_parry";

	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// # Shooter Conditions - ability user must fulfill these conditions before the ability can be used.
	CheckStance = new Class'X2Condition_Unitvalue';

	// Unit must be in melee stance to activate the ability
	CheckStance.AddCheckValue(default.MeleeStanceValueName,1,eCheck_Exact);
	Template.AbilityShooterConditions.AddItem(CheckStance);	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	// Create a persistent effect which reduces damage
	BlockadeDREffect = new class'X2Effect_Blockade';	
	BlockadeDREffect.EffectName = default.BlockadeDREffectName;
	BlockadeDREffect.BuildPersistentEffect(3, false, false, false, eGameRule_PlayerTurnEnd);
	BlockadeDREffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	BlockadeDREffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(BlockadeDREffect);

	// Create a persistent effect which grants immunity to mental status effects & psi damage
	BlockadeImmunityEffect = new class'X2Effect_DamageImmunity';
	BlockadeImmunityEffect.ImmuneTypes.AddItem('Mental');
    BlockadeImmunityEffect.ImmuneTypes.AddItem('Psi');
    BlockadeImmunityEffect.ImmuneTypes.AddItem('Unconscious');
	BlockadeImmunityEffect.EffectName = default.BlockadeImmunityEffectName;
	BlockadeImmunityEffect.BuildPersistentEffect(3, false, false, false, eGameRule_PlayerTurnEnd);
	BlockadeImmunityEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, "", Template.AbilitySourceName);	
	Template.AddTargetEffect(BlockadeImmunityEffect);

	// Vis
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	Template.Hostility = eHostility_Neutral;
	Template.bShowActivation = true;	
	Template.bSkipFireAction = false;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CustomSelfFireAnim = 'HL_IdleA';	

	return template;
}
// Kinetic Armour 
static final function X2AbilityTemplate Warden_BD_KineticArmour()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2Condition_UnitValue									CheckStance;
	local X2Effect_EnergyShield									KineticEffect1, KineticEffect2, KineticEffect3;
	local X2Condition_WOTC_APA_Class_TargetRankRequirement		RankCondition1, RankCondition2, RankCondition3;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_KineticArmour');
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_riposte";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CORPORAL_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	
	// Create Ranks for Proficiency Effects
	RankCondition1 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition1.iMinRank = -1;	// No minimum rank for level 1 bonuses
	RankCondition1.iMaxRank = 2;	// Max rank is 1 below minimum rank for level 2 bonuses
	RankCondition1.LogEffectName = "Kinetic Armour 1";	// EffectName to use in logs
	RankCondition1.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock1';

	RankCondition2 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition2.iMinRank = 3;
	RankCondition2.iMaxRank = 5;
	RankCondition2.LogEffectName = "Kinetic Armour 2";
	RankCondition2.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock2';
	RankCondition2.GiveProject = 'WOTC_Prof_Warden_BD_Unlock1';
	
	RankCondition3 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition3.iMinRank = 6;
	RankCondition3.iMaxRank = -1;	// No max rank for level 3 bonuses
	RankCondition3.LogEffectName = "Kinetic Armour 3";
	RankCondition3.GiveProject = 'WOTC_Prof_Warden_BD_Unlock2';	 

	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.DisplayTargetHitChance = false;
	Template.AbilityTargetStyle = default.SelfTarget;	

	// Ability trigger determines how it is activated. In this case - by the user manually.
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	
	// # Shooter Conditions - Must be in melee stance
	CheckStance = new Class'X2Condition_Unitvalue';
	CheckStance.AddCheckValue(default.MeleeStanceValueName,1,eCheck_Exact);
	Template.AbilityShooterConditions.AddItem(CheckStance);	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	
	// Set up persistent effect to create new armour
	KineticEffect1 = new class'X2Effect_EnergyShield';
	KineticEffect1.EffectName = default.KineticArmourEffectName;
	KineticEffect1.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);
	KineticEffect1.AddPersistentStatChange(eStat_ShieldHP, default.KINETICARMOUR_I_SHIELDHP);
	KineticEffect1.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	KineticEffect1.TargetConditions.AddItem(RankCondition1);
	Template.AddTargetEffect(KineticEffect1);

	KineticEffect2 = new class'X2Effect_EnergyShield';
	KineticEffect2.EffectName = default.KineticArmourEffectName;
	KineticEffect2.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);
	KineticEffect2.AddPersistentStatChange(eStat_ShieldHP, default.KINETICARMOUR_II_SHIELDHP);
	KineticEffect2.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	KineticEffect2.TargetConditions.AddItem(RankCondition2);
	Template.AddTargetEffect(KineticEffect2);

	KineticEffect3 = new class'X2Effect_EnergyShield';
	KineticEffect3.EffectName = default.KineticArmourEffectName;
	KineticEffect3.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnEnd);
	KineticEffect3.AddPersistentStatChange(eStat_ShieldHP, default.KINETICARMOUR_III_SHIELDHP);
	KineticEffect3.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	KineticEffect3.TargetConditions.AddItem(RankCondition3);
	Template.AddTargetEffect(KineticEffect3);
	
	// TODO: Figure out better activation speech (limited to existing lines in XComCharacterVoiceBank.uc)
	Template.ActivationSpeech = 'RunAndGun';

	// TODO: Figure out more fitting confirm sound or use standard.
	Template.AbilityConfirmSound = "TacticalUI_Activate_Ability_Run_N_Gun";

	// This will determine if this ability break concealment under default rules
	// And whether it's eligigible to Covering Fire reaction attacks.
	Template.Hostility = eHostility_Neutral;

	// This will tell TypicalAbility_BuildVisualization to display a flyover with the ability's LocFlyOverText when it's activated.
	Template.bShowActivation = true;

	// This will tell TypicalAbility_BuildVisualization to not play an activation animation for this ability. To be changed once we have an animation.
	Template.bSkipFireAction = false;

	// This function will apply game state changes caused by this ability. Use standard here.
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	// This function will visualize the ability (change the visual representation of the world caused by this ability). Use standard.
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CustomSelfFireAnim = 'HL_IdleA';
	// # Other properties
	// This will determine whether this ability can appear in randomly generated XCOM rows of other soldier classes.
	// Since this is a niche ability that applies only to melee damage, best not to make it cross-class.
	Template.bCrossClassEligible = false;
	
	// Add the return fire bit
	Template.AdditionalAbilities.AddItem('Warden_BD_KineticArmour_ReturnFire');
	
	return Template;
}
// Kinetic Armour Return Damage
Static final function X2AbilityTemplate Warden_BD_KineticArmour_ReturnFire()
{
	local X2AbilityTemplate						Template;
	local X2AbilityToHitCalc_PercentChance		ChanceToHit;
	local X2AbilityTrigger_EventListener		Trigger;
	local X2Effect_KineticArmourReturnFire		DamageEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_KineticArmour_ReturnFire');

	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Offensive;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_ReflectShot";

	ChanceToHit = new class'X2AbilityToHitCalc_PercentChance';
	ChanceToHit.PercentToHit = 100;
	Template.AbilityToHitCalc = ChanceToHit;

	Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'UnitTakeEffectDamage';
    Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = KineticArmourReturnFireListener;
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	DamageEffect = new class'X2Effect_KineticArmourReturnFire';	
	DamageEffect.EffectDamageValue.DamageType = 'Psi';
	DamageEffect.bBypassShields = true;
	DamageEffect.bIgnoreArmor = true;
	Template.AddTargetEffect(DamageEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;

	return Template;
}
// Soulblade TODO: Balance Effects, icon, voice, visualisation
static final function X2AbilityTemplate Warden_BD_SoulBlade()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2Condition_UnitValue									CheckStance;
	local X2Effect_PersistentStatChange							DummyEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_SoulBlade');
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_burn";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
		
	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 2;
	Template.AbilityCooldown = Cooldown;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.DisplayTargetHitChance = false;
	Template.AbilityTargetStyle = default.SelfTarget;	

	// Ability trigger determines how it is activated. In this case - by the user manually.
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// # Shooter Conditions - Unit must be in ranged stance to activate the ability
	CheckStance = new Class'X2Condition_Unitvalue';
	CheckStance.AddCheckValue(default.RangedStanceValueName,1,eCheck_Exact);
	Template.AbilityShooterConditions.AddItem(CheckStance);	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	
	// Create a persistent effect which does nothing - we need to do this to apply an effect which can be picked up by the wardensworddamage effect
	DummyEffect = new class'X2Effect_PersistentStatChange';	
	DummyEffect.BuildPersistentEffect(2, false, false, false, eGameRule_PlayerTurnEnd);
	DummyEffect.AddPersistentStatChange(eStat_Mobility, 0);
	DummyEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	Template.AddTargetEffect(DummyEffect);
	
	// TODO: Figure out better activation speech (limited to existing lines in XComCharacterVoiceBank.uc)
	Template.ActivationSpeech = 'RunAndGun';

	// TODO: Figure out more fitting confirm sound or use standard.
	Template.AbilityConfirmSound = "TacticalUI_Activate_Ability_Run_N_Gun";

	// This will determine if this ability break concealment under default rules
	// And whether it's eligigible to Covering Fire reaction attacks.
	Template.Hostility = eHostility_Neutral;

	// This will tell TypicalAbility_BuildVisualization to display a flyover with the ability's LocFlyOverText when it's activated.
	Template.bShowActivation = true;

	// This will tell TypicalAbility_BuildVisualization to not play an activation animation for this ability. To be changed once we have an animation.
	Template.bSkipFireAction = true;

	// This function will apply game state changes caused by this ability. Use standard here.
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	// This function will visualize the ability (change the visual representation of the world caused by this ability). Use standard.
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	// # Other properties
	// This will determine whether this ability can appear in randomly generated XCOM rows of other soldier classes.
	// Since this is a niche ability that applies only to melee damage, best not to make it cross-class.
	Template.bCrossClassEligible = false;
	
	return Template;
}
// Destroy Abomination - Customisation only needed now :)
static final function X2AbilityTemplate Warden_BD_DestroyAbomination()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2Condition_UnitValue									CheckStance;
	local X2Condition_Visibility								VisibilityCondition;
	local X2Condition_UnitType									PermittedUnits;
	local X2Effect_DestroyAbomination							DestroyAbominationDamageEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_DestroyAbomination');
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	// Set a new icon
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_archon_blast";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
		
	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 2;
	Template.AbilityCooldown = Cooldown;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// Targeting Details
	// Always hits
	Template.AbilityToHitCalc = default.DeadEye;
	Template.DisplayTargetHitChance = false;
	// Can only shoot visible enemies
	VisibilityCondition = new class'X2Condition_Visibility';
	VisibilityCondition.bRequireGameplayVisible = true;
	VisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(VisibilityCondition);
	// Can't target dead; Can't target friendlies
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	// Only at single targets that are in range.
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	// Use only specific unit types as defined in the config array to the targetting list
	PermittedUnits = new class'X2Condition_UnitType';
	PermittedUnits.IncludeTypes = default.DESTROYABOMINATION_PERMITTED_ENEMIES;
	Template.AbilityTargetConditions.AddItem(PermittedUnits);
	
	// Ability trigger determines how it is activated. In this case - by the user manually.
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// # Shooter Conditions - Unit must be in ranged stance to activate the ability
	CheckStance = new Class'X2Condition_Unitvalue';
	CheckStance.AddCheckValue(default.RangedStanceValueName,1,eCheck_Exact);
	Template.AbilityShooterConditions.AddItem(CheckStance);	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	
	// Apply the destroy abomination damage
	DestroyAbominationDamageEffect = new class'X2Effect_DestroyAbomination';
	Template.AddTargetEffect(DestroyAbominationDamageEffect);
				
	// TODO: Figure out better activation speech (limited to existing lines in XComCharacterVoiceBank.uc)
	Template.ActivationSpeech = 'RunAndGun';

	// TODO: Figure out more fitting confirm sound or use standard.
	Template.AbilityConfirmSound = "TacticalUI_Activate_Ability_Run_N_Gun";

	// This will determine if this ability break concealment under default rules
	// And whether it's eligigible to Covering Fire reaction attacks.
	Template.Hostility = eHostility_Neutral;

	// This will tell TypicalAbility_BuildVisualization to display a flyover with the ability's LocFlyOverText when it's activated.
	Template.bShowActivation = true;

	// This will tell TypicalAbility_BuildVisualization to not play an activation animation for this ability. To be changed once we have an animation.
	Template.bSkipFireAction = false;

	// This function will apply game state changes caused by this ability. Use standard here.
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	// This function will visualize the ability (change the visual representation of the world caused by this ability). Use standard.
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	// Use the advent general mark animation for the ability
	Template.CustomFireAnim = 'HL_SignalPointAttackA';

	// # Other properties
	// This will determine whether this ability can appear in randomly generated XCOM rows of other soldier classes.
	// Since this is a niche ability that applies only to melee damage, best not to make it cross-class.
	Template.bCrossClassEligible = false;

	return Template;
}
// Consume - Modify from medikit remove effects code
static function X2AbilityTemplate Warden_BD_Consume(name AbilityName, int HealAmount)
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityTarget_Single				SingleTarget;
	local X2AbilityPassiveAOE_SelfRadius		PassiveAOEStyle;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput			InputTrigger;
	local X2Effect_Consume						ConsumeEffect;
	local array<name>							SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Consume');

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.OnlyIncludeTargetsInsideWeaponRange = true;
	SingleTarget.bIncludeSelf = false;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = false;
	UnitPropertyCondition.ExcludeRobotic = false;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	ConsumeEffect = new class'X2Effect_Consume';	
	Template.AddTargetEffect(ConsumeEffect);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_medkit";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.ActivationSpeech = 'HealingAlly';

	Template.CustomSelfFireAnim = 'FF_FireMedkitSelf';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}
// Sacrifice - Change To Mind Ward
static function X2AbilityTemplate Warden_BD_MindWard()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCooldown                     Cooldown;
	local X2AbilityCost_ActionPoints            ActionPointCost;
	local X2Effect_DLC_3SacrificeShield         ShieldEffect;
	local X2Effect_PersistentStatChange         StatChange;
	local X2Effect_BonusArmor                   ArmorEffect;
	local X2AbilityMultiTarget_AllAllies        AllAlliesMultiTarget;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_MindWard');
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_DLC3Images.UIPerk_spark_sacrifice";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = new class'X2AbilityTarget_Cursor';
	Template.TargetingMethod = class'X2TargetingMethod_DLC_3_SparkSacrifice';

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	AllAlliesMultiTarget = new class'X2AbilityMultiTarget_AllAllies';
	AllAlliesMultiTarget.bUseAbilitySourceAsPrimaryTarget = true;
	Template.AbilityMultiTargetStyle  = AllAlliesMultiTarget;

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	ShieldEffect = new class'X2Effect_DLC_3SacrificeShield';
	ShieldEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	ShieldEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage);
	Template.AddMultiTargetEffect(ShieldEffect);

	StatChange = new class'X2Effect_PersistentStatChange';
	StatChange.EffectName = 'SacrificeStats';
	StatChange.AddPersistentStatChange(eStat_Defense, 10);
	StatChange.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	StatChange.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage);
	Template.AddShooterEffect(StatChange);

	ArmorEffect = new class'X2Effect_BonusArmor';
	ArmorEffect.EffectName = 'SacrificeArmor';
	ArmorEffect.ArmorMitigationAmount = 2;
	ArmorEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	//  do not enable display info as the stat effect will cover the display
	Template.AddShooterEffect(ArmorEffect);

	Template.CustomFireAnim = 'FF_Sacrifice';
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}
// Refocus TODO: Icon, voice, visualisation
static final function X2AbilityTemplate Warden_BD_Refocus()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
//	local X2Effect_TriggerEvent									TriggerMeleeEvent;
//	local X2Effect_TriggerEvent									TriggerRangedEvent;
//	local X2Condition_Unitvalue									CheckMeleeStance;
//	local X2Condition_Unitvalue									CheckRangedStance;
	local X2Effect_GrantActionPoints							ActionPointEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Refocus');
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_shotfocused";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
		
	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 5;
	Template.AbilityCooldown = Cooldown;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	Template.AbilityCosts.AddItem(ActionPointCost);

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.DisplayTargetHitChance = false;
	Template.AbilityTargetStyle = default.SelfTarget;	

	// Ability trigger determines how it is activated. In this case - by the user manually.
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// Effect conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	
	// # Effects
	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.RunAndGunActionPoint;
	Template.AddTargetEffect(ActionPointEffect);

	// TODO: Figure out better activation speech (limited to existing lines in XComCharacterVoiceBank.uc)
	Template.ActivationSpeech = 'RunAndGun';

	// TODO: Figure out more fitting confirm sound or use standard.
	Template.AbilityConfirmSound = "TacticalUI_Activate_Ability_Run_N_Gun";

	// This will determine if this ability break concealment under default rules
	// And whether it's eligigible to Covering Fire reaction attacks.
	Template.Hostility = eHostility_Neutral;

	// This will tell TypicalAbility_BuildVisualization to display a flyover with the ability's LocFlyOverText when it's activated.
	Template.bShowActivation = true;

	// This will tell TypicalAbility_BuildVisualization to not play an activation animation for this ability. To be changed once we have an animation.
	Template.bSkipFireAction = true;

	// This function will apply game state changes caused by this ability. Use standard here.
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	// This function will visualize the ability (change the visual representation of the world caused by this ability). Use standard.
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	// # Other properties
	// This will determine whether this ability can appear in randomly generated XCOM rows of other soldier classes.
	// Since this is a niche ability that applies only to melee damage, best not to make it cross-class.
	Template.bCrossClassEligible = false;
	
	Template.PostActivationEvents.AddItem('GrantRGAP');

	return Template;
}
// ApplyAdditionalDamage: Hidden ability to apply bonus psi damage to target
static function X2AbilityTemplate Warden_BD_ApplyAdditionalDamage()
{
	local X2AbilityTemplate										Template;
	local X2AbilityTrigger_EventListener						Trigger;
	local X2Condition_UnitProperty								LivingTargetProperty;	
	local X2Effect_WardenSwordDamage							AdditionalDamageEffect1, AdditionalDamageEffect2, AdditionalDamageEffect3;
	local X2Condition_WOTC_APA_Class_TargetRankRequirement		RankCondition1, RankCondition2, RankCondition3;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_ApplyAdditionalDamage');

	// Create Ranks for Proficiency Effects
	RankCondition1 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition1.iMinRank = -1;	// No minimum rank for level 1 bonuses
	RankCondition1.iMaxRank = 2;	// Max rank is 1 below minimum rank for level 2 bonuses
	RankCondition1.LogEffectName = "Melee Stance Damage 1";	// EffectName to use in logs
	RankCondition1.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock1';

	RankCondition2 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition2.iMinRank = 3;
	RankCondition2.iMaxRank = 5;
	RankCondition2.LogEffectName = "Melee Stance Damage 2";
	RankCondition2.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock2';
	RankCondition2.GiveProject = 'WOTC_Prof_Warden_BD_Unlock1';
	
	RankCondition3 = new class 'X2Condition_WOTC_APA_Class_TargetRankRequirement';
	RankCondition3.iMinRank = 6;
	RankCondition3.iMaxRank = -1;	// No max rank for level 3 bonuses
	RankCondition3.LogEffectName = "Melee Stance Damage 3";
	RankCondition3.GiveProject = 'WOTC_Prof_Warden_BD_Unlock2';	

	// Icon Setup
	Template.IconImage = "img:///IRIPerkPack_UILibrary.UIPerk_Singe";
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Sethidden(Template);

	// Targeting and Triggering
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityToHitCalc = default.DeadEye;

	Trigger = new class'X2AbilityTrigger_EventListener';	
	Trigger.ListenerData.EventID = 'AbilityActivated';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.Priority = 52;
	Trigger.ListenerData.EventFn = ApplyAdditionalDamage_EventListenerFn;
	Template.AbilityTriggers.AddItem(Trigger);

	// Shooter Conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	// Target Conditions
	// TODO: Visibility condition!
	LivingTargetProperty = new class'X2Condition_UnitProperty';
	LivingTargetProperty.ExcludeAlive = false;
	LivingTargetProperty.ExcludeDead = true;
	LivingTargetProperty.ExcludeFriendlyToSource = false;
	LivingTargetProperty.ExcludeHostileToSource = false;
	Template.AbilityTargetConditions.AddItem(LivingTargetProperty);
	
	// Ability Effects
	AdditionalDamageEffect1 = new class'X2Effect_WardenSwordDamage';
	AdditionalDamageEffect1.EffectDamageValue.DamageType = 'Psi';
	AdditionalDamageEffect1.EffectDamageValue.Damage = default.MELEESTANCE_I_DAMAGE_BONUS;
	AdditionalDamageEffect1.bAllowFreeKill = false;
	AdditionalDamageEffect1.bAllowWeaponUpgrade = false;
	AdditionalDamageEffect1.bIgnoreBaseDamage = true;
	AdditionalDamageEffect1.bBypassShields = true;
	AdditionalDamageEffect1.bIgnoreArmor = true;
	AdditionalDamageEffect1.TargetConditions.AddItem(RankCondition1);
	Template.AddTargetEffect(AdditionalDamageEffect1);

	AdditionalDamageEffect2 = new class'X2Effect_WardenSwordDamage';
	AdditionalDamageEffect2.EffectDamageValue.DamageType = 'Psi';
	AdditionalDamageEffect2.EffectDamageValue.Damage = default.MELEESTANCE_II_DAMAGE_BONUS;
	AdditionalDamageEffect2.bAllowFreeKill = false;
	AdditionalDamageEffect2.bAllowWeaponUpgrade = false;
	AdditionalDamageEffect2.bIgnoreBaseDamage = true;
	AdditionalDamageEffect2.bBypassShields = true;
	AdditionalDamageEffect2.bIgnoreArmor = true;
	AdditionalDamageEffect2.TargetConditions.AddItem(RankCondition2);
	Template.AddTargetEffect(AdditionalDamageEffect2);

	AdditionalDamageEffect3 = new class'X2Effect_WardenSwordDamage';
	AdditionalDamageEffect3.EffectDamageValue.DamageType = 'Psi';
	AdditionalDamageEffect3.EffectDamageValue.Damage = default.MELEESTANCE_III_DAMAGE_BONUS;
	AdditionalDamageEffect3.bAllowFreeKill = false;
	AdditionalDamageEffect3.bAllowWeaponUpgrade = false;
	AdditionalDamageEffect3.bBypassShields = true;
	AdditionalDamageEffect2.bIgnoreArmor = true;
	AdditionalDamageEffect3.bIgnoreBaseDamage = true;
	AdditionalDamageEffect3.TargetConditions.AddItem(RankCondition3);
	Template.AddTargetEffect(AdditionalDamageEffect3);

	// State and Vis
	Template.FrameAbilityCameraType = eCameraFraming_Never; 
	Template.bSkipExitCoverWhenFiring = true;
	Template.bSkipFireAction = true;
	Template.bShowActivation = true;
	Template.bUsesFiringCamera = false;
	Template.Hostility = eHostility_Neutral;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = ApplyAdditionalDamage_BuildVisualization;
	Template.MergeVisualizationFn = ApplyAdditionalDamage_MergeVisualization;
	Template.BuildInterruptGameStateFn = none;

	return Template;
}
// Pillar
static final function X2AbilityTemplate Warden_BD_Pillar()
{
	local X2AbilityTemplate				Template;
	local X2AbilityTarget_Cursor		Cursor;
	local X2AbilityMultiTarget_Radius	RadiusMultiTarget;
	local X2AbilityCost_ActionPoints	ActionPointCost;
	local X2Effect_MZPillar				PillarEffect;
	local X2AbilityCooldown				Cooldown;
	local X2Condition_UnitValue			CheckStance;
	local X2Effect_RemoveEffects		RemoveFlowEffects;
	local X2Effect_RemoveEffects		RemoveEbbEffects;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Pillar');

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.TargetingMethod = class'X2TargetingMethod_Pillar';

	Cursor = new class'X2AbilityTarget_Cursor';
	Cursor.bRestrictToSquadsightRange = true;
	Template.AbilityTargetStyle = Cursor;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = 0.25; // small amount so it just grabs one tile
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PILLAR_COOLDOWN;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.CustomFireAnim = 'HL_SignalPointAttackA';
	Template.ActivationSpeech = 'RunandGun';

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Defensive;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Pillar";
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.ConcealmentRule = eConceal_Never;

	// Melee Stance Only
	CheckStance = new Class'X2Condition_Unitvalue';	
	CheckStance.AddCheckValue(default.MeleeStanceValueName,1,eCheck_Exact);
	Template.AbilityShooterConditions.AddItem(CheckStance);	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	
	PillarEffect = new class'X2Effect_MZPillar';		
	PillarEffect.Duration = default.PILLAR_DURATION;
	PillarEffect.BuildPersistentEffect(default.PILLAR_DURATION, false, true, false, eGameRule_PlayerTurnBegin);	
	PillarEffect.DestructibleArchetype = "FX_Templar_Pillar.Pillar_Destructible";
	Template.AddShooterEffect(PillarEffect);
	
	// Remove Ebb & Flow Effects
	RemoveFlowEffects = new Class'X2Effect_RemoveEffects';
	RemoveFlowEffects.EffectNamesToRemove.AddItem(default.FlowMobilityEffectName);
	Template.AddTargetEffect(RemoveFlowEffects);

	RemoveEbbEffects = new Class'X2Effect_RemoveEffects';
	RemoveEbbEffects.EffectNamesToRemove.AddItem(default.EbbDefenseEffectName);
	Template.AddTargetEffect(RemoveEbbEffects);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = Pillar_BuildVisualization;
	
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}
//	========================================
//				Event Listeners
//	========================================

// Flow AP Event Listener
static final function EventListenerReturn SpecialAPTrigger_EventListenerFn(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
    local XComGameState_Ability         ActivatedAbilityState;
    local X2AbilityTemplate             AbilityTemplate;
    local XComGameState_Unit            SourceUnit; 
	local XComGameState_Item            SourceWeapon;
	local UnitValue						UV;   
    local XComGameStateContext_Ability  AbilityContext; 
		    
    AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
    if(AbilityContext == none || AbilityContext.InterruptionStatus == eInterruptionStatus_Interrupt)
        return ELR_NoInterrupt;

	// This is the ability state of the ability that triggered the 'AbilityActivated' event.
    // When that event is triggered, you get the ability state object as EventData.
    ActivatedAbilityState = XComGameState_Ability(EventData);

    // Check ability exists and is not triggered at the start of the mission
    if (ActivatedAbilityState == none)
        return ELR_NoInterrupt;  		

    // Fallback if there is no unit
    SourceUnit = XComGameState_Unit(EventSource);
    if (SourceUnit == none)     
        return ELR_NoInterrupt; 
   
	// Fallback if no template
    AbilityTemplate = ActivatedAbilityState.GetMyTemplate();
    if (AbilityTemplate == none)
        return ELR_NoInterrupt;
	
	// fallback if it's not offensive
    if (AbilityTemplate.Hostility != eHostility_Offensive)
        return ELR_NoInterrupt;  
        
    // fallback if it does no damage
     if (!AbilityTemplate.TargetEffectsDealDamage(SourceWeapon, ActivatedAbilityState))
        return ELR_NoInterrupt;

	// Fallback if no weapon
	SourceWeapon = ActivatedAbilityState.GetSourceWeapon();
    if (SourceWeapon == none)
        return ELR_NoInterrupt;  
		
	// Fallback if flow APs have been granted already
	If (SourceUnit.GetUnitValue(default.FlowAPGrantedValueName, UV))
		return ELR_NoInterrupt;
		
	// Grant APs if turn ending sword attach in Melee stance
    if (SourceUnit.GetUnitValue(default.MeleeStanceValueName, UV) && SourceWeapon.InventorySlot == eInvSlot_SecondaryWeapon && SourceUnit.NumAllActionPoints() == 0)
    {
        `LOG("The ability which activated this listener for melee is:" @ ActivatedAbilityState.GetMyTemplateName());
		GrantFlowAP(SourceUnit);        
    }

	// Grant APs if turn ending bullpup attack in Ranged stance
    else if (SourceUnit.GetUnitValue(default.RangedStanceValueName, UV) && SourceWeapon.InventorySlot == eInvSlot_PrimaryWeapon && SourceUnit.NumAllActionPoints() == 0)
    {
        `LOG("The ability which activated this listener for ranged is:" @ ActivatedAbilityState.GetMyTemplateName());
		GrantFlowAP(SourceUnit);
    }
	return ELR_NoInterrupt;
}
// Melee-Stance Additional Damage EventListener
static final function EventListenerReturn ApplyAdditionalDamage_EventListenerFn(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
	local XComGameStateContext_Ability	AbilityContext;
	local XComGameState_Ability			AbilityState;
	local XComGameState_Ability			ApplyAdditionalDamageAbilityState;
	local XComGameStateContext			FindContext;
    local int							VisualizeIndex;
	local XComGameStateHistory			History;
	local X2AbilityTemplate				AbilityTemplate;
	local X2Effect						Effect;
	local XComGameState_Item			SourceWeapon;
	local XComGameState_Unit			SourceUnit;
	local UnitValue						UV;

	// Fallback on interrupt or if no context
	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if (AbilityContext == none || AbilityContext.InterruptionStatus == eInterruptionStatus_Interrupt)
		return ELR_NoInterrupt;

	// Triggered by 'Activate Ability' Event
	AbilityState = XComGameState_Ability(EventData);	
	if (AbilityState == none)
		return ELR_NoInterrupt;
	
	// Fallback if ability is not attached to the sword 
	SourceWeapon = AbilityState.GetSourceWeapon();
	If (SourceWeapon.InventorySlot != eInvSlot_SecondaryWeapon)
		return ELR_NoInterrupt;  	
		
	SourceUnit = XComGameState_Unit(EventSource);
	//Fallback if No Unit
	    if (SourceUnit == none)     
        return ELR_NoInterrupt;

	// Fallback if Ranged Stance uses Sword
	if (SourceUnit.GetUnitValue(default.RangedStanceValueName, UV) && SourceWeapon.InventorySlot == eInvSlot_SecondaryWeapon)
	return ELR_NoInterrupt; 
	
	// Prevent the ability triggering its-self
	ApplyAdditionalDamageAbilityState = XComGameState_Ability(CallbackData);
	if (ApplyAdditionalDamageAbilityState == none ||
		AbilityContext.InputContext.AbilityTemplateName == ApplyAdditionalDamageAbilityState.GetMyTemplateName()) 
	return ELR_NoInterrupt;

	// Fallback if no template
	AbilityTemplate = AbilityState.GetMyTemplate();
	if (AbilityTemplate == none)
		return ELR_NoInterrupt;
		
	History = `XCOMHISTORY;

	// Trigger against primary target of the triggering ability, if it exists, the ability is capable of dealing damage, and it hit.
		if (AbilityContext.InputContext.PrimaryTarget.ObjectID != 0 && AbilityContext.IsResultContextHit())
	{
		foreach AbilityTemplate.AbilityTargetEffects(Effect)
		{
			if (Effect.bAppliesDamage)
			{
				//	Calculate Visualize Index for later use by Merge Vis Fn.
				VisualizeIndex = GameState.HistoryIndex;
				FindContext = AbilityContext;
				while (FindContext.InterruptionHistoryIndex > -1)
				{
					FindContext = History.GetGameStateFromHistory(FindContext.InterruptionHistoryIndex).GetContext();
					VisualizeIndex = FindContext.AssociatedState.HistoryIndex;
				}
				// Do the second attack against the target
				ApplyAdditionalDamageAbilityState.AbilityTriggerAgainstSingleTarget(AbilityContext.InputContext.PrimaryTarget, false, VisualizeIndex);		
				break;
			}
		}
	}
	
	return ELR_NoInterrupt;
}
// Kinetic Armour EventListener
static final function EventListenerReturn KineticArmourReturnFireListener(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
	//local XComGameState_Unit				DamagedUnit;
	local XComGameState_Unit				DamageSourceUnit;
	local XComGameState_Ability				AbilityState;
	local XComGameStateContext_Ability		AbilityContext;
	local XComGameStateHistory				History;

	History = `XCOMHISTORY;
	
	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	AbilityState = XComGameState_Ability(CallbackData);
	
	`LOG("Kinetic Armour Listener Fired - Ability Context is " @ AbilityContext.name);
	`LOG("Kinetic Armour Listener Fired - Ability Object ID is " @ AbilityState.ObjectID);
	if (AbilityContext != none)
	{		
		//DamagedUnit = XComGameState_Unit(EventSource);
		DamageSourceUnit = XComGameState_Unit(GameState.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));	
		// Not sure why the codex ability checks the gamestate history if the unit is empty but OK...
		if( DamageSourceUnit == none )
		{
			DamageSourceUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));
		}		
		`Log("Kinetic Armour Listener Source Unit is " @ DamageSourceUnit.name);
		AbilityState.AbilityTriggerAgainstSingleTarget(DamageSourceUnit.GetReference(), false);
	}
	return ELR_NoInterrupt;	
}		

//	========================================
//				Visualisation Functions
//	========================================

// Melee-Stance Additional Damage Build Visualisation
final static function ApplyAdditionalDamage_BuildVisualization(XComGameState VisualizeGameState)
{	
	local XComGameStateVisualizationMgr					VisMgr;
	local XComGameStateContext_Ability					AbilityContext;
	local array<X2Action>								FindActions;
	local X2Action										FindAction;
	local X2Action										ChildAction;
	local VisualizationActionMetadata					ActionMetadata;
	local X2Action_MarkerNamed							EmptyAction;
	local X2Action_ApplyWeaponDamageToTerrain			DamageTerrainAction;
	
	TypicalAbility_BuildVisualization(VisualizeGameState);

	VisMgr = `XCOMVISUALIZATIONMGR;
	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	VisMgr.GetNodesOfType(VisMgr.BuildVisTree, class'X2Action_ApplyWeaponDamageToTerrain', FindActions);

	foreach FindActions(FindAction)
	{
		DamageTerrainAction = X2Action_ApplyWeaponDamageToTerrain(FindAction);
		ActionMetadata = DamageTerrainAction.Metadata;

		foreach DamageTerrainAction.ChildActions(ChildAction)
		{
			VisMgr.ConnectAction(ChildAction, VisMgr.BuildVisTree, false);
		}

		// Nuke the original action out of the tree.
		EmptyAction = X2Action_MarkerNamed(class'X2Action'.static.CreateVisualizationActionClass(class'X2Action_MarkerNamed', AbilityContext));
		EmptyAction.SetName("ReplaceDamageTerrainAction");
		VisMgr.ReplaceNode(EmptyAction, DamageTerrainAction);
	}
}
// Melee-Stance Additional Damage Merge Visualisation
final static function ApplyAdditionalDamage_MergeVisualization(X2Action BuildTree, out X2Action VisualizationTree)
{
	local XComGameStateVisualizationMgr		VisMgr;
	local array<X2Action>					FindActions;
	local X2Action							FindAction;
	local X2Action							FireAction;
	local X2Action_MarkerTreeInsertBegin	MarkerStart;
	local X2Action_MarkerTreeInsertEnd		MarkerEnd;
	local X2Action							WaitAction;
	local X2Action							ChildAction;
	local X2Action_MarkerNamed				MarkerAction;
	local array<X2Action>					MarkerActions;
	local array<X2Action>					DamageUnitActions;
	local array<X2Action>					DamageTerrainActions;
	local XComGameStateContext_Ability		AbilityContext;
	local VisualizationActionMetadata		ActionMetadata;
	local bool								bFoundHistoryIndex;

	VisMgr = `XCOMVISUALIZATIONMGR;
	AbilityContext = XComGameStateContext_Ability(BuildTree.StateChangeContext);
	
	//	Find all Fire Actions in the triggering ability's Vis Tree performed by the unit that used the FollowUpShot.
	VisMgr.GetNodesOfType(VisualizationTree, class'X2Action_Fire', FindActions,, AbilityContext.InputContext.SourceObject.ObjectID);
	
	// Find all Damage Unit / Damage Terrain actions in the triggering ability visualization tree that are playing on the primary target of the follow up shot.
	// Damage Terrain actions play the damage flyover for damageable non-unit objects, like Alien Relay.
	VisMgr.GetNodesOfType(VisualizationTree, class'X2Action_ApplyWeaponDamageToUnit', DamageUnitActions,, AbilityContext.InputContext.PrimaryTarget.ObjectID);
	VisMgr.GetNodesOfType(VisualizationTree, class'X2Action_ApplyWeaponDamageToTerrain', DamageTerrainActions,, AbilityContext.InputContext.PrimaryTarget.ObjectID);

	// If there are several Fire Actions in the triggering ability tree (e.g. Faceoff), we need to find the right Fire Action that fires at the same target this instance of Follow Up Shot was fired at.
	// This info is not stored in the Fire Action itself, so we find the needed Fire Action by looking at its children Damage Unit / Damage Terrain actions,
	// as well as the visualization index recorded in FollowUpShot's context by its ability trigger.
	foreach FindActions(FireAction)
	{
		if (FireAction.StateChangeContext.AssociatedState.HistoryIndex == AbilityContext.DesiredVisualizationBlockIndex)
		{	
			foreach FireAction.ChildActions(ChildAction)
			{
				if (DamageTerrainActions.Find(ChildAction) != INDEX_NONE)
				{
					bFoundHistoryIndex = true;
					break;
				}
				if (DamageUnitActions.Find(ChildAction) != INDEX_NONE)
				{
					bFoundHistoryIndex = true;
					break;
				}
			}
		}

		if (bFoundHistoryIndex)
				break;
	}

	// If we didn't find the correct Fire Action, we call the failsafe Merge Vis Function,
	// which will make both Singe's Target Effects apply seperately after the triggering ability's visualization finishes.
	if (!bFoundHistoryIndex)
	{
		`LOG("WARNING ::" @ GetFuncName() @ "Failed to find the correct Fire Action, using a failsafe.",, 'WOTCIridarPerkPack');
		AbilityContext.SuperMergeIntoVisualizationTree(BuildTree, VisualizationTree);
		return;
	}

	// Find the start and end of the FollowUpShot's Vis Tree
	MarkerStart = X2Action_MarkerTreeInsertBegin(VisMgr.GetNodeOfType(BuildTree, class'X2Action_MarkerTreeInsertBegin'));
	MarkerEnd = X2Action_MarkerTreeInsertEnd(VisMgr.GetNodeOfType(BuildTree, class'X2Action_MarkerTreeInsertEnd'));

	// Will need these later to tie the shoelaces.
	VisMgr.GetNodesOfType(VisualizationTree, class'X2Action_MarkerNamed', MarkerActions);

	//	Add a Wait For Effect Action after the triggering ability's Fire Action. This will allow Singe's Effects to visualize the moment the triggering ability connects with the target.
	ActionMetaData = FireAction.Metadata;
	WaitAction = class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetaData, AbilityContext, false, FireAction);

	//	Insert the Singe's Vis Tree right after the Wait For Effect Action
	VisMgr.ConnectAction(MarkerStart, VisualizationTree, false, WaitAction);

	// Main part of Merge Vis is done, now we just tidy up the ending part. 
	// As I understood from MrNice, this is necessary to make sure Vis will look fine if Fire Action ends before Singe finishes visualizing
	// Cycle through Marker Actions we got earlier and find the 'Join' Marker that comes after the Triggering Shot's Fire Action.
	foreach MarkerActions(FindAction)
	{
		MarkerAction = X2Action_MarkerNamed(FindAction);

		if (MarkerAction.MarkerName == 'Join' && MarkerAction.StateChangeContext.AssociatedState.HistoryIndex == AbilityContext.DesiredVisualizationBlockIndex)
		{
			//	TBH can't imagine circumstances where MarkerEnd wouldn't exist, but okay
			if (MarkerEnd != none)
			{
				//	"tie the shoelaces". Vis Tree won't move forward until both Singe Vis Tree and Triggering Shot's Fire action are fully visualized.
				VisMgr.ConnectAction(MarkerEnd, VisualizationTree,,, MarkerAction.ParentActions);
				VisMgr.ConnectAction(MarkerAction, BuildTree,, MarkerEnd);
			}
			else
			{
				VisMgr.GetAllLeafNodes(BuildTree, FindActions);
				VisMgr.ConnectAction(MarkerAction, BuildTree,,, FindActions);
			}
			break;
		}
	}
}
// Pillar Visualisation Function
function Pillar_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameState_Destructible DestructibleState;
	local VisualizationActionMetadata BuildTrack;

	TypicalAbility_BuildVisualization(VisualizeGameState);

	foreach VisualizeGameState.IterateByClassType(class'XComGameState_Destructible', DestructibleState)
	{
		break;
	}
	`assert(DestructibleState != none);

	BuildTrack.StateObject_NewState = DestructibleState;
	BuildTrack.StateObject_OldState = DestructibleState;
	BuildTrack.VisualizeActor = `XCOMHISTORY.GetVisualizer(DestructibleState.ObjectID);

	//class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(BuildTrack, VisualizeGameState.GetContext());
	class'X2Action_ShowSpawnedDestructible'.static.AddToVisualizationTree(BuildTrack, VisualizeGameState.GetContext());
}

// GTS Dummy Ability
static function X2AbilityTemplate WOTC_Prof_Warden_BD_AcademyAbility()
{
	local X2AbilityTemplate				Template;

	Template = Class'X2Ability_Warden'.static.CreatePassiveAbility('WOTC_Prof_Warden_BD_AcademyAbility',,,false);
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;
	Template.bDontDisplayInAbilitySummary = true;

	return Template;
}

//	========================================
//				Active Helper Functions 
//	========================================

//Flow AP Helper
static final function GrantFlowAP(XComGameState_Unit UnitState)
{
    local XComGameState NewGameState;

    NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Special AP to:" @ UnitState.GetFullName());
    UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(UnitState.class, UnitState.ObjectID));
    UnitState.ActionPoints.AddItem(default.SpecialMomentumAP);  
    UnitState.SetUnitFloatValue(default.FlowAPGrantedValueName, 1, eCleanup_BeginTactical);
	
	`Log("I just set the FlowAP unitvalue in GrantFlowAPs");
    `GAMERULES.SubmitGameState(NewGameState);
}
// Rewind Helper
static simulated function Rewind_ModifyActivatedAbilityContext(XComGameStateContext Context)
{
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateHistory History;
	local PathPoint NextPoint, EmptyPoint;
	local PathingInputData InputData;
	local XComWorldData World;
	local vector NewLocation;
	local TTile NewTileLocation;

	History = `XCOMHISTORY;
	World = `XWORLD;

	AbilityContext = XComGameStateContext_Ability(Context);	
	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));

	// Build the MovementData for the path
	// First posiiton is the current location
	InputData.MovementTiles.AddItem(UnitState.TileLocation);

	NextPoint.Position = World.GetPositionFromTileCoordinates(UnitState.TileLocation);
	NextPoint.Traversal = eTraversal_Teleport;
	NextPoint.PathTileIndex = 0;
	InputData.MovementData.AddItem(NextPoint);

	// Second posiiton is the cursor position
	NewTileLocation = UnitState.TurnStartLocation;
	NewLocation = World.GetPositionFromTileCoordinates(NewTileLocation);

	NextPoint = EmptyPoint;
	NextPoint.Position = NewLocation;
	NextPoint.Traversal = eTraversal_Landing;
	NextPoint.PathTileIndex = 1;
	InputData.MovementData.AddItem(NextPoint);
	InputData.MovementTiles.AddItem(NewTileLocation);

    //Now add the path to the input context
	InputData.MovingUnitRef = UnitState.GetReference();
	AbilityContext.InputContext.MovementPaths.AddItem(InputData);
}
// SetHidden
static function SetHidden(out X2AbilityTemplate Template)
{
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	
	//TacticalText is for mainly for item-granted abilities (e.g. to hide the ability that gives the armour stats)
	Template.bDisplayInUITacticalText = false;
	
	//	bDisplayInUITooltip isn't actually used in the base game, it should be for whether to show it in the enemy tooltip, 
	//	but showing enemy abilities didn't make it into the final game. Extended Information resurrected the feature  in its enhanced enemy tooltip, 
	//	and uses that flag as part of it's heuristic for what abilities to show, but doesn't rely solely on it since it's not set consistently even on base game abilities. 
	//	Anyway, the most sane setting for it is to match 'bDisplayInUITacticalText'. (c) MrNice
	Template.bDisplayInUITooltip = false;
	
	//Ability Summary is the list in the armoury when you're looking at a soldier.
	Template.bDontDisplayInAbilitySummary = true;
	Template.bHideOnClassUnlock = true;
}
//Createpassive
static function X2AbilityTemplate CreatePassiveAbility(name AbilityName, optional string IconString, optional name IconEffectName = AbilityName, optional bool bDisplayIcon = true)
{
	
	local X2AbilityTemplate					Template;
	local X2Effect_Persistent				IconEffect;
	
	`CREATE_X2ABILITY_TEMPLATE (Template, AbilityName);
	Template.IconImage = IconString;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bCrossClassEligible = false;
	Template.bUniqueSource = true;
	Template.bIsPassive = true;

	// Dummy effect to show a passive icon in the tactical UI for the SourceUnit
	IconEffect = new class'X2Effect_Persistent';
	IconEffect.BuildPersistentEffect(1, true, false);
	IconEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, bDisplayIcon,, Template.AbilitySourceName);
	IconEffect.EffectName = IconEffectName;
	Template.AddTargetEffect(IconEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	return Template;
}


//	========================================
//				Misc Helper Functions
//	========================================

// SetPassive
static function SetPassive(out X2AbilityTemplate Template)
{
	Template.bIsPassive = true;

	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.bDisplayInUITacticalText = true;
	Template.bDisplayInUITooltip = true;
	Template.bDontDisplayInAbilitySummary = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	Template.Hostility = eHostility_Neutral;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
}
// SetHiddenPurePassive
static function X2AbilityTemplate HiddenPurePassive(name TemplateName, optional string TemplateIconImage="img:///UILibrary_PerkIcons.UIPerk_standard", optional bool bCrossClassEligible=false, optional Name AbilitySourceName='eAbilitySource_Perk', optional bool bDisplayInUI=true)
{
	local X2AbilityTemplate	Template;
	
	Template = PurePassive(TemplateName, TemplateIconImage, bCrossClassEligible, AbilitySourceName, bDisplayInUI);
	SetHidden(Template);
	
	return Template;
}
// SetFireAnim
static function SetFireAnim(out X2AbilityTemplate Template, name Anim)
{
	Template.CustomFireAnim = Anim;
	Template.CustomFireKillAnim = Anim;
	Template.CustomMovingFireAnim = Anim;
	Template.CustomMovingFireKillAnim = Anim;
	Template.CustomMovingTurnLeftFireAnim = Anim;
	Template.CustomMovingTurnLeftFireKillAnim = Anim;
	Template.CustomMovingTurnRightFireAnim = Anim;
	Template.CustomMovingTurnRightFireKillAnim = Anim;
}
// Addcooldown
static function AddCooldown(out X2AbilityTemplate Template, int Cooldown)
{
	local X2AbilityCooldown AbilityCooldown;

	if (Cooldown > 0)
	{
		AbilityCooldown = new class'X2AbilityCooldown';
		AbilityCooldown.iNumTurns = Cooldown;
		Template.AbilityCooldown = AbilityCooldown;
	}
}
// AddCharges
static function AddCharges(out X2AbilityTemplate Template, int InitialCharges)
{
	local X2AbilityCharges		Charges;
	local X2AbilityCost_Charges	ChargeCost;

	if (InitialCharges > 0)
	{
		Charges = new class'X2AbilityCharges';
		Charges.InitialCharges = InitialCharges;
		Template.AbilityCharges = Charges;

		ChargeCost = new class'X2AbilityCost_Charges';
		ChargeCost.NumCharges = 1;
		Template.AbilityCosts.AddItem(ChargeCost);
	}
}
// AddFreeCost
static function AddFreeCost(out X2AbilityTemplate Template)
{
	local X2AbilityCost_ActionPoints ActionPointCost;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);
}
// RemoveVoiceLines
static function RemoveVoiceLines(out X2AbilityTemplate Template)
{
	Template.ActivationSpeech = '';
	Template.SourceHitSpeech = '';
	Template.TargetHitSpeech = '';
	Template.SourceMissSpeech = '';
	Template.TargetMissSpeech = '';
	Template.TargetKilledByAlienSpeech = '';
	Template.TargetKilledByXComSpeech = '';
	Template.MultiTargetsKilledByAlienSpeech = '';
	Template.MultiTargetsKilledByXComSpeech = '';
	Template.TargetWingedSpeech = '';
	Template.TargetArmorHitSpeech = '';
	Template.TargetMissedSpeech = '';
}
//Create_AnimSet_Passive
static function X2AbilityTemplate Create_AnimSet_Passive(name TemplateName, string AnimSetPath)
{
	local X2AbilityTemplate                 Template;
	local X2Effect_AdditionalAnimSets		AnimSetEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;
	Template.bDontDisplayInAbilitySummary = true;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	AnimSetEffect = new class'X2Effect_AdditionalAnimSets';
	AnimSetEffect.AddAnimSetWithPath(AnimSetPath);
	AnimSetEffect.BuildPersistentEffect(1, true, false, false);
	Template.AddTargetEffect(AnimSetEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}
// Total Combat Check Function
static final function bool IsAbilityAffectedByTotalCombat(const X2AbilityTemplate Template)
{
    local X2AbilityCost                    Cost;
    local X2AbilityCost_ActionPoints    ActionCost;
    local bool                            bAffectedByTotalCombat;
    
    foreach Template.AbilityCosts(Cost)
    {
        ActionCost = X2AbilityCost_ActionPoints(Cost);
        if (ActionCost == none || ActionCost.bFreeCost || !ActionCost.bConsumeAllPoints)
            continue;

        // An ability might have several Action Costs, so we must iterate over all of them.
        // If we're here, then this is a non-free action cost that normally ends turn.

        if (ActionCost.DoNotConsumeAllSoldierAbilities.Find('TotalCombat') == INDEX_NONE)
        {
            // Set this flag to record that this ability has in fact an action cost affected by Total Combat
            bAffectedByTotalCombat = true;
        }
        else
        {
            // But return false if at lest one of the action costs isn't affected by it.
            return false;
        }
    }

    // If at this point bAffectedByTotalCombat is true, then all of this ability's action costs are effected by Total Combat.
    return bAffectedByTotalCombat;
}
//	SetSelfTarget WithEventTrigger
static function	SetSelfTarget_WithEventTrigger(out X2AbilityTemplate Template, name EventID, optional EventListenerDeferral Deferral = ELD_OnStateSubmitted, optional AbilityEventFilter Filter = eFilter_None, optional int Priority = 50)
{
	local X2AbilityTrigger_EventListener Trigger;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	
	Trigger = new class'X2AbilityTrigger_EventListener';	
	Trigger.ListenerData.EventID = EventID;
	Trigger.ListenerData.Deferral = Deferral;
	Trigger.ListenerData.Filter = Filter;
	Trigger.ListenerData.Priority = Priority;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(Trigger);
}
// PrintActionRecursive
static function PrintActionRecursive(X2Action Action, int iLayer)
{
	local X2Action ChildAction;

	`LOG("Action layer: " @ iLayer @ ": " @ Action.Class.Name @ Action.StateChangeContext.AssociatedState.HistoryIndex,, 'IRIPISTOLVIZ'); 
	foreach Action.ChildActions(ChildAction)
	{
		PrintActionRecursive(ChildAction, iLayer + 1);
	}
}

//	========================================
//				Default  Properties
//	========================================
// Default properties
defaultproperties
{
	SpecialMomentumAP = "BD_SpecialMomentum_AP"

	MeleeStanceValueName = "BD_MeleeStance_Value"
	MeleeStanceHitEffectName = "BD_MeleeStanceEffect"
	MeleeStanceMobilityEffectName = "BD_MeleeStanceMobilityEffect"
		
	RangedStanceValueName = "BD_RangedStance_Value"
	RangedStanceCdefEffectName = "BD_RangedStanceEffect"
	RangedStanceReturnFireEffectName = "BD_ReturnFireEffect"

	EbbDefenseEffectName = "BD_EbbDefenseEffect"
	FlowMobilityEffectName = "BD_FlowMobilityEffect"

	SoulBladeValueName = "BD_SoulBlade_Value"
			
	BlockadeDREffectName = "BD_BlockadeDREffect"
	BlockadeImmunityEffectName = "BD_BlockadeImmunityEffect"

	FlowAPGrantedValueName = "BD_FlowAPGranted_Value"	
	KineticArmourEffectName = "BD_KineticArmourEffect"
	KineticArmourRFEffectName = "BD_KineticArmourRFEffect"
			
}
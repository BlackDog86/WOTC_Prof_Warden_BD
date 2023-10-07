class X2Ability_Warden extends X2Ability config(Wardenskills);

//Unit Value Names
var const name	MeleeStanceValueName;
var const name	RangedStanceValueName;
var const name	FlowAPGrantedValueName;
var const name	SoulBladeValueName;
var const name	GunFocusCounterValueName;
var const name	MeleeFocusCounterValueName;
var const name	NumberOfCounterAttacksValueName;
var const name	KineticArmorExpendedShields;
var const name	KineticArmorBonusDamageValue;
var const name	ConsumeBonusDamageValue;

//Effect Names
var const name	MeleeStanceHitEffectName;
var const name	MeleeStanceMobilityEffectName;
var const name	RangedStanceCdefEffectName;
var const name	MirrorEffectName;
var const name	MirrorReturnFireEffectName;
var const name	KineticArmorEffectName;
var const name	KineticArmorDamageEffectName;
var const name	ConsumeDamageEffectName;
var const name	DefenderImmunityEffectName;
var const name	FissureStage1EffectName;
var const name	DefensiveWardStage1EffectName;
var const name	RetributionStage1EffectName;

//Trigger Names
var const name	FissureTriggerName;
var const name	DefensiveWardTriggerName;
var const name	RetributionTriggerName;

//AP Types
var const name 	SpecialMomentumAP;
var const name 	DefenderAP;
var const name 	CrusaderAP;
var const name 	WatcherAP;
var const name 	RageAP;
var const name 	ChargeAP;
var const name 	DefenderCrusaderAP;
var const name 	DefenderWatcherAP;
var const name 	DefenderRageAP;
var const name 	DefenderChargeAP;
var const name 	CrusaderWatcherAP;
var const name 	CrusaderRageAP;
var const name 	CrusaderChargeAP;
var const name 	WatcherRageAP;
var const name 	WatcherChargeAP;
var const name 	RageChargeAP;
var const name 	DefenderCrusaderWatcherAP;
var const name 	DefenderCrusaderRageAP;
var const name 	DefenderCrusaderChargeAP;
var const name 	DefenderWatcherRageAP;
var const name 	DefenderWatcherChargeAP;
var const name 	DefenderRageChargeAP;
var const name 	CrusaderWatcherRageAP;
var const name 	CrusaderWatcherChargeAP;
var const name 	CrusaderRageChargeAP;
var const name 	WatcherRageChargeAP;
var const name 	DefenderCrusaderWatcherRageAP;
var const name 	DefenderCrusaderWatcherChargeAP;
var const name 	DefenderCrusaderRageChargeAP;
var const name  DefenderWatcherRageChargeAP;
var const name 	CrusaderWatcherRageChargeAP;
var const name 	DefenderCrusaderWatcherRageChargeAP;


// Config Variables
var config int	MELEESTANCE_I_MOBILITY_BONUS;
var config int	MELEESTANCE_II_MOBILITY_BONUS;
var config int	MELEESTANCE_III_MOBILITY_BONUS;

var config int	FLOW_MASTERY_BASE_CHARGES;

var config int	WARDENSSWORD_AIM_BONUS;
var config int	CRUSADER_AIM_BONUS;
var config int	CRUSADER_CRIT_BONUS;

var config int	KINETIC_ARMOR_SHIELD_HP_PERCENTAGE;
var config int	KINETIC_ARMOR_COOLDOWN;

var config int	MIRROR_NUMBER_OF_ATTACKS;
var config int	MIRROR_COOLDOWN;

var config int	REWIND_COOLDOWN;

var config int	SOULBLADE_COOLDOWN;

var config int	DEFENSIVE_WARD_COOLDOWN;
var config int	DEFENSIVE_WARD_RADIUS;
var config int	DEFENSIVE_WARD_RANGE;
var config int	DEFENSIVE_WARD_DAMAGE;
var config int	DEFENSIVE_WARD_SPREAD;

var config int	COUNTERATTACK_DODGE_AMOUNT;
var config int	MAX_COUNTERATTACKS_ALLOWED;

var config int	FISSURE_RADIUS;
var config int	FISSURE_RANGE;
var config int	FISSURE_AMOUNT;
var config int	FISSURE_COOLDOWN;

var config int	TIDE_COOLDOWN;
var config int	TIDE_RADIUS;
var config int	TIDE_DAMAGE_AMOUNT;
var config int	TIDE_DAMAGE_PLUSONE;
var config int	TIDE_ENVDAMAGE;
var config int	TIDE_STUN_TURNS;
var config int	TIDE_KNOCKBACK_DISTANCE;

var config int	CONSUME_COOLDOWN;
var config int	CONSUME_RADIUS;
var config int	CONSUME_RANGE;

var config int	RETRIBUTION_COOLDOWN;
var config int	RETRIBUTION_RADIUS;
var config int	RETRIBUTION_RANGE;

var config int	BRAND_OFFENSE_STAT_BONUS;
var config int	BRAND_DAMAGE_BONUS;
var config int	BRAND_CRIT_DAMAGE_BONUS;
var config int	BRAND_COOLDOWN;

var config int	PILLAR_COOLDOWN;
var config int	PILLAR_DURATION;

var config int	FUSE_COOLDOWN;
var config int	INSPIRE_COOLDOWN;

var localized string CounterattackDodgeName;

// Template creation - Do over-rides for cost based ability colours
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(Warden_BD_MeleeStance());
	Templates.AddItem(Warden_BD_RangedStance());
	Templates.AddItem(Warden_BD_EbbAndFlow());
	Templates.AddItem(Warden_BD_EbbAndFlowDummy());
	Templates.AddItem(Warden_BD_EbbAndFlowManual());
	Templates.AddItem(Warden_BD_ProficiencyPassives());
	Templates.AddItem(Warden_BD_Rewind());
	Templates.AddItem(Warden_BD_KineticArmor());
	Templates.AddItem(Warden_BD_Mirror());
	Templates.AddItem(Warden_BD_MirrorReturnFire());
	Templates.AddItem(Warden_BD_DefenderPassive());	
	Templates.AddItem(Warden_BD_CrusaderPassive());	
	Templates.AddItem(Warden_BD_WatcherPassive());
	Templates.AddItem(Warden_BD_ImbueAmmo());
	Templates.AddItem(Warden_BD_SoulBlade());
	Templates.AddItem(Warden_BD_DefensiveWard());
	Templates.AddItem(Warden_BD_DefensiveWard_Stage2());
	Templates.AddItem(Warden_BD_FirearmFocusPassive());
	Templates.AddItem(Warden_BD_MeleeFocusPassive());
	Templates.AddItem(Warden_BD_Combatives());
	Templates.AddItem(Warden_BD_CombativesAttack());
	Templates.AddItem(Warden_BD_CombativesPreparation());
	Templates.AddItem(Warden_BD_CombativesCounterattack());
	Templates.AddItem(Warden_BD_CombativesStats());
	Templates.AddItem(Warden_BD_Fissure());
	Templates.AddItem(Warden_BD_Fissure_Stage2());
	Templates.AddItem(Warden_BD_Tide());
	Templates.AddItem(Warden_BD_Consume());
	Templates.AddItem(Warden_BD_ConsumeAdditionalDamage());
	Templates.AddItem(Warden_BD_RagePassive());	
	Templates.AddItem(Warden_BD_ChargePassive());
	Templates.AddItem(Warden_BD_Retribution());
	Templates.AddItem(Warden_BD_Retribution_Stage2());
	Templates.AddItem(Warden_BD_Brand());
	Templates.AddItem(Warden_BD_Pillar());
	Templates.AddItem(Warden_BD_Inspire());
	Templates.AddItem(Warden_BD_TotalCombat());
	Templates.AddItem(Warden_BD_Fuse());
	return Templates;
}

// Melee Stance - Change speech lines, Add custom anim
static final function X2AbilityTemplate Warden_BD_MeleeStance()
{
	local X2AbilityTemplate										Template;
	local X2AbilityTrigger_EventListener						MeleeTrigger;
	local X2Effect_SetUnitValue									SetUnitValueEffect;
	local X2Effect_IncrementUnitValue							CounterEffect;
	local X2Effect_ClearUnitValue								ClearUnitValueEffect, ClearUnitValueEffect2;
	local X2Condition_WardenTargetRankRequirement				RankCondition1, RankCondition2, RankCondition3;
	local X2Effect_PersistentStatChange							MobilityEffect1, MobilityEffect2, MobilityEffect3;						

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_MeleeStance');

	// Create Ranks for Proficiency Effects
	RankCondition1 = new class 'X2Condition_WardenTargetRankRequirement';
	RankCondition1.iMinRank = -1;	// No minimum rank for level 1 bonuses
	RankCondition1.iMaxRank = 2;	// Max rank is 1 below minimum rank for level 2 bonuses
	RankCondition1.LogEffectName = "Melee Hit 1";	// EffectName to use in logs
	RankCondition1.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock1';

	RankCondition2 = new class 'X2Condition_WardenTargetRankRequirement';
	RankCondition2.iMinRank = 3;
	RankCondition2.iMaxRank = 5;
	RankCondition2.LogEffectName = "Melee Hit 2";
	RankCondition2.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock2';
	RankCondition2.GiveProject = 'WOTC_Prof_Warden_BD_Unlock1';
	
	RankCondition3 = new class 'X2Condition_WardenTargetRankRequirement';
	RankCondition3.iMinRank = 6;
	RankCondition3.iMaxRank = -1;	// No max rank for level 3 bonuses
	RankCondition3.LogEffectName = "Melee Hit 3";
	RankCondition3.GiveProject = 'WOTC_Prof_Warden_BD_Unlock2';	 
	
	// # Icon Setup
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_partingsilk";
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

	CounterEffect = new Class'X2Effect_IncrementUnitValue';
	CounterEffect.UnitName = default.MeleeFocusCounterValueName;
	CounterEffect.NewValueToSet = 1;
	CounterEffect.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(CounterEffect);

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
	local X2Effect_IncrementUnitValue							CounterEffect;
	local X2Effect_ClearUnitValue								ClearUnitValueEffect, ClearUnitValueEffect2;
	local X2Condition_WardenTargetRankRequirement		RankCondition1, RankCondition2, RankCondition3;
	local X2Effect_WardenCounterDefense							IgnoreCoverEffect1, IgnoreCoverEffect2, IgnoreCoverEffect3;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_RangedStance');
	
	//Create Ranks for Proficiency Effects
	RankCondition1 = new class 'X2Condition_WardenTargetRankRequirement';
	RankCondition1.iMinRank = -1;	// No minimum rank for level 1 bonuses
	RankCondition1.iMaxRank = 2;	// Max rank is 1 below minimum rank for level 2 bonuses
	RankCondition1.LogEffectName = "Ranged Hit 1";	// EffectName to use in logs
	RankCondition1.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock1';

	RankCondition2 = new class 'X2Condition_WardenTargetRankRequirement';
	RankCondition2.iMinRank = 3;
	RankCondition2.iMaxRank = 5;
	RankCondition2.LogEffectName = "Melee Hit 2";
	RankCondition2.ExcludeProject = 'WOTC_Prof_Warden_BD_Unlock2';
	RankCondition2.GiveProject = 'WOTC_Prof_Warden_BD_Unlock1';
	
	RankCondition3 = new class 'X2Condition_WardenTargetRankRequirement';
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
	
	SetUnitValueEffect = new Class'X2Effect_SetUnitValue';
	SetUnitValueEffect.UnitName = default.RangedStanceValueName;
	SetUnitValueEffect.NewValueToSet = 1;
	SetUnitValueEffect.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetUnitValueEffect);

	CounterEffect = new Class'X2Effect_IncrementUnitValue';
	CounterEffect.UnitName = default.GunFocusCounterValueName;
	CounterEffect.NewValueToSet = 1;
	CounterEffect.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(CounterEffect);

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

	return Template;
}

static final function X2AbilityTemplate Warden_BD_EbbAndFlowManual()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCost_ActionPoints							ActionPointCost;	
	local X2AbilityCost_Charges									ChargeCost;
	local X2AbilityCharges										Charges;
	local X2Effect_TriggerEvent									TriggerMeleeEvent;
	local X2Effect_TriggerEvent									TriggerRangedEvent;
	local X2Condition_Unitvalue									CheckMeleeStance;
	local X2Condition_Unitvalue									CheckRangedStance;
	local X2Effect_RemoveEffects								RemoveMeleeEffects, RemoveRangedEffects;
	local X2Effect_GrantActionPoints							GrantActionPoints;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_EbbAndFlowManual');
	
	// # Icon Setup
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.IconImage = "img:///Warden_BD_PerkIcons.UIPerk_WardenFlow";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// Need a standard action point to use it (i.e. no flow APs)
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 	
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// Gives a point back so free cost
	GrantActionPoints = new class'X2Effect_GrantActionPoints';
	GrantActionPoints.bApplyOnMiss = true;
	GrantActionPoints.NumActionPoints = 1;
	GrantActionPoints.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	Template.AddShooterEffect(GrantActionPoints);

	// Grant charges to the ability
	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.FLOW_MASTERY_BASE_CHARGES;
	Template.AbilityCharges = Charges;
	
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	// Check if we're in melee stance
	CheckMeleeStance = new Class'X2Condition_Unitvalue';
	CheckMeleeStance.AddCheckValue(default.MeleeStanceValueName,1,eCheck_Exact);

	// Remove melee stance persistent effects if we're switching
	RemoveMeleeEffects = new Class'X2Effect_RemoveEffects';
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
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	PersistentEffect = new class'X2Effect_Persistent';
	// Expires immediately
	PersistentEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
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
	
	Template.AdditionalAbilities.Additem('Warden_BD_ProficiencyPassives');
	Template.AdditionalAbilities.Additem('Warden_BD_EbbandFlow');
	
	return Template;
}

// Ebb & Flow
static final function X2AbilityTemplate Warden_BD_EbbandFlow()
{
	local X2AbilityTemplate										Template;
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
	Template.IconImage = "img:///Warden_BD_PerkIcons.UIPerk_WardenFlow";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	
	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	
	
	//Ability Summary is the list in the Armory when you're looking at a soldier.
	Template.bDontDisplayInAbilitySummary = true;
	Template.bHideOnClassUnlock = true;

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

static function X2AbilityTemplate Warden_BD_ProficiencyPassives()
{
	local X2AbilityTemplate										Template;
	local X2Effect_ToHitModifier								HitModEffect;
	local X2Effect_WardenAddAbilitiesToTarget					AddAbilityEffect;
	local X2Condition_WardenTargetRankRequirement				RankCondition1, RankCondition2;
	local X2Effect_WardenModifyAbilityCharges					BonusCharges;
	
	// Icon Properties
	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_ProficiencyPassives');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_SwordSlash";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	//Create Ranks for Manual Ebb & Flow Effect (Corporal)
	RankCondition1 = new class 'X2Condition_WardenTargetRankRequirement';
	RankCondition1.iMinRank = 2;		// No minimum rank for level 1 bonuses
	RankCondition1.iMaxRank = -1;	// Max rank is 1 below minimum rank for level 2 bonuses
	RankCondition1.LogEffectName = "Grant stanceswitch ability";	// EffectName to use in logs
	RankCondition1.GiveProject = 'WOTC_Prof_Warden_BD_Unlock1';

	//Create Ranks for Manual Ebb & Flow Effect (Captain)
	RankCondition2 = new class 'X2Condition_WardenTargetRankRequirement';
	RankCondition2.iMinRank = 5;		// No minimum rank for level 1 bonuses
	RankCondition2.iMaxRank = -1;	// Max rank is 1 below minimum rank for level 2 bonuses
	RankCondition2.LogEffectName = "Grant stanceswitch ability";	// EffectName to use in logs
	RankCondition2.GiveProject = 'WOTC_Prof_Warden_BD_Unlock1';

	// Hide this ability altogether
	Template.bDontDisplayInAbilitySummary = true;
	Template.bHideOnClassUnlock = true;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	// Grant Flow Mastery, single charge at appropriate rank
	AddAbilityEffect = new class'X2Effect_WardenAddAbilitiesToTarget';
	AddAbilityEffect.AddAbilities.AddItem('Warden_BD_EbbAndFlowManual');
	AddAbilityEffect.EffectName = 'ProficiencyEbbandFlow';
	AddAbilityEffect.TargetConditions.AddItem(RankCondition1);
	Template.AddTargetEffect(AddAbilityEffect);

	// Grant an additional charge at the appopriate rank
	BonusCharges = new class 'X2Effect_WardenModifyAbilityCharges';
	BonusCharges.AbilitiesToModify.AddItem('Warden_BD_EbbAndFlowManual');
	BonusCharges.iChargeModifier = 1;
	BonusCharges.BuildPersistentEffect (1, true, false, false);
	BonusCharges.TargetConditions.AddItem(RankCondition2);
	Template.AddTargetEffect(BonusCharges);

	// Warden's sword default aim buff
	HitModEffect = new class'X2Effect_ToHitModifier';
	HitModEffect.AddEffectHitModifier(eHit_Success, default.WARDENSSWORD_AIM_BONUS, Template.LocFriendlyName, , true, false, true, true);
	HitModEffect.BuildPersistentEffect(1, true, false, false);
	HitModEffect.EffectName = 'WardensSwordAim';
	Template.AddTargetEffect(HitModEffect);	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

// Kinetic Armor 
static final function X2AbilityTemplate Warden_BD_KineticArmor()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2Effect_WardenKineticArmor							KineticEffect;
	local X2Effect_WardenKineticArmorDamage						KineticDamageEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_KineticArmor');
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_divineArmor";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CORPORAL_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	
	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.KINETIC_ARMOR_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;

	// Millions upon millions of points
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.DisplayTargetHitChance = false;
	Template.AbilityTargetStyle = default.SelfTarget;	

	// Ability trigger determines how it is activated. In this case - by the user manually.
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	
	// Set up effect to create new Armor
	KineticEffect = new class'X2Effect_WardenKineticArmor';
	KineticEffect.EffectName = default.KineticArmorEffectName;
	KineticEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(KineticEffect);

	// Set up persistent effect for the additional damage
	KineticDamageEffect = new class'X2Effect_WardenKineticArmorDamage';
	KineticDamageEffect.EffectName = default.KineticArmorDamageEffectName;
	KineticDamageEffect.DuplicateResponse = eDupe_Ignore;
	KineticDamageEffect.BuildPersistentEffect(1, true, false);
	KineticDamageEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	Template.AddTargetEffect(KineticDamageEffect);
	
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
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CORPORAL_PRIORITY;
	Template.IconImage = "img:///Warden_BD_PerkIcons.UIPerk_WardenRewind";

	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.REWIND_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	//Add all the different action point combos to the array (sorry...)
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
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

// Mirror
static final function X2AbilityTemplate Warden_BD_Mirror()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2Effect_WardenMirror									MirrorEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Mirror');
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_willtosurvive";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CORPORAL_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	
	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.MIRROR_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;

	// Millions upon millions of points
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.DisplayTargetHitChance = false;
	Template.AbilityTargetStyle = default.SelfTarget;	

	// Ability trigger determines how it is activated. In this case - by the user manually.
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	
	// Set up persistent effect to turn next two hits into grazes
	MirrorEffect = new class'X2Effect_WardenMirror';
	MirrorEffect.EffectName = default.MirrorEffectName;
	// This effect does not tick normally & needs to be manually advanced in the effect
	MirrorEffect.BuildPersistentEffect(default.MIRROR_NUMBER_OF_ATTACKS, false, true, false, eGameRule_PlayerTurnEnd);
	MirrorEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	Template.AddTargetEffect(MirrorEffect);
	
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
	
	Template.AdditionalAbilities.AddItem('Warden_BD_MirrorReturnFire');
		
	return Template;
}

Static final function X2AbilityTemplate Warden_BD_MirrorReturnFire()
{
	local X2AbilityTemplate						Template;
	local X2AbilityToHitCalc_PercentChance		ChanceToHit;
	local X2AbilityTrigger_EventListener		Trigger;
	local X2Effect_WardenMirrorReturnFire		DamageEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_MirrorReturnFire');

	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Offensive;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_willtosurvive";

	ChanceToHit = new class'X2AbilityToHitCalc_PercentChance';
	ChanceToHit.PercentToHit = 100;
	Template.AbilityToHitCalc = ChanceToHit;

	Trigger = new class'X2AbilityTrigger_EventListener';
    Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
    Trigger.ListenerData.EventID = 'MirrorReturnFire';
    Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = MirrorReturnFireListener;
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	DamageEffect = new class'X2Effect_WardenMirrorReturnFire';	
	DamageEffect.EffectDamageValue.DamageType = 'Psi';
	DamageEffect.bBypassShields = true;
	DamageEffect.bIgnoreArmor = true;
	Template.AddTargetEffect(DamageEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;

	return Template;
}

static function X2AbilityTemplate Warden_BD_DefenderPassive()
{
	local X2AbilityTemplate						Template;

	Template = CreatePassiveAbility('Warden_BD_DefenderPassive', "img:///UILibrary_PerkIcons.UIPerk_one_for_all");
	Template.bCrossClassEligible = false;
	Template.AbilitySourceName = 'eAbilitySource_psionic';
	Template.AdditionalAbilities.AddItem('Warden_BD_TotalCombat');
	return Template;
}

static function X2AbilityTemplate Warden_BD_TotalCombat()
{

	local X2AbilityTemplate										Template;

	Template = CreatePassiveAbility('Warden_BD_TotalCombat', "img:///UILibrary_PerkIcons.UIPerk_grenadecook");
	
	return Template;
}


static function X2AbilityTemplate Warden_BD_CrusaderPassive()
{
	local X2AbilityTemplate						Template;
	local X2Effect_ToHitModifier				CrusaderEffect;

	Template = CreatePassiveAbility('Warden_BD_CrusaderPassive', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_chimeraxws");
	
	CrusaderEffect = new class'X2Effect_ToHitModifier';
	CrusaderEffect.BuildPersistentEffect(1, true, false);
	CrusaderEffect.AddEffectHitModifier(eHit_Success, default.CRUSADER_AIM_BONUS, Template.LocFriendlyName,, true, false, true, true);
	CrusaderEffect.AddEffectHitModifier(eHit_Crit, default.CRUSADER_CRIT_BONUS, Template.LocFriendlyName,, true, false, true, true);
	Template.AddTargetEffect(CrusaderEffect);

	Template.bCrossClassEligible = false;
	Template.AbilitySourceName = 'eAbilitySource_psionic';

	return Template;
}

static function X2AbilityTemplate Warden_BD_WatcherPassive()
{
	local X2AbilityTemplate						 Template;
	local X2Effect_NegateOWPenalty		         NegateOWPenaltyEffect;

	Template = CreatePassiveAbility('Warden_BD_WatcherPassive', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_squadsightprotocol");
	Template.bCrossClassEligible = false;
	Template.AbilitySourceName = 'eAbilitySource_psionic';

	NegateOWPenaltyEffect = new class'X2Effect_NegateOWPenalty';
	Template.AddTargetEffect(NegateOWPenaltyEffect);
	
	return Template;
}

static function X2AbilityTemplate Warden_BD_ImbueAmmo()
{
	local X2AbilityTemplate						Template;

	Template = CreatePassiveAbility('Warden_BD_ImbueAmmo', "img:///UILibrary_PerkIcons.UIPerk_tracerbeams");
	
	Template.bCrossClassEligible = false;
	Template.AbilitySourceName = 'eAbilitySource_psionic';

	return Template;
}

// Soulblade TODO: Balance Effects, icon, voice, visualisation
static final function X2AbilityTemplate Warden_BD_SoulBlade()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2Effect_PersistentStatChange							DummyEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_SoulBlade');
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_ceramicblade";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
		
	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.SOULBLADE_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	// ALLLL THE POOOOIIIINNNNTTTSSSS!
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.DisplayTargetHitChance = false;
	Template.AbilityTargetStyle = default.SelfTarget;	

	// Ability trigger determines how it is activated. In this case - by the user manually.
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
		
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

static function X2AbilityTemplate Warden_BD_DefensiveWard()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints					ActionPointCost;
	local X2AbilityCooldown								Cooldown;
	local X2AbilityMultiTarget_Radius					RadiusMultiTarget;
	local X2AbilityTarget_Cursor						CursorTarget;
	local X2Effect_DelayedAbilityActivation				DelayedDamageEffect;
	local X2Effect_MarkValidActivationTiles				MarkTilesEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_DefensiveWard');	
	Template.TwoTurnAttackAbility = 'Warden_BD_DefensiveWard_Stage2';

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_psi_drain";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY;

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.bShowActivation = true;
	Template.Hostility = eHostility_Offensive;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	// Sooooooo many poooooiiiinnnnttttssss!
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.DEFENSIVE_WARD_COOLDOWN;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.DEFENSIVE_WARD_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;
	
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = true;
	CursorTarget.FixedAbilityRange = default.DEFENSIVE_WARD_RANGE;
	Template.AbilityTargetStyle = CursorTarget;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	MarkTilesEffect = new class'X2Effect_MarkValidActivationTiles';
	MarkTilesEffect.AbilityToMark = 'Warden_BD_DefensiveWard_Stage2';
	MarkTilesEffect.OnlyUseTargetLocation = true;
	Template.AddShooterEffect(MarkTilesEffect);

	//Effect on a successful test is adding the delayed marked effect to the target
	DelayedDamageEffect = new class 'X2Effect_DelayedAbilityActivation';
	DelayedDamageEffect.BuildPersistentEffect(1, false, false, , eGameRule_PlayerTurnBegin);
	DelayedDamageEffect.EffectName = default.DefensiveWardStage1EffectName;
	DelayedDamageEffect.TriggerEventName = default.DefensiveWardTriggerName;
	DelayedDamageEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddShooterEffect(DelayedDamageEffect);
	
	Template.TargetingMethod = class'X2TargetingMethod_VoidRift';

	Template.CustomFireAnim = 'HL_Malfunction';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	//Template.BuildAffectedVisualizationSyncFn = PsiBombStage1_BuildAffectedVisualization;
	Template.CinescriptCameraType = "Codex_PsiBomb_Stage1";
//	Template.DamagePreviewFn = PsiBombDamagePreview;
	Template.bFrameEvenWhenUnitIsHidden = true;
	
	Template.AdditionalAbilities.AddItem('Warden_BD_DefensiveWard_Stage2');

	return Template;
}

static function X2AbilityTemplate Warden_BD_DefensiveWard_Stage2()
{
	local X2AbilityTemplate					Template;
	local X2AbilityMultiTarget_Radius		RadiusMultiTarget;
	local X2Condition_UnitProperty			LivingTargetCondition;
	local X2AbilityTrigger_EventListener	DelayedEventListener;
	local X2Effect_ApplyWeaponDamage		DamageEffect;
	local X2Effect_PerkAttachForFX			FXEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_DefensiveWard_Stage2');

	Template.bDontDisplayInAbilitySummary = true;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';

	Template.AbilityToHitCalc = default.DeadEye;

	LivingTargetCondition = new class'X2Condition_UnitProperty';
	LivingTargetCondition.ExcludeFriendlyToSource = true;
	LivingTargetCondition.ExcludeHostileToSource = false;
	LivingTargetCondition.ExcludeRobotic = true;
	LivingTargetCondition.ExcludeAlive = false;
	LivingTargetCondition.ExcludeDead = true;
	LivingTargetCondition.FailOnNonUnits = true;
	Template.AbilityMultiTargetConditions.AddItem(LivingTargetCondition);

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.DEFENSIVE_WARD_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	// TODO: This doesn't actually target self but needs an AbilityTargetStyle
	Template.AbilityTargetStyle = default.SelfTarget;

	// This ability fires when the event DelayedExecuteRemoved fires on this unit
	DelayedEventListener = new class'X2AbilityTrigger_EventListener';
	DelayedEventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	DelayedEventListener.ListenerData.EventID = default.DefensiveWardTriggerName;
	DelayedEventListener.ListenerData.Filter = eFilter_Unit;
	DelayedEventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_ValidAbilityLocation;
	Template.AbilityTriggers.AddItem(DelayedEventListener);

	// This effect is here to attach perk FX to
	FXEffect = new class'X2Effect_PerkAttachForFX';
	Template.AddShooterEffect(FXEffect);

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue.Damage = default.DEFENSIVE_WARD_DAMAGE;
	DamageEffect.EffectDamageValue.Spread = default.DEFENSIVE_WARD_SPREAD;
	DamageEffect.EffectDamageValue.DamageType = 'Psi';
	DamageEffect.bBypassShields = true;
	DamageEffect.bIgnoreArmor = true;
	Template.AddMultiTargetEffect(DamageEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Codex_PsiBomb_Stage2";
//BEGIN AUTOGENERATED CODE: Template Overrides 'PsiBombStage2'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'PsiBombStage2'

	return Template;
}

static function X2AbilityTemplate Warden_BD_FirearmFocusPassive()
{
	local X2AbilityTemplate						Template;
	local X2Effect_WardenRangedDamageFocus		FireArmDamageFocusEffect;

	Template = CreatePassiveAbility('Warden_BD_FirearmFocusPassive', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_improvisedsilencer");
	Template.bCrossClassEligible = false;
	Template.AbilitySourceName = 'eAbilitySource_psionic';
		
	FireArmDamageFocusEffect = new class'X2Effect_WardenRangedDamageFocus';
	FireArmDamageFocusEffect.BuildPersistentEffect(1, true, false);
	FireArmDamageFocusEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	Template.AddTargetEffect(FireArmDamageFocusEffect);

	return Template;
}

static function X2AbilityTemplate Warden_BD_MeleeFocusPassive()
{
	local X2AbilityTemplate						Template;
	local X2Effect_WardenMeleeDamageFocus		MeleeDamageFocusEffect;

	Template = CreatePassiveAbility('Warden_BD_MeleeFocusPassive', "img:///UILibrary_PerkIcons.UIPerk_bladestorm");
	
	Template.bCrossClassEligible = false;
	Template.AbilitySourceName = 'eAbilitySource_psionic';

	MeleeDamageFocusEffect = new class'X2Effect_WardenMeleeDamageFocus';
	MeleeDamageFocusEffect.BuildPersistentEffect(1, true, false);
	MeleeDamageFocusEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);		
	Template.AddTargetEffect(MeleeDamageFocusEffect);

	return Template;
}

static function X2AbilityTemplate Warden_BD_Combatives()
{
	local X2AbilityTemplate                 Template;

	Template = PurePassive('Warden_BD_Combatives', "img:///UILibrary_PerkIcons.UIPerk_muton_counterattack", false, 'eAbilitySource_Perk');
	Template.AdditionalAbilities.AddItem('Warden_BD_CombativesAttack');
	Template.AdditionalAbilities.AddiTEm('Warden_BD_CombativesPreparation');
	Template.AdditionalAbilities.AddItem('Warden_BD_CombativesCounterattack');
	Template.AdditionalAbilities.AddItem('Warden_BD_CombativesStats');
	return Template;
}

static function X2AbilityTemplate Warden_BD_CombativesStats()
{
	local X2AbilityTemplate						Template;
	local X2Effect_PersistentStatChange			StatEffect;
	local X2Effect_AdditionalAnimSets			AnimSetEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_CombativesStats');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_muton_counterattack";
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.Hostility = eHostility_Neutral;
	Template.AbilitySourceName = 'eAbilitySource_Perk';

	StatEffect = new class'X2Effect_PersistentStatChange';
	StatEffect.AddPersistentStatChange(eStat_Dodge, 0);
	StatEffect.BuildPersistentEffect(1, true, false, false);
	Template.AddTargetEffect(StatEffect);
	Template.bCrossClassEligible = false;

	AnimSetEffect = new class'X2Effect_AdditionalAnimSets';
	AnimSetEffect.AddAnimSetWithPath("Perk_Warden_BD_Combatives.Anims.AS_CounterAttack");
	Template.AddTargetEffect(AnimSetEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate Warden_BD_CombativesAttack()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee		MeleeHitCalc;
	local X2Effect_ApplyWeaponDamage			PhysicalDamageEffect;
	local X2Effect_SetUnitValue					SetUnitValEffect;
	local X2Effect_IncrementUnitValue			NumberOfActivations;
	local X2Effect_RemoveEffects				RemoveEffects;
	local X2Condition_UnitValue					CheckNumberOfActivations;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_CombativesAttack');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_muton_counterattack";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;

	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.CounterattackActionPoint);
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.bDontDisplayInAbilitySummary = true;

	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	MeleeHitCalc = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = MeleeHitCalc;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	// Damage Effect
	PhysicalDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(PhysicalDamageEffect);

	// Check number of activations this turn
	NumberOfActivations = new class'X2Effect_IncrementUnitValue';
	NumberOfActivations.UnitName = default.NumberOfCounterAttacksValueName;
	NumberOfActivations.CleanupType = eCleanup_BeginTurn;
	NumberOfActivations.NewValueToSet = 1;
	Template.AddShooterEffect(NumberOfActivations);

	// Make a condition which checks that the number of times the abilty has been activated this turn is equal to the maximum allowed by config
	CheckNumberOfActivations = new Class'X2Condition_Unitvalue';
	CheckNumberOfActivations.AddCheckValue(default.NumberOfCounterAttacksValueName,default.MAX_COUNTERATTACKS_ALLOWED,eCheck_Exact);

	// Only set the unitvalue to zero if the number of activations is right
	SetUnitValEffect = new class'X2Effect_SetUnitValue';
	SetUnitValEffect.UnitName = class'X2Ability'.default.CounterattackDodgeEffectName;
	SetUnitValEffect.NewValueToSet = 0;
	SetUnitValEffect.CleanupType = eCleanup_BeginTurn;
	SetUnitValEffect.bApplyOnHit = true;
	SetUnitValEffect.bApplyOnMiss = true;
	SetUnitValEffect.TargetConditions.AddItem(CheckNumberOfActivations);
	Template.AddShooterEffect(SetUnitValEffect);
		
	// Same with the dodge increase
	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Ability'.default.CounterattackDodgeEffectName);
	RemoveEffects.bApplyOnHit = true;
	RemoveEffects.bApplyOnMiss = true;
	RemoveEffects.TargetConditions.AddItem(CheckNumberOfActivations);
	Template.AddShooterEffect(RemoveEffects);

	Template.AbilityTargetStyle = default.SimpleSingleMeleeTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.MergeVisualizationFn = class'X2Ability_Muton'.static.CounterAttack_MergeVisualization;

	Template.CinescriptCameraType = "Ranger_Reaper";

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NormalChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate Warden_BD_CombativesPreparation()
{
	local X2AbilityTemplate					Template;
	local X2AbilityTrigger_EventListener	Trigger;
	local X2Effect_ToHitModifier			DodgeEffect;
	local X2Effect_SetUnitValue				SetUnitValEffect;
	local X2Condition_Unitvalue				CheckMeleeStance;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_CombativesPreparation');

	Template.bDontDisplayInAbilitySummary = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'PlayerTurnEnded';
	Trigger.ListenerData.Filter = eFilter_Player;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(Trigger);
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_UnitPostBeginPlay');

	// Don't trigger if we're in ranged stance
	CheckMeleeStance = new Class'X2Condition_Unitvalue';
	CheckMeleeStance.AddCheckValue(default.MeleeStanceValueName,1,eCheck_Exact);

	// During the Enemy player's turn, the Unit gets a dodge increase
	DodgeEffect = new class'X2Effect_ToHitModifier';
	DodgeEffect.EffectName = class'X2Ability'.default.CounterattackDodgeEffectName;
	DodgeEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	DodgeEffect.AddEffectHitModifier(eHit_Graze, default.COUNTERATTACK_DODGE_AMOUNT, default.CounterattackDodgeName, class'X2AbilityToHitCalc_StandardMelee', true, false, true, true, , false);
	DodgeEffect.bApplyAsTarget = true;
	DodgeEffect.TargetConditions.AddItem(CheckMeleeStance);
	Template.AddShooterEffect(DodgeEffect);

	// The Unit only gets to counterattack in melee stance
	SetUnitValEffect = new class'X2Effect_SetUnitValue';
	SetUnitValEffect.UnitName = class'X2Ability'.default.CounterattackDodgeEffectName;
	SetUnitValEffect.NewValueToSet = class'X2Ability'.default.CounterattackDodgeUnitValue;
	SetUnitValEffect.CleanupType = eCleanup_BeginTurn;
	SetUnitValEffect.TargetConditions.AddItem(CheckMeleeStance);
	Template.AddTargetEffect(SetUnitValEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate Warden_BD_CombativesCounterattack()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_EventListener EventListener;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_CombativesCounterattack');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_muton_counterattack";

	Template.bDontDisplayInAbilitySummary = true;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Offensive;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = 'AbilityActivated';
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.MeleeCounterattackListener;  // this probably has to change
	Template.AbilityTriggers.AddItem(EventListener);

	// Add dead eye to guarantee the explosion occurs
	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityTargetStyle = default.SelfTarget;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.CinescriptCameraType = "AdvStunLancer_StunLancer";

	return Template;
}

static function X2AbilityTemplate Warden_BD_Fissure()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints					ActionPointCost;
	local X2AbilityCooldown								Cooldown;
	local X2AbilityMultiTarget_Radius					RadiusMultiTarget;
	local X2AbilityTarget_Cursor						CursorTarget;
	local X2Effect_DelayedAbilityActivation				DelayedRuptureEffect;
	local X2Effect_MarkValidActivationTiles				MarkTilesEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Fissure');	
	Template.TwoTurnAttackAbility = 'Warden_BD_Fissure_Stage2';

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_psi_drain";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY;

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.bShowActivation = true;
	Template.Hostility = eHostility_Offensive;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	// Sooooooo many poooooiiiinnnnttttssss!
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.FISSURE_COOLDOWN;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.FISSURE_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;
	
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = true;
	CursorTarget.FixedAbilityRange = default.FISSURE_RANGE;
	Template.AbilityTargetStyle = CursorTarget;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	MarkTilesEffect = new class'X2Effect_MarkValidActivationTiles';
	MarkTilesEffect.AbilityToMark = 'Warden_BD_Fissure_Stage2';
	MarkTilesEffect.OnlyUseTargetLocation = true;
	Template.AddShooterEffect(MarkTilesEffect);

	//Effect on a successful test is adding the delayed marked effect to the target
	DelayedRuptureEffect = new class 'X2Effect_DelayedAbilityActivation';
	DelayedRuptureEffect.BuildPersistentEffect(1, false, false, , eGameRule_PlayerTurnBegin);
	DelayedRuptureEffect.EffectName = default.FissureStage1EffectName;
	DelayedRuptureEffect.TriggerEventName = default.FissureTriggerName;
	DelayedRuptureEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddShooterEffect(DelayedRuptureEffect);
	
	Template.TargetingMethod = class'X2TargetingMethod_VoidRift';

	Template.CustomFireAnim = 'HL_Malfunction';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	//Template.BuildAffectedVisualizationSyncFn = PsiBombStage1_BuildAffectedVisualization;
	Template.CinescriptCameraType = "Codex_PsiBomb_Stage1";
//	Template.DamagePreviewFn = PsiBombDamagePreview;
	Template.bFrameEvenWhenUnitIsHidden = true;
	
	Template.AdditionalAbilities.AddItem('Warden_BD_Fissure_Stage2');

	return Template;
}

static function X2AbilityTemplate Warden_BD_Fissure_Stage2()
{
	local X2AbilityTemplate					Template;
	local X2AbilityMultiTarget_Radius		RadiusMultiTarget;
	local X2Condition_UnitProperty			LivingTargetCondition;
	local X2AbilityTrigger_EventListener	DelayedEventListener;
	local X2Effect_ApplyWeaponDamage		RuptureEffect;
	local X2Effect_PerkAttachForFX			FXEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Fissure_Stage2');

	Template.bDontDisplayInAbilitySummary = true;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';

	Template.AbilityToHitCalc = default.DeadEye;

	LivingTargetCondition = new class'X2Condition_UnitProperty';
	LivingTargetCondition.ExcludeFriendlyToSource = true;
	LivingTargetCondition.ExcludeHostileToSource = false;
	LivingTargetCondition.ExcludeAlive = false;
	LivingTargetCondition.ExcludeRobotic = true;
	LivingTargetCondition.ExcludeDead = true;
	LivingTargetCondition.FailOnNonUnits = true;
	Template.AbilityMultiTargetConditions.AddItem(LivingTargetCondition);

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.FISSURE_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	// TODO: This doesn't actually target self but needs an AbilityTargetStyle
	Template.AbilityTargetStyle = default.SelfTarget;

	// This ability fires when the event DelayedExecuteRemoved fires on this unit
	DelayedEventListener = new class'X2AbilityTrigger_EventListener';
	DelayedEventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	DelayedEventListener.ListenerData.EventID = default.FissureTriggerName;
	DelayedEventListener.ListenerData.Filter = eFilter_Unit;
	DelayedEventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_ValidAbilityLocation;
	Template.AbilityTriggers.AddItem(DelayedEventListener);

	// This effect is here to attach perk FX to
	FXEffect = new class'X2Effect_PerkAttachForFX';
	Template.AddShooterEffect(FXEffect);

	RuptureEffect = new class'X2Effect_ApplyWeaponDamage';
	RuptureEffect.EffectDamageValue.Rupture = default.FISSURE_AMOUNT;
	Template.AddMultiTargetEffect(RuptureEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Codex_PsiBomb_Stage2";
//BEGIN AUTOGENERATED CODE: Template Overrides 'PsiBombStage2'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'PsiBombStage2'

	return Template;
}

static function X2DataTemplate Warden_BD_Tide()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCooldown						Cooldown;
	local X2Condition_UnitProperty				UnitPropertyCondition;
	local X2Condition_UnitProperty				KnockbackCondition;
	local X2AbilityTrigger_PlayerInput			InputTrigger;
	local X2AbilityMultiTarget_Radius			MultiTarget;
	local X2Effect_Stunned						StunnedEffect;
	local X2Effect_Knockback					KnockbackEffect;
	local X2Effect_ApplyWeaponDamage			DamageEffect;
	local X2Condition_BD_ImmuneToFalling		ImmuneToFallingCondition;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Tide');
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_chosenreckoning";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY;

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Offensive;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	// Points Ahoy!
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	
	
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.TIDE_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	//Can't use while dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	// Add dead eye to guarantee
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	// Multi target
	MultiTarget = new class'X2AbilityMultiTarget_Radius';
	MultiTarget.fTargetRadius = default.TIDE_RADIUS;
	MultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = MultiTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	// The Targets must be within the AOE & LOS
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeHostileToSource = false;
	UnitPropertyCondition.ExcludeCivilian = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

	KnockbackCondition = new class'X2Condition_UnitProperty';
	KnockbackCondition.ExcludeLargeUnits = true;

	ImmuneToFallingCondition = new class 'X2Condition_BD_ImmuneToFalling';

	// Damage all but flying, stun all and knockback small, non flying stuff
	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.bIgnoreArmor = true;
	DamageEffect.bBypassShields = true;
	DamageEffect.EffectDamageValue.Damage = default.TIDE_DAMAGE_AMOUNT;
	DamageEffect.EffectDamageValue.PlusOne = default.TIDE_DAMAGE_PLUSONE;
	DamageEffect.EnvironmentalDamageAmount = default.TIDE_ENVDAMAGE;
	DamageEffect.TargetConditions.AddItem(ImmuneToFallingCondition);
	Template.AddMultiTargetEffect(DamageEffect);
	
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(default.TIDE_STUN_TURNS, 100, false);
	StunnedEffect.bRemoveWhenSourceDies = false;
	Template.AddMultiTargetEffect(StunnedEffect); 

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = default.TIDE_KNOCKBACK_DISTANCE;
	KnockbackEffect.TargetConditions.AddItem(ImmuneToFallingCondition);
	KnockbackEffect.TargetConditions.AddItem(KnockbackCondition);
	Template.AddMultiTargetEffect(KnockbackEffect);
	
	Template.ActivationSpeech = 'NullLance';
	Template.CustomFireAnim = 'HL_WardenPush';
	Template.bShowActivation = true;
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "AdvShieldBearer_EnergyShieldArmor";

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	
	return Template;
}

static function X2DataTemplate Warden_BD_Consume()
{
	local X2AbilityTemplate							Template;
	local X2AbilityCost_ActionPoints				ActionPointCost;
	local X2AbilityCooldown							Cooldown;
	local X2Condition_UnitProperty					UnitPropertyCondition;
	local X2AbilityMultiTarget_Radius				RadiusMultiTarget;
	local X2Effect_RemoveEffectsByDamageType		RemoveEffects;
	local X2Effect_WardenStatusEffectCounter		StatusEffectCounter;
	local name										HealType;
	local X2AbilityTarget_Cursor					CursorTarget;
	local X2Effect_TriggerEvent						TriggerDamageEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Consume');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_neuraldampingmodule";

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Neutral;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	// Points Ahoy!
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	
	
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.CONSUME_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	//Can't use while dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.CONSUME_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;
	
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = true;
	CursorTarget.FixedAbilityRange = default.CONSUME_RANGE;
	Template.AbilityTargetStyle = CursorTarget;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.TargetingMethod = class'X2TargetingMethod_VoidRift';

	// The Targets must be within the AOE, LOS & Friendly
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeCivilian = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

	// Count the number of status effects removed in the AOE and assign it to a unitvar
	StatusEffectCounter = new class'X2Effect_WardenStatusEffectCounter';
	Template.AddMultiTargetEffect(StatusEffectCounter);

	RemoveEffects = new class'X2Effect_RemoveEffectsByDamageType';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.PanickedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2StatusEffects'.default.UnconsciousName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Effect_ParthenogenicPoison'.default.EffectName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.DazedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ObsessedName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.BerserkName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.ShatteredName);
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2AbilityTemplateManager'.default.StunnedName);
	foreach class'X2Ability_DefaultAbilitySet'.default.MedikitHealEffectTypes(HealType)
		{
			RemoveEffects.DamageTypesToRemove.AddItem(HealType);
		}
	Template.AddMultiTargetEffect(RemoveEffects);
	
	TriggerDamageEffect = new Class'X2Effect_TriggerEvent';
	TriggerDamageEffect.TriggerEventName = 'ConsumeTrigger';	
	Template.AddShooterEffect(TriggerDamageEffect);
		
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "AdvShieldBearer_EnergyShieldArmor";	
	
	Template.AdditionalAbilities.AddItem('Warden_BD_ConsumeAdditionalDamage');

	return Template;
}

static final function X2AbilityTemplate Warden_BD_ConsumeAdditionalDamage()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2Effect_WardenConsumeDamage							ConsumeDamageEffect;
	local X2AbilityTrigger_EventListener						ConsumeTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_ConsumeAdditionalDamage');
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_neuraldampingmodule";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;

	// Free action triggered by consume main ability
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 0; 
	Template.AbilityCosts.AddItem(ActionPointCost);

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	
		
	ConsumeTrigger = new class'X2AbilityTrigger_EventListener';
	ConsumeTrigger.ListenerData.EventID = 'ConsumeTrigger';
	ConsumeTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	ConsumeTrigger.ListenerData.Filter = eFilter_Unit;
	ConsumeTrigger.ListenerData.Priority = 50;
	ConsumeTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(ConsumeTrigger);

	// Set up persistent effect for the additional damage
	ConsumeDamageEffect = new class'X2Effect_WardenConsumeDamage';
	ConsumeDamageEffect.EffectName = default.ConsumeDamageEffectName;
	ConsumeDamageEffect.DuplicateResponse = eDupe_Ignore;
	ConsumeDamageEffect.BuildPersistentEffect(1, true, false);
	ConsumeDamageEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	Template.AddTargetEffect(ConsumeDamageEffect);
	
	Template.Hostility = eHostility_Neutral;

	Template.bShowActivation = false;
	Template.bSkipFireAction = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CustomSelfFireAnim = 'HL_IdleA';
	Template.bCrossClassEligible = false;
		
	return Template;
}

static function X2AbilityTemplate Warden_BD_RagePassive()
{
	local X2AbilityTemplate						Template;

	Template = CreatePassiveAbility('Warden_BD_RagePassive', "img:////UILibrary_PerkIcons.UIPerk_rapidfire");
	Template.bCrossClassEligible = false;
	Template.AbilitySourceName = 'eAbilitySource_psionic';

	return Template;
}

static function X2AbilityTemplate Warden_BD_ChargePassive()
{
	local X2AbilityTemplate						Template;

	Template = CreatePassiveAbility('Warden_BD_ChargePassive', "img:///UILibrary_PerkIcons.UIPerk_charge");
	Template.bCrossClassEligible = false;
	Template.AbilitySourceName = 'eAbilitySource_psionic';

	return Template;
}

static function X2AbilityTemplate Warden_BD_Retribution()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints					ActionPointCost;
	local X2AbilityCooldown								Cooldown;
	local X2AbilityMultiTarget_Radius					RadiusMultiTarget;
	local X2AbilityTarget_Cursor						CursorTarget;
	local X2Effect_DelayedAbilityActivation				DelayedRuptureEffect;
	local X2Effect_MarkValidActivationTiles				MarkTilesEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Retrribution');	
	Template.TwoTurnAttackAbility = 'Warden_BD_Retribution_Stage2';

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_observer";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.bShowActivation = true;
	Template.Hostility = eHostility_Offensive;

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1; 
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;

	// MAXIMUM POINTS.
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);	

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.RETRIBUTION_COOLDOWN;
	Template.AbilityCooldown = Cooldown;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.RETRIBUTION_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;
	
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = true;
	CursorTarget.FixedAbilityRange = default.RETRIBUTION_RANGE;
	Template.AbilityTargetStyle = CursorTarget;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	MarkTilesEffect = new class'X2Effect_MarkValidActivationTiles';
	MarkTilesEffect.AbilityToMark = 'Warden_BD_Retribution_Stage2';
	MarkTilesEffect.OnlyUseTargetLocation = true;
	Template.AddShooterEffect(MarkTilesEffect);

	//Effect on a successful test is adding the delayed marked effect to the target
	DelayedRuptureEffect = new class 'X2Effect_DelayedAbilityActivation';
	DelayedRuptureEffect.BuildPersistentEffect(1, false, false, , eGameRule_PlayerTurnEnd);
	DelayedRuptureEffect.EffectName = default.RetributionStage1EffectName;
	DelayedRuptureEffect.TriggerEventName = default.RetributionTriggerName;
	DelayedRuptureEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddShooterEffect(DelayedRuptureEffect);
	
	Template.TargetingMethod = class'X2TargetingMethod_VoidRift';

	Template.CustomFireAnim = 'HL_Malfunction';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	//Template.BuildAffectedVisualizationSyncFn = PsiBombStage1_BuildAffectedVisualization;
	Template.CinescriptCameraType = "Codex_PsiBomb_Stage1";
	//	Template.DamagePreviewFn = PsiBombDamagePreview;
	Template.bFrameEvenWhenUnitIsHidden = true;
	
	Template.AdditionalAbilities.AddItem('Warden_BD_Fissure_Stage2');

	return Template;
}

static function X2AbilityTemplate Warden_BD_Retribution_Stage2()
{
	local X2AbilityTemplate							Template;
	local X2AbilityMultiTarget_Radius				RadiusMultiTarget;
	local X2Condition_UnitProperty					LivingTargetCondition;
	local X2AbilityTrigger_EventListener			DelayedEventListener;
	local X2Effect_WardenAddOverwatchActionPoints	OverwatchEffect;
	local X2Effect_PerkAttachForFX					FXEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Retribution_Stage2');

	Template.bDontDisplayInAbilitySummary = true;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';

	Template.AbilityToHitCalc = default.DeadEye;

	LivingTargetCondition = new class'X2Condition_UnitProperty';
	LivingTargetCondition.ExcludeFriendlyToSource = false;
	LivingTargetCondition.ExcludeHostileToSource = true;
	LivingTargetCondition.ExcludeRobotic = true;
	LivingTargetCondition.ExcludeAlive = false;
	LivingTargetCondition.ExcludeDead = true;
	LivingTargetCondition.FailOnNonUnits = true;
	Template.AbilityMultiTargetConditions.AddItem(LivingTargetCondition);

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.RETRIBUTION_RADIUS;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	// TODO: This doesn't actually target self but needs an AbilityTargetStyle
	Template.AbilityTargetStyle = default.SelfTarget;

	// This ability fires when the event DelayedExecuteRemoved fires on this unit
	DelayedEventListener = new class'X2AbilityTrigger_EventListener';
	DelayedEventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	DelayedEventListener.ListenerData.EventID = default.RetributionTriggerName;
	DelayedEventListener.ListenerData.Filter = eFilter_Unit;
	DelayedEventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_ValidAbilityLocation;
	Template.AbilityTriggers.AddItem(DelayedEventListener);

	// This effect is here to attach perk FX to
	FXEffect = new class'X2Effect_PerkAttachForFX';
	Template.AddShooterEffect(FXEffect);

	OverwatchEffect = new class'X2Effect_WardenAddOverwatchActionPoints';
	Template.AddMultiTargetEffect(OverwatchEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Codex_PsiBomb_Stage2";
//BEGIN AUTOGENERATED CODE: Template Overrides 'PsiBombStage2'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'PsiBombStage2'

	return Template;
}
// |---------------------|
// | Random Ability Deck |
// |---------------------|

static function X2AbilityTemplate Warden_BD_Brand()
{

	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2Effect_ToHitModifier								HitModEffect;
	local X2Effect_WardenBrandDamage							DamageEffect;

	Template = CreateSingleTargetAbility('Warden_BD_Brand', "img:///UILibrary_PerkIcons.UIPerk_xenobiology_overlays");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Offensive;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.ActivationSpeech = 'Amplify';
	Template.CustomFireAnim = 'HL_SignalPointAttackA';
		
	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.BRAND_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	// Apply ToHit modifying effect
	HitModEffect = new class'X2Effect_ToHitModifier';
	HitModEffect.EffectName = 'WOTC_APA_BrandHitEffect';
	HitModEffect.bApplyAsTarget = true;
	HitModEffect.bRemoveWhenTargetDies = true;
	HitModEffect.AddEffectHitModifier(eHit_Success, default.BRAND_OFFENSE_STAT_BONUS, Template.LocFriendlyName);
	HitModEffect.AddEffectHitModifier(eHit_Crit, default.BRAND_OFFENSE_STAT_BONUS, Template.LocFriendlyName);
	HitModEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, "Branded", Template.IconImage);
	HitModEffect.BuildPersistentEffect(1, true, true);
	HitModEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(HitModEffect);

	// Apply Damage-modifying effect
	DamageEffect = new class'X2Effect_WardenBrandDamage';
	DamageEffect.EffectName = 'WOTC_APA_BrandDamageEffect';
	DamageEffect.BonusDmg = default.BRAND_DAMAGE_BONUS;
	DamageEffect.BonusCritDmg = default.BRAND_CRIT_DAMAGE_BONUS;	
	DamageEffect.BuildPersistentEffect(1, true, true);
	DamageEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, "Branded", Template.IconImage);
	DamageEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(DamageEffect);
	
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}

// Pillar
static final function X2AbilityTemplate Warden_BD_Pillar()
{
	local X2AbilityTemplate				Template;
	local X2AbilityTarget_Cursor		Cursor;
	local X2AbilityMultiTarget_Radius	RadiusMultiTarget;
	local X2AbilityCost_ActionPoints	ActionPointCost;
	local X2Effect_WardenPillar			PillarEffect;
	local X2AbilityCooldown				Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Pillar');

	Template.AbilityToHitCalc = default.DeadEye;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;	
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
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
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

	PillarEffect = new class'X2Effect_WardenPillar';		
	PillarEffect.Duration = default.PILLAR_DURATION;
	PillarEffect.BuildPersistentEffect(default.PILLAR_DURATION, false, true, false, eGameRule_PlayerTurnBegin);	
	PillarEffect.DestructibleArchetype = "FX_Templar_Pillar.Pillar_Destructible";
	Template.AddShooterEffect(PillarEffect);
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = Pillar_BuildVisualization;
	
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate Warden_BD_Inspire()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCost_ActionPoints	ActionPointCost;
	local X2Effect_GrantActionPoints	ActionPointEffect;
	local X2Effect_Persistent			ActionPointPersistEffect;
	local X2Condition_UnitProperty      TargetCondition;
	local X2AbilityCooldown             Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Inspire');

	// Icon Properties
	Template.DisplayTargetHitChance = true;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';                                       // color of the icon
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_psi_inspiration";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bLimitTargetIcons = true;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;	
	
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.INSPIRE_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeHostileToSource = true;
	TargetCondition.ExcludeFriendlyToSource = false;
	TargetCondition.RequireSquadmates = true;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeRobotic = true;
	TargetCondition.ExcludeUnableToAct = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	ActionPointEffect = new class'X2Effect_GrantActionPoints';
	ActionPointEffect.NumActionPoints = 1;
	ActionPointEffect.PointType = class'X2CharacterTemplateManager'.default.StandardActionPoint;
	ActionPointEffect.bSelectUnit = true;
	Template.AddTargetEffect(ActionPointEffect);

	// A persistent effect for the effects code to attach a duration to
	ActionPointPersistEffect = new class'X2Effect_Persistent';
	ActionPointPersistEffect.EffectName = 'Inspiration';
	ActionPointPersistEffect.BuildPersistentEffect( 1, false, true, false, eGameRule_PlayerTurnEnd );
	ActionPointPersistEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(ActionPointPersistEffect);

	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	
	Template.ActivationSpeech = 'Inspire';

	Template.bShowActivation = true;
	Template.CustomFireAnim = 'HL_Psi_ProjectileMedium';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Psionic_FireAtUnit";

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
//BEGIN AUTOGENERATED CODE: Template Overrides 'Inspire'
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
//END AUTOGENERATED CODE: Template Overrides 'Inspire'

	return Template;
}

static function X2AbilityTemplate Warden_BD_Fuse()
{
	local X2AbilityTemplate             Template;
	local X2AbilityCost_ActionPoints    ActionPointCost;
	local X2AbilityCooldown				Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Fuse');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_fuse";
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.Hostility = eHostility_Offensive;
	Template.bLimitTargetIcons = true;

	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.FUSE_COOLDOWN;
	Template.AbilityCooldown = Cooldown;
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;
	ActionPointCost.AllowedTypes.AddItem(default.SpecialMomentumAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageAP);
	ActionPointCost.AllowedTypes.AddItem(default.ChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.RageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.WatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.CrusaderWatcherRageChargeAP);
	ActionPointCost.AllowedTypes.AddItem(default.DefenderCrusaderWatcherRageChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);	
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityTargetConditions.AddItem(new class'X2Condition_FuseTarget');	
	Template.AddShooterEffectExclusions();

	Template.PostActivationEvents.AddItem(class'X2Ability_PsiOperativeAbilitySet'.default.FuseEventName);
	Template.PostActivationEvents.AddItem(class'X2Ability_PsiOperativeAbilitySet'.default.FusePostEventName);

	Template.bShowActivation = true;
	Template.CustomFireAnim = 'HL_SignalPointAttackA';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.TargetingMethod = class'X2TargetingMethod_Fuse';
	Template.CinescriptCameraType = "Psionic_FireAtUnit";
	Template.DamagePreviewFn = WardenFuseDamagePreview;

	//Retain concealment when activating Fuse - then break it after the explosions have occurred.
	Template.ConcealmentRule = eConceal_Always;
	Template.AdditionalAbilities.AddItem('FusePostActivationConcealmentBreaker');
	//BEGIN AUTOGENERATED CODE: Template Overrides 'Fuse'
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	//END AUTOGENERATED CODE: Template Overrides 'Fuse'

	return Template;
}

function bool WardenFuseDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
	local XComGameStateHistory History;
	local XComGameState_Ability FuseTargetAbility;
	local XComGameState_Unit TargetUnit;
	local StateObjectReference EmptyRef, FuseRef;

	History = `XCOMHISTORY;
	TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(TargetRef.ObjectID));
	if (TargetUnit != none)
	{
		if (class'X2Condition_FuseTarget'.static.GetAvailableFuse(TargetUnit, FuseRef))
		{
			FuseTargetAbility = XComGameState_Ability(History.GetGameStateForObjectID(FuseRef.ObjectID));
			if (FuseTargetAbility != None)
			{
				//  pass an empty ref because we assume the ability will use multi target effects.
				FuseTargetAbility.GetDamagePreview(EmptyRef, MinDamagePreview, MaxDamagePreview, AllowsShield);
				return true;
			}
		}
	}
	return false;
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
	local bool							bIsAffectedByTotalCombat;
		    
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
   `log("SpeialAPTrigger Eventlistener triggered with: " @ActivatedAbilityState.GetMyTemplateName());
    if (AbilityTemplate == none)
        return ELR_NoInterrupt;
	
	// If the ability is affected by total combat & the warden has the correct passive
	If (SourceUnit.HasSoldierAbility('Warden_BD_TotalCombat') && IsAbilityAffectedByTotalCombat(AbilityTemplate))
	{
	bIsAffectedByTotalCombat = true;
	}

	If (!bIsAffectedByTotalCombat)
	{
		// fallback if it's not offensive (skip totalcombat)
		 `log("SpeialAPTrigger Hostility: " @AbilityTemplate.Hostility);
		if (AbilityTemplate.Hostility != eHostility_Offensive)  
			return ELR_NoInterrupt;        
    
		// Fallback if no weapon (skip totalcombat)
		SourceWeapon = ActivatedAbilityState.GetSourceWeapon();
		`log("SpeialAPTrigger Weapon: " @SourceWeapon);
		if (SourceWeapon == none)
			return ELR_NoInterrupt; 
		
		// fallback if it does no damage (skip totalcombat)
		`log("SpecialAPTrigger Ability Deals Damage: " @ AbilityTemplate.TargetEffectsDealDamage(SourceWeapon, ActivatedAbilityState));    
		if (!AbilityTemplate.TargetEffectsDealDamage(SourceWeapon, ActivatedAbilityState))
	         return ELR_NoInterrupt; 
	}	
	// Fallback if any of these APs have been granted already
	If (SourceUnit.GetUnitValue(default.FlowAPGrantedValueName, UV))
		return ELR_NoInterrupt;
		
	// Grant APs if turn ending attack in correct stance  
	if ((SourceUnit.GetUnitValue(default.MeleeStanceValueName, UV) && SourceWeapon.InventorySlot == eInvSlot_SecondaryWeapon && SourceUnit.NumAllActionPoints() == 0) || (SourceUnit.GetUnitValue(default.RangedStanceValueName, UV) && SourceWeapon.InventorySlot == eInvSlot_PrimaryWeapon && SourceUnit.NumAllActionPoints() == 0) || bIsAffectedByTotalCombat)
    {
    `LOG("SpecialAPTrigger Passed - Granting Flow APs");
		//Assign one of the several million combinations of action point types based on the various passive abilities which are active at any given moment
		If (SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderWatcherRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderWatcherRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderWatcherChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderWatcherRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderWatcherRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderWatcherAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderWatcherRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderWatcherChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusdaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderWatcherRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusdaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderWatcherChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusdaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.WatcherRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderWatcherAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderWatcherAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.WatcherRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.WatcherChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.RageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive'))
				{
				GrantSpecialAP(SourceUnit, default.WatcherAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.RageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_ChargePassive'))
				{
				GrantSpecialAP(SourceUnit, default.ChargeAP);
				}
		Else	{
				GrantSpecialAP(SourceUnit, default.SpecialMomentumAP);
				}
	}
	return ELR_NoInterrupt;	
}

//Flow AP Helper
static final function GrantSpecialAP(XComGameState_Unit UnitState, name ActionPointType)
{
    local XComGameState NewGameState;

    NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Special AP to:" @ UnitState.GetFullName());
    UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(UnitState.class, UnitState.ObjectID));
    UnitState.ActionPoints.AddItem(ActionPointType);  
	//Note that we don't really need to set unitvalues for the other AP types since they only exist 
	//for the benefit of being minimally invasive to the base-game abilities & to save putting conditions on them
	`Log("I just added a " @ ActionPointType @ " to the unit");
	UnitState.SetUnitFloatValue(default.FlowAPGrantedValueName, 1, eCleanup_BeginTactical);
	`Log("I just set the FlowAP unitvalue in GrantFlowAPs");	
    `GAMERULES.SubmitGameState(NewGameState);
}

// Mirror EventListener
static final function EventListenerReturn MirrorReturnFireListener(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
	local XComGameState_Unit				DamageSourceUnit;
	local XComGameState_Ability				AbilityState;
	local XComGameStateContext_Ability		AbilityContext;
	local XComGameStateHistory				History;

	History = `XCOMHISTORY;
	
	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	AbilityState = XComGameState_Ability(CallbackData);
	
	`LOG("Mirror Listener Fired - Ability Context is " @ AbilityContext.name);
	`LOG("Mirror Listener Fired - Ability Object ID is " @ AbilityState.ObjectID);
	if (AbilityContext != none)
	{		
		DamageSourceUnit = XComGameState_Unit(GameState.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));	
			if( DamageSourceUnit == none )
			{
			DamageSourceUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));
			}		
			`Log("Mirror Source Unit is " @ DamageSourceUnit.name);
		
		AbilityState.AbilityTriggerAgainstSingleTarget(DamageSourceUnit.GetReference(), false);
	}
	return ELR_NoInterrupt;	
}	

//	========================================
//				Visualisation Functions
//	========================================

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

//	========================================
//				Helper Functions 
//	========================================

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

// Total combat helper
static final function bool IsAbilityAffectedByTotalCombat(const X2AbilityTemplate Template)
{
    local X2AbilityCost						Cost;
    local X2AbilityCost_ActionPoints		ActionCost;
    local bool								bAffectedByTotalCombat;

    `log("TotalCombatCheck: Checking if affected by total combat on: " @ Template.LocFriendlyName);
    foreach Template.AbilityCosts(Cost)    
	{
        `log("Cost Name:" @ Cost.Name @ "Cost Class: " @ Cost.Class);
		ActionCost = X2AbilityCost_ActionPoints(Cost);
			if (ActionCost == none || ActionCost.bFreeCost || !ActionCost.bConsumeAllPoints)           
			{
			 `log("TotalCombatCheck: bFreeCost: " @ActionCost.bFreeCost@ "ConsumeAllPoints: " @ ActionCost.bConsumeAllPoints);
			continue;
			}	
       
	    // An ability might have several Action Costs, so we must iterate over all of them.
        // If we're here, then this is a non-free action cost that normally ends turn.
        if (ActionCost.DoNotConsumeAllSoldierAbilities.Find('TotalCombat') != INDEX_NONE)
        {
            // If Totalcombat is in the array, set bAffected to true
            `log("TotalCombatCheck: Found an instance of ability cost affected by total combat");
			bAffectedByTotalCombat = true;
		}
        else
        {
            // But return false if at lest one of the action costs isn't affected by it.
            `log("TotalCombatCheck: Another ability cost on the same ability isn't affected by total combat - returning false");
			return false;
        }
    }
	// If at this point bAffectedByTotalCombat is true, then all of this ability's action costs are effected by Total Combat.
    `log("TotalCombatCheck:" @ Template.LocFriendlyName @ " Affected by total combat status returning: " @ bAffectedByTotalCombat);
	return bAffectedByTotalCombat;
}

// Single target helper from prof
static function X2AbilityTemplate CreateSingleTargetAbility(name AbilityName, optional string IconString, optional bool bLimitWhenImpaired = true, optional array<name> SkipExclusions)
{
	
	local X2AbilityTemplate					Template;
	

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);
	Template.IconImage = IconString;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.DisplayTargetHitChance = false;
	Template.bLimitTargetIcons = true;
	Template.bShowActivation = true;
	Template.bCrossClassEligible = false;
	Template.bUniqueSource = true;


	// Unit cannot be disoriented, confused, dazed, stunned, burning, bound, or carrying a unit
	if (bLimitWhenImpaired)
	{
		Template.AddShooterEffectExclusions(SkipExclusions);
	}

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	return Template;
}

// SetVeryHidden
static function SetVeryHidden(out X2AbilityTemplate Template)
{
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	
	//TacticalText is for mainly for item-granted abilities (e.g. to hide the ability that gives the Armor stats)
	Template.bDisplayInUITacticalText = false;
	
	//	bDisplayInUITooltip isn't actually used in the base game, it should be for whether to show it in the enemy tooltip, 
	//	but showing enemy abilities didn't make it into the final game. Extended Information resurrected the feature  in its enhanced enemy tooltip, 
	//	and uses that flag as part of it's heuristic for what abilities to show, but doesn't rely solely on it since it's not set consistently even on base game abilities. 
	//	Anyway, the most sane setting for it is to match 'bDisplayInUITacticalText'. (c) MrNice
	Template.bDisplayInUITooltip = false;
	
	//Ability Summary is the list in the Armory when you're looking at a soldier.
	Template.bDontDisplayInAbilitySummary = true;
	Template.bHideOnClassUnlock = true;
}

// SetHidden
static function SetHidden(out X2AbilityTemplate Template)
{
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	
	//TacticalText is for mainly for item-granted abilities (e.g. to hide the ability that gives the Armor stats)
	Template.bDisplayInUITacticalText = false;
	
	//	bDisplayInUITooltip isn't actually used in the base game, it should be for whether to show it in the enemy tooltip, 
	//	but showing enemy abilities didn't make it into the final game. Extended Information resurrected the feature  in its enhanced enemy tooltip, 
	//	and uses that flag as part of it's heuristic for what abilities to show, but doesn't rely solely on it since it's not set consistently even on base game abilities. 
	//	Anyway, the most sane setting for it is to match 'bDisplayInUITacticalText'. (c) MrNice
	Template.bDisplayInUITooltip = false;
	
	//Ability Summary is the list in the Armory when you're looking at a soldier.
	Template.bDontDisplayInAbilitySummary = false;
	Template.bHideOnClassUnlock = false;
}

//Createpassive
static function X2AbilityTemplate CreatePassiveAbility(name AbilityName, optional string IconString, optional name IconEffectName = AbilityName, optional bool bDisplayIcon = true)
{
	
	local X2AbilityTemplate					Template;
	local X2Effect_Persistent				IconEffect;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);
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
	IconEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, bDisplayIcon,, Template.AbilitySourceName);
	IconEffect.EffectName = IconEffectName;
	Template.AddTargetEffect(IconEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	return Template;
}

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

defaultproperties
{
	//AP Types
	SpecialMomentumAP = "BD_SpecialMomentumAP"
	DefenderAP = "BD_DefenderAP"
	CrusaderAP = "BD_CrusaderAP"
	WatcherAP = "BD_WatcherAP"
	RageAP = "BD_RageAP"
	ChargeAP = "BD_ChargeAP"
	DefenderCrusaderAP = "BD_DefenderCrusaderAP"
	DefenderWatcherAP = "BD_DefenderWatcherAP"
	DefenderRageAP = "BD_DefenderRageAP"
	DefenderChargeAP = "BD_DefenderChargeAP"
	CrusaderWatcherAP = "BD_CrusaderWatcherAP"
	CrusaderRageAP = "BD_CrusaderRageAP"
	CrusaderChargeAP = "BD_CrusaderChargeAP"
	WatcherRageAP = "BD_WatcherRageAP"
	WatcherChargeAP = "BD_WatcherChargeAP"
	RageChargeAP = "BD_RageChargeAP"
	DefenderCrusaderWatcherAP = "BD_DefenderCrusaderWatcherAP"
	DefenderCrusaderRageAP = "BD_DefenderCrusaderRageAP"
	DefenderCrusaderChargeAP = "BD_DefenderCrusaderChargeAP"
	DefenderWatcherRageAP = "BD_DefenderWatcherRageAP"
	DefenderWatcherChargeAP = "BD_DefenderWatcherChargeAP"
	DefenderRageChargeAP = "BD_DefenderRageChargeAP"
	CrusaderWatcherRageAP = "BD_CrusaderWatcherRageAP"
	CrusaderWatcherChargeAP = "BD_CrusaderWatcherChargeAP"
	CrusaderRageChargeAP = "BD_CrusaderRageChargeAP"
	WatcherRageChargeAP = "BD_WatcherRageChargeAP"
	DefenderCrusaderWatcherRageAP = "BD_DefenderCrusaderWatcherRageAP"
	DefenderCrusaderWatcherChargeAP = "BD_DefenderCrusaderWatcherChargeAP"
	DefenderCrusaderRageChargeAP = "BD_DefenderCrusaderRageChargeAP"
	DefenderWatcherRageChargeAP = "BD_DefenderWatcherRageChargeAP"
	CrusaderWatcherRageChargeAP = "CrusaderWatcherRageChargeAP"
	DefenderCrusaderWatcherRageChargeAP = "DefenderCrusaderWatcherRageChargeAP"

	//Unit Value Names
	MeleeStanceValueName = "BD_MeleeStance_Value"
	RangedStanceValueName = "BD_RangedStance_Value"
	FlowAPGrantedValueName = "BD_FlowAPGranted_Value"
	SoulBladeValueName = "BD_SoulBlade_Value"
	GunFocusCounterValueName = "BD_GunFocusCounter_Value"
	MeleeFocusCounterValueName = "BD_MeleeFocusCounter_Value"
	NumberOfCounterAttacksValueName = "BD_NumberOfCounterAttacks_Value"
	KineticArmorExpendedShields = "BD_KineticArmor_Value"
	KineticArmorBonusDamageValue = "BD_KineticArmorBonusDamage_Value"
	ConsumeBonusDamageValue = "BD_ConsumeBonusDamageValue"

	//Effect Names
	MeleeStanceMobilityEffectName = "BD_MeleeStanceMobilityEffect"	
	RangedStanceCdefEffectName = "BD_RangedStanceEffect"		
	KineticArmorEffectName = "BD_KineticArmorEffect"
	KineticArmorDamageEffectName = "BD_KineticArmorDamageEffect"
	ConsumeDamageEffectName = "BD_ConsumeDamageEffect"
	MirrorEffectName = "BD_MirrorEffect"
	MirrorReturnFireEffectName = "BD_MirrorReturnFireEffect"
	DefenderImmunityEffectName = "BD_DefenderImmunityEffect"
	FissureStage1EffectName="BD_FissureStage1Effect"
	DefensiveWardStage1EffectName="BD_DefensiveWardStage1Effect"
	RetributionStage1EffectName="BD_RetributionStage1Effect"

	//Triggers
	FissureTriggerName="FissureTrigger"
	DefensiveWardTriggerName="DefensiveWardTrigger"
	RetributionTriggerName="RetributionTrigger"
}
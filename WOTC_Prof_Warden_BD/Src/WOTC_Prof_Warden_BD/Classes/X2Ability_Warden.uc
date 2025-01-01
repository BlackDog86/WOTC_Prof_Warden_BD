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
var const name	FissureStage1FXName;
var const name	DefensiveWardStage1EffectName;
var const name	DefensiveWardStage1FXName;
var const name	RetributionStage1EffectName;
var const name	RetributionStage1FXName;
var const name  ConsumeFXName;

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
var const name	SpecialChargeAP;

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

var config int	IMBUEAMMO_COOLDOWN;
var config int	IMBUEAMMO_DAMAGE_BONUS;
var config int	SOULBLADE_COOLDOWN;
var config int	SOULBLADE_DAMAGE_BONUS;

var config int	DEFENSIVE_WARD_COOLDOWN;
var config int	DEFENSIVE_WARD_RADIUS_METERS;
var config int	DEFENSIVE_WARD_RANGE;
var config int	DEFENSIVE_WARD_DAMAGE;
var config int	DEFENSIVE_WARD_SPREAD;
var config int	SEAL_START_DELAY;

var config int	RANGED_COUNTERATTACK_DODGE_AMOUNT;
var config int	MELEE_COUNTERATTACK_DODGE_AMOUNT;
var config int	MAX_COUNTERATTACKS_ALLOWED;

var config int	FISSURE_RADIUS_METERS;
var config int	FISSURE_RANGE;
var config int	FISSURE_AMOUNT;
var config int	FISSURE_COOLDOWN;

var config int	TIDE_COOLDOWN;
var config int	TIDE_RADIUS_METERS;
var config int	TIDE_DAMAGE_AMOUNT;
var config int	TIDE_ENVDAMAGE;
var config int	TIDE_STUN_TURNS;
var config int	TIDE_KNOCKBACK_DISTANCE;

var config int	CONSUME_COOLDOWN;
var config int	CONSUME_RADIUS_METERS;
var config int	CONSUME_RANGE;

var config int	RETRIBUTION_COOLDOWN;
var config int	RETRIBUTION_RADIUS_METERS;
var config int	RETRIBUTION_RANGE;

var config int	BRAND_OFFENSE_STAT_BONUS;
var config int	BRAND_DAMAGE_BONUS;
var config int	BRAND_CRIT_DAMAGE_BONUS;
var config int	BRAND_COOLDOWN;

var config int	PILLAR_COOLDOWN;
var config int	PILLAR_DURATION;

var config int	FUSE_COOLDOWN;
var config int	INSPIRE_COOLDOWN;

//Visualization variables
var localized string BrandedFriendlyName;

// Template creation - Do over-rides for cost based ability colours
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;		
	Templates.AddItem(Warden_BD_RangedStance());
	Templates.AddItem(Warden_BD_MeleeStance());
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
	Templates.AddItem(Warden_BD_GrantImbueAmmoCharges());
	Templates.AddItem(Warden_BD_GrantSoulBladeCharges());
	Templates.AddItem(Warden_BD_NonStandardShot());
	Templates.AddItem(Warden_BD_NonStandardSlash());
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
	Templates.AddItem(Warden_BD_Fissure());
	Templates.AddItem(Warden_BD_Fissure_Stage2());
	Templates.AddItem(Warden_BD_Tide());
	Templates.AddItem(Warden_BD_Consume());
	Templates.AddItem(Warden_BD_ConsumeAdditionalDamage());
	Templates.AddItem(Warden_BD_RagePassive());	
	Templates.AddItem(Warden_BD_Charge());
	Templates.AddItem(Warden_BD_Retribution());
	Templates.AddItem(Warden_BD_Retribution_Stage2());
	Templates.AddItem(Warden_BD_Brand());
	Templates.AddItem(Warden_BD_Pillar());
	Templates.AddItem(Warden_BD_Inspire());
	Templates.AddItem(Warden_BD_TotalCombat());
	Templates.AddItem(Warden_BD_Fuse());
	return Templates;
}

// Ranged Stance - This class also acts as a hook for all of the additional anim-sets which will be applied on the unit
static final function X2AbilityTemplate Warden_BD_RangedStance()
{
	local X2AbilityTemplate										Template;	
	local X2AbilityTrigger_EventListener						RangedTrigger;
	local X2Effect_SetUnitValue									SetUnitValueEffect;
	local X2Effect_IncrementUnitValue							CounterEffect;
	local X2Effect_ClearUnitValue								ClearUnitValueEffect, ClearUnitValueEffect2;
	local X2Condition_WardenTargetRankRequirement				RankCondition1, RankCondition2, RankCondition3;
	local X2Effect_WardenCounterDefense							IgnoreCoverEffect1, IgnoreCoverEffect2, IgnoreCoverEffect3;
	local X2Effect_AdditionalAnimSets							AnimSetEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_RangedStance');	

	// Use this ability as a hook to attach all additional animsets needed for the class straight away before anything else is initialised
	AnimSetEffect = new class'X2Effect_AdditionalAnimSets';
	AnimSetEffect.AddAnimSetWithPath("Anim_Warden_BD_Tide.AS_Warden");
	AnimSetEffect.AddAnimSetWithPath("Anim_Warden_BD_Brand.AS_Brand");	
	AnimSetEffect.AddAnimSetWithPath("Anim_Warden_BD_Fuse.Anims.AS_Fuse");
	AnimSetEffect.AddAnimSetWithPath("Anim_Warden_BD_StanceAndShields.AS_StanceAndShields");
	AnimSetEffect.AddAnimSetWithPath("Anim_Warden_BD_Seals.AS_Seal");
	AnimSetEffect.AddAnimSetWithPath("Anim_Warden_BD_Blink.Anims.AS_Blink");
	AnimSetEffect.AddAnimSetWithPath("Soldier_ANIM.AS_PsiAmp");
	AnimSetEffect.AddAnimSetWithPath("Templar_Pillar_ANIM.Anims.AS_Pillar");
	AnimSetEffect.AddAnimSetWithPath("Templar_Exchange_ANIM.AS_Exchange");
	AnimSetEffect.AddAnimSetWithPath("Templar_GainingFocus_ANIM.AS_GainingFocus");
	AnimSetEffect.AddAnimSetWithPath("Anim_Warden_BD_Combatives.AS_CounterAttack");
	AnimSetEffect.BuildPersistentEffect(1, true, false, false);
	AnimSetEffect.EffectName = 'AddWardenAdditionalAnimsets';
	Template.AddTargetEffect(AnimSetEffect);

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
	Template.CustomSelfFireAnim = 'HL_Stance';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	// Set up eventlisteners
	Template.AddAbilityEventListener('AbilityActivated', SpecialAPTrigger_EventListenerFn, ELD_OnStateSubmitted, eFilter_Unit);

	return Template;
}

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
	Template.CustomSelfFireAnim = 'HL_Stance';
	Template.Hostility = eHostility_Neutral;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;
}

// This ability is the proficiency 'Ebb & Flow Mastery' ability, which allows immediate stance switch
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
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
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

// This ability is the 'Ebb & Flow' ability displayed on the ability bar
// it gives the illusion of causing a stance switch but in reality, is just a way of using up special action points to end the turn
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
		
	// TODO: Figure out more fitting confirm sound or use standard.
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.Hostility = eHostility_Neutral;
	Template.bShowActivation = false;
	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	
	Template.AdditionalAbilities.Additem('Warden_BD_ProficiencyPassives');
	Template.AdditionalAbilities.Additem('Warden_BD_EbbandFlow');
	
	return Template;
}

// Ebb & Flow - This Hidden ability actually triggers the stance switching at the start of each turn 
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

// This class sets up the main proficiency abilities
static function X2AbilityTemplate Warden_BD_ProficiencyPassives()
{
	local X2AbilityTemplate										Template;
	local X2Effect_ToHitModifier								HitModEffect;
	local X2Effect_WardenAddAbilitiesToTarget					AddAbilityEffect;
	local X2Condition_WardenTargetRankRequirement				RankCondition1, RankCondition2;
	local X2Effect_WardenModifyAbilityCharges					BonusCharges;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_ProficiencyPassives');

	// Icon Properties	
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_SwordSlash";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	//Create Ranks for Manual Ebb & Flow Effect (Sergeant)
	RankCondition1 = new class 'X2Condition_WardenTargetRankRequirement';
	RankCondition1.iMinRank = 3;		// No minimum rank for level 1 bonuses
	RankCondition1.iMaxRank = 5;	// Max rank is 1 below minimum rank for level 2 bonuses
	RankCondition1.LogEffectName = "Grant stanceswitch ability";	// EffectName to use in logs
	RankCondition1.GiveProject = 'WOTC_Prof_Warden_BD_Unlock1';

	//Create Ranks for Manual Ebb & Flow Effect (Major)
	RankCondition2 = new class 'X2Condition_WardenTargetRankRequirement';
	RankCondition2.iMinRank = 6;		// No minimum rank for level 1 bonuses
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
	AddAbilityEffect.BuildPersistentEffect (1, true, false, false);
	AddAbilityEffect.EffectName = 'ProficiencyEbbandFlow';
	AddAbilityEffect.TargetConditions.AddItem(RankCondition1);
	
	Template.AddTargetEffect(AddAbilityEffect);

	// Grant an additional charge at the appopriate rank
	BonusCharges = new class 'X2Effect_WardenModifyAbilityCharges';
	BonusCharges.AbilitiesToModify.AddItem('Warden_BD_EbbAndFlowManual');
	BonusCharges.iChargeModifier = 1;
	BonusCharges.BuildPersistentEffect (1, true, false, false);
	BonusCharges.TargetConditions.AddItem(RankCondition2);
	AddAbilityEffect.EffectName = 'ProficiencyEbbandFlow';
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
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
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
	
	Template.ActivationSpeech = 'Nullshield';
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

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
	Template.CustomSelfFireAnim = 'HL_Shield';
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
	Template.AddShooterEffectExclusions();
	
	// Vis
	Template.bSkipFireAction = false;
	Template.bShowActivation = false;
	Template.ModifyNewContextFn = Rewind_ModifyActivatedAbilityContext;	
	Template.BuildNewGameStateFn = class'X2Ability_Cyberus'.static.Teleport_BuildGameState;
	Template.BuildVisualizationFn = class'X2Ability_Cyberus'.static.Teleport_BuildVisualization;
	Template.CinescriptCameraType = "Cyberus_Teleport";
	return template;
}

// Barrier (Internal name = Mirror)
static final function X2AbilityTemplate Warden_BD_Mirror()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2Effect_WardenMirror									MirrorEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Mirror');
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
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
	// Can't use while impaired
	Template.AddShooterEffectExclusions();

	// Ability trigger determines how it is activated. In this case - by the user manually.
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	
	// Set up persistent effect to turn next two hits into grazes
	MirrorEffect = new class'X2Effect_WardenMirror';
	MirrorEffect.EffectName = default.MirrorEffectName;
	// This effect does not tick normally & needs to be manually advanced in the effect
	MirrorEffect.BuildPersistentEffect(default.MIRROR_NUMBER_OF_ATTACKS, false, true, false, eGameRule_PlayerTurnEnd);
	MirrorEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, "", Template.AbilitySourceName);	
	Template.AddTargetEffect(MirrorEffect);
	
	Template.ActivationSpeech = 'Nullshield';
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

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
	// Works :)
	Template.CustomSelfFireAnim = 'HL_Shield';
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
	Template.CustomFireAnim = 'HL_Brand_Volley';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Psionic_FireAtUnit";
	Template.bSkipFireAction = false;

	return Template;
}

static function X2AbilityTemplate Warden_BD_DefenderPassive()
{
	local X2AbilityTemplate						Template;

	Template = CreatePassiveAbility('Warden_BD_DefenderPassive', "img:///UILibrary_PerkIcons.UIPerk_one_for_all");
	Template.bCrossClassEligible = false;
	Template.AbilitySourceName = 'eAbilitySource_psionic';
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

static function X2AbilityTemplate Warden_BD_GrantImbueAmmoCharges()
{
	local X2AbilityTemplate										Template;
	local X2Effect_WardenModifyAbilityCharges					BonusCharges;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_GrantImbueAmmoCharges');

	// # Icon Setup
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_bulletshred";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	
	// # Costs and Cooldowns
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.IMBUEAMMO_COOLDOWN;
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
	Template.ActivationSpeech = 'Reloading';

	// Ability trigger determines how it is activated. In this case - by the user manually.
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	
	
	// Grant an additional charge
	BonusCharges = new class 'X2Effect_WardenModifyAbilityCharges';
	BonusCharges.AbilitiesToModify.AddItem('Warden_BD_ImbueAmmo');
	BonusCharges.iChargeModifier = 1;
	BonusCharges.BuildPersistentEffect (1, true, false, false);
	Template.AddTargetEffect(BonusCharges);
	
	// # State and Visualization	
	Template.CustomSelfFireAnim = 'HL_Reload';
	Template.Hostility = eHostility_Neutral;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CustomSelfFireAnim = 'HL_Reload';

	Template.AdditionalAbilities.AddItem('Warden_BD_ImbueAmmo');

	return Template;
}

static function X2AbilityTemplate Warden_BD_NonStandardShot( Name AbilityName='MZNonStandardShot', string IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard", bool DontShowInPerkList = false, bool bNoAmmoCost = false, bool bAllowBurning = true, bool bAllowDisoriented = false)
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local array<name>                       SkipExclusions;
	local X2Condition_Visibility            VisibilityCondition;
	local X2AbilityToHitCalc_StandardAim	AimType;

	// Macro to do localisation and stuffs
	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);

	// Icon Properties
	Template.bDontDisplayInAbilitySummary = DontShowInPerkList;
	Template.IconImage = IconImage;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_CannotAfford_Charges');
	Template.HideErrors.AddItem('AA_CannotAfford_ActionPoints');
	Template.DisplayTargetHitChance = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';                                       // color of the icon
	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	if (bAllowDisoriented)
		SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	if (bAllowBurning)
		SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// Targeting Details
	// Can only shoot visible enemies
	VisibilityCondition = new class'X2Condition_Visibility';
	VisibilityCondition.bRequireGameplayVisible = true;
	VisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(VisibilityCondition);
	// Can't target dead; Can't target friendlies
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	// Can't shoot while dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	// Only at single targets that are in range.
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	// Action Point
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bAddWeaponTypicalCost = true;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// Ammo
	if( !bNoAmmoCost )
	{
		AmmoCost = new class'X2AbilityCost_Ammo';
		AmmoCost.iAmmo = 1;
		Template.AbilityCosts.AddItem(AmmoCost);
	}
	Template.bAllowAmmoEffects = true; // 	
	Template.bAllowBonusWeaponEffects = true;

	// Weapon Upgrade Compatibility
	Template.bAllowFreeFireWeaponUpgrade = false;                        // Flag that permits action to become 'free action' via 'Hair Trigger' or similar upgrade / effects

	// Hit Calculation (Different weapons now have different calculations for range)
	AimType = new class'X2AbilityToHitCalc_StandardAim';
	AimType.bOnlyMultiHitWithSuccess = true;
	AimType.bAllowCrit = false;
	Template.AbilityToHitCalc = AimType;
	Template.AbilityToHitOwnerOnMissCalc = default.SimpleStandardAim;
	
	// Targeting Method
	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.bUsesFiringCamera = true;
	Template.CinescriptCameraType = "StandardGunFiring";	

	Template.AssociatedPassives.AddItem('HoloTargeting');

	// MAKE IT LIVE!
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;	
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	//class'X2StrategyElement_XpackDarkEvents'.static.AddStilettoRoundsEffect(Template);
	//Template.PostActivationEvents.AddItem('StandardShotActivated'); technically, no.

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	//not currently using for anything valid to headshot with.
	// Template.AlternateFriendlyNameFn = class'X2Ability_WeaponCommon'.static.StandardShot_AlternateFriendlyName;
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

	return Template;	
}

static function X2AbilityTemplate Warden_BD_ImbueAmmo() {
	local X2AbilityTemplate					Template;
	local X2Effect_ApplyWeaponDamage		WeaponDamageEffect;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2Effect_Knockback				KnockbackEffect;
	local X2Condition_Unitvalue				CheckStance;

	Template = Warden_BD_NonStandardShot('Warden_BD_ImbueAmmo', "img:///UILibrary_PerkIcons.UIPerk_bulletshred");
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_CannotAfford_Charges');
	Template.HideErrors.AddItem('AA_CannotAfford_ActionPoints');
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_SHOT_PRIORITY;

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);
	Template.ActivationSpeech = 'DeadEye';

	WeaponDamageEffect = class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect();
	WeaponDamageEffect.EffectDamageValue.DamageType = 'Psi';
	// Need some way of displaying the psi flyover for this shot instead of the normal one 
	//WeaponDamageEffect.bIgnoreWeaponBaseDamageTypeForFlyover = true;
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bBypassSustainEffects = true;
	WeaponDamageEffect.EffectDamageValue.Damage = default.IMBUEAMMO_DAMAGE_BONUS;
	WeaponDamageEffect.EffectDamageValue.Pierce = 99;
	WeaponDamageEffect.DamageTypes.Length=0;
	WeaponDamageEffect.DamageTypes.AddItem('Psi');
	Template.AddTargetEffect(WeaponDamageEffect);

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.OnlyOnDeath = false;
	KnockbackEffect.KnockbackDistance = 2;
	Template.AddTargetEffect(KnockbackEffect);

	// # Shooter Conditions - Unit must be in ranged stance to activate the ability
	CheckStance = new Class'X2Condition_Unitvalue';
	CheckStance.AddCheckValue(default.RangedStanceValueName,1,eCheck_Exact);
	Template.AbilityShooterConditions.AddItem(CheckStance);	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.CustomFireAnim = 'FF_FireImbuedAmmo';

	return Template;
}

static function X2AbilityTemplate Warden_BD_GrantSoulBladeCharges()
{
	local X2AbilityTemplate										Template;
	local X2Effect_WardenModifyAbilityCharges					BonusCharges;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_GrantSoulbladeCharges');

	// # Icon Setup
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
	Template.AddShooterEffectExclusions();

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;	
	
	// Grant an additional charges
	BonusCharges = new class 'X2Effect_WardenModifyAbilityCharges';
	BonusCharges.AbilitiesToModify.AddItem('Warden_BD_SoulBlade');
	BonusCharges.iChargeModifier = 1;
	BonusCharges.BuildPersistentEffect (1, true, false, false);
	Template.AddTargetEffect(BonusCharges);
		
	// # State and Visualization
	Template.CustomSelfFireAnim = 'HL_GainingFocus';
	Template.Hostility = eHostility_Neutral;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.AdditionalAbilities.AddItem('Warden_BD_SoulBlade');

	return Template;
}

static function X2AbilityTemplate Warden_BD_NonStandardSlash(Name AbilityName = 'Warden_BD_NonStandardSlash', string IconImage = "img:///UILibrary_PerkIcons.UIPerk_swordSlash", optional bool bAllowBurning=true)
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee  StandardMelee;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_CannotAfford_Charges');
	Template.HideErrors.AddItem('AA_CannotAfford_ActionPoints');
	
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;	
	Template.CinescriptCameraType = "Ranger_Reaper";
	Template.IconImage = IconImage;
	Template.bHideOnClassUnlock = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	// Allows soul blade to be used from Warden's charge, if it's available
	ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.SpecialChargeAP);
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	StandardMelee = new class'X2AbilityToHitCalc_StandardMelee';
	StandardMelee.bAllowCrit = false;
	Template.AbilityToHitCalc = StandardMelee;

	Template.AbilityTargetStyle = new class'X2AbilityTarget_MovingMelee';
	Template.TargetingMethod = class'X2TargetingMethod_MeleePath';

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_EndOfMove');

	// Target Conditions
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	// Shooter Conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	if ( bAllowBurning)
	{
		SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
		Template.AddShooterEffectExclusions(SkipExclusions);
	}
	else
	{
		Template.AddShooterEffectExclusions();
	}

	// No Target Effects - added by the actual ability creation.

	Template.bAllowBonusWeaponEffects = true;
	Template.bSkipMoveStop = true;
	
	// Voice events
	Template.SourceMissSpeech = 'SwordMiss';

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate Warden_BD_SoulBlade()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_ApplyWeaponDamage	    WeaponDamageEffect;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2Condition_Unitvalue				CheckStance;


	Template = Warden_BD_NonStandardSlash('Warden_BD_SoulBlade', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_ceramicblade");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_CannotAfford_Charges');
	Template.HideErrors.AddItem('AA_CannotAfford_ActionPoints');
	
	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = 0;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);
	Template.ActivationSpeech = 'RunAndGun';

	// Damage Effect
	WeaponDamageEffect = class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect();
	WeaponDamageEffect.EffectDamageValue.DamageType = 'Psi';
	// This was an idea for additional inclusion in CHL - need to remember why it's needed - WeaponDamageEffect.bIgnoreWeaponBaseDamageTypeForFlyover = true;
	WeaponDamageEffect.bBypassShields = true;
	WeaponDamageEffect.bBypassSustainEffects = true;
	WeaponDamageEffect.EffectDamageValue.Pierce = 99;
	WeaponDamageEffect.DamageTypes.Length=0;
	WeaponDamageEffect.DamageTypes.AddItem('Psi');
	WeaponDamageEffect.EffectDamageValue.Damage = default.SOULBLADE_DAMAGE_BONUS;
	Template.AddTargetEffect(WeaponDamageEffect);
	
	// # Shooter Conditions - Unit must be in melee stance to activate the ability
	CheckStance = new Class'X2Condition_Unitvalue';
	CheckStance.AddCheckValue(default.MeleeStanceValueName,1,eCheck_Exact);
	Template.AbilityShooterConditions.AddItem(CheckStance);	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	return Template;
}

// Probably should rename this internally since it's not very defensive....
static function X2AbilityTemplate Warden_BD_DefensiveWard()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints					ActionPointCost;
	local X2AbilityCooldown								Cooldown;
	local X2AbilityMultiTarget_Radius					RadiusMultiTarget;
	local X2AbilityTarget_Cursor						CursorTarget;
	local X2Effect_DelayedAbilityActivation				DelayedDamageEffect;
	local X2Effect_MarkValidActivationTiles				MarkTilesEffect;
	local X2Effect_PerkAttachForFX						FXEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_DefensiveWard');	
	Template.TwoTurnAttackAbility = 'Warden_BD_DefensiveWard_Stage2';

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_adventpsiwitch_dimensionrift";
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
	Template.ActivationSpeech = 'VoidRift';

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.DEFENSIVE_WARD_RADIUS_METERS;
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

	// This effect is here to attach perk FX to
	FXEffect = new class'X2Effect_PerkAttachForFX';
	FXEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	FXEffect.EffectName = default.DefensiveWardStage1FXName;
	Template.AddShooterEffect(FXEffect);

	//Effect on a successful test is adding the delayed marked effect to the target
	DelayedDamageEffect = new class 'X2Effect_DelayedAbilityActivation';
	DelayedDamageEffect.BuildPersistentEffect(1, false, false, , eGameRule_PlayerTurnBegin);
	DelayedDamageEffect.EffectName = default.DefensiveWardStage1EffectName;
	DelayedDamageEffect.TriggerEventName = default.DefensiveWardTriggerName;
	DelayedDamageEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddShooterEffect(DelayedDamageEffect);
	
	Template.TargetingMethod = class'X2TargetingMethod_VoidRift';
	Template.CustomFireAnim = 'HL_Seal_Purple';
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
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
	RadiusMultiTarget.fTargetRadius = default.DEFENSIVE_WARD_RADIUS_METERS;
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
	Template.BuildVisualizationFn = Seal_BuildVisualization;
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
	Template.AdditionalAbilities.AddItem('Warden_BD_CombativesCounterAttack');

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

	Template.bShowActivation = true;

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
	local X2Effect_ToHitModifier			RangedDodgeEffect, MeleeDodgeEffect;
	local X2Effect_SetUnitValue				SetUnitValEffect;
	local X2Condition_UnitValue				CheckMeleeStance, CheckRangedStance;
	
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

	CheckMeleeStance = new Class'X2Condition_Unitvalue';
	CheckMeleeStance.AddCheckValue(default.MeleeStanceValueName,1,eCheck_Exact);
	
	CheckRangedStance = new Class'X2Condition_Unitvalue';
	CheckRangedStance.AddCheckValue(default.RangedStanceValueName,1,eCheck_Exact);
	
	// During the Enemy player's turn, the Unit gets a dodge increase
	MeleeDodgeEffect = new class'X2Effect_ToHitModifier';
	MeleeDodgeEffect.EffectName = class'X2Ability'.default.CounterattackDodgeEffectName;
	MeleeDodgeEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	MeleeDodgeEffect.AddEffectHitModifier(eHit_Graze, default.MELEE_COUNTERATTACK_DODGE_AMOUNT, Template.LocFriendlyName, class'X2AbilityToHitCalc_StandardMelee', true, false, true, true, , false);
	MeleeDodgeEffect.bApplyAsTarget = true;
	MeleeDodgeEffect.TargetConditions.AddItem(CheckMeleeStance);
	Template.AddShooterEffect(MeleeDodgeEffect);	

	// During the Enemy player's turn, the Unit gets a dodge increase
	RangedDodgeEffect = new class'X2Effect_ToHitModifier';
	RangedDodgeEffect.EffectName = class'X2Ability'.default.CounterattackDodgeEffectName;
	RangedDodgeEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	RangedDodgeEffect.AddEffectHitModifier(eHit_Graze, default.RANGED_COUNTERATTACK_DODGE_AMOUNT, Template.LocFriendlyName, class'X2AbilityToHitCalc_StandardMelee', true, false, true, true, , false);
	RangedDodgeEffect.bApplyAsTarget = true;
	RangedDodgeEffect.TargetConditions.AddItem(CheckRangedStance);
	Template.AddShooterEffect(RangedDodgeEffect);

	// Apply a unit value at the end of the turn signifying to the engine that a counter attack will occur
	SetUnitValEffect = new class'X2Effect_SetUnitValue';
	SetUnitValEffect.UnitName = class'X2Ability'.default.CounterattackDodgeEffectName;
	SetUnitValEffect.NewValueToSet = class'X2Ability'.default.CounterattackDodgeUnitValue;
	SetUnitValEffect.CleanupType = eCleanup_BeginTurn;
	Template.AddTargetEffect(SetUnitValEffect);
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate Warden_BD_CombativesCounterattack()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_EventListener EventListener;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_CombativesCounterAttack');
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
	local X2Effect_PerkAttachForFX						FXEffect;

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
	Template.ActivationSpeech = 'VoidRift';

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.FISSURE_RADIUS_METERS;
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

	// This effect is here to attach perk FX to
	FXEffect = new class'X2Effect_PerkAttachForFX';
	FXEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnBegin);
	FXEffect.EffectName = default.FissureStage1FXName;
	Template.AddShooterEffect(FXEffect);

	//Effect on a successful test is adding the delayed marked effect to the target
	DelayedRuptureEffect = new class 'X2Effect_DelayedAbilityActivation';
	DelayedRuptureEffect.BuildPersistentEffect(1, false, false, , eGameRule_PlayerTurnBegin);
	DelayedRuptureEffect.EffectName = default.FissureStage1EffectName;
	DelayedRuptureEffect.TriggerEventName = default.FissureTriggerName;
	DelayedRuptureEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddShooterEffect(DelayedRuptureEffect);
	
	Template.TargetingMethod = class'X2TargetingMethod_VoidRift';
	
	Template.CustomFireAnim = 'HL_Seal_Red';
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
	RadiusMultiTarget.fTargetRadius = default.FISSURE_RADIUS_METERS;
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
	Template.BuildVisualizationFn = Seal_BuildVisualization;
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
	// If I had a doller for every action point I granted....I'd be able to afford XCOM3 when it comes out.
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
	Template.AddShooterEffectExclusions();
	// Add dead eye to guarantee
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	// Multi target
	MultiTarget = new class'X2AbilityMultiTarget_Radius';
	MultiTarget.fTargetRadius = default.TIDE_RADIUS_METERS;
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
	DamageEffect.EffectDamageValue.DamageType = 'Psi';
	DamageEffect.EffectDamageValue.Damage = default.TIDE_DAMAGE_AMOUNT;
	DamageEffect.EnvironmentalDamageAmount = default.TIDE_ENVDAMAGE;
	DamageEffect.TargetConditions.AddItem(ImmuneToFallingCondition);
	Template.AddMultiTargetEffect(DamageEffect);
	
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(default.TIDE_STUN_TURNS, 100, false);
	StunnedEffect.bRemoveWhenSourceDies = false;
	Template.AddMultiTargetEffect(StunnedEffect); 

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = default.TIDE_KNOCKBACK_DISTANCE;
	KnockbackEffect.OnlyOnDeath = false;
	KnockbackEffect.TargetConditions.AddItem(ImmuneToFallingCondition);
	KnockbackEffect.TargetConditions.AddItem(KnockbackCondition);
	Template.AddMultiTargetEffect(KnockbackEffect);
	
	Template.ActivationSpeech = 'Mindblast';
	Template.CustomSelfFireAnim = 'HL_WardenPushA';
	Template.bShowActivation = true;
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "Sectoid_Mindspin";

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
	local X2Effect_PerkAttachForFX					FXEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Consume');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_neuraldampingmodule";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY;

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

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	Template.ActivationSpeech = 'HealingAlly';
	Template.CustomFireAnim = 'HL_Brand';

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.CONSUME_RADIUS_METERS;
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
	
	// This effect is here to attach perk FX to
	FXEffect = new class'X2Effect_PerkAttachForFX';
	FXEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnEnd);
	FXEffect.EffectName = default.ConsumeFXName;
	Template.AddShooterEffect(FXEffect);

	TriggerDamageEffect = new Class'X2Effect_TriggerEvent';
	TriggerDamageEffect.TriggerEventName = 'ConsumeTrigger';	
	Template.AddShooterEffect(TriggerDamageEffect);
	
	Template.CinescriptCameraType = "Psionic_FireAtUnit";	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;	
	Template.BuildVisualizationFn = Consume_BuildVisualization;	
	//Template.BuildVisualizationFn = Seal_BuildVisualization;		
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

	Template.CustomSelfFireAnim = 'HL_IdleA';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	
	Template.bCrossClassEligible = false;
		
	return Template;
}

static function X2AbilityTemplate Warden_BD_RagePassive()
{
	local X2AbilityTemplate						Template;

	Template = CreatePassiveAbility('Warden_BD_RagePassive', "img:///UILibrary_PerkIcons.UIPerk_rapidfire");
	Template.bCrossClassEligible = false;
	Template.AbilitySourceName = 'eAbilitySource_psionic';


	return Template;
}

static function X2AbilityTemplate Warden_BD_Charge()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_GrantActionPoints		ActionPointEffect1, ActionPointEffect2;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Charge');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;	
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_charge";
	Template.bHideOnClassUnlock = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	// Action cost for this ability.
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	//ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.Length = 0;

	// I AM THE LORD OF ALL ACTION POINTS 
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
	
	ActionPointEffect1 = new class'X2Effect_GrantActionPoints';
	ActionPointEffect1.NumActionPoints = 1;
	ActionPointEffect1.PointType = class'X2CharacterTemplateManager'.default.MoveActionPoint;
	ActionPointEffect1.bSelectUnit = true;
	Template.AddTargetEffect(ActionPointEffect1);

	ActionPointEffect2 = new class'X2Effect_GrantActionPoints';
	ActionPointEffect2.NumActionPoints = 1;
	ActionPointEffect2.PointType = default.SpecialChargeAP;
	ActionPointEffect2.bSelectUnit = true;
	Template.AddTargetEffect(ActionPointEffect2);

	// # Targeting and Triggering
	Template.AbilityToHitCalc = default.DeadEye;
	Template.DisplayTargetHitChance = false;
	Template.AbilityTargetStyle = default.SelfTarget;

	// Ability trigger determines how it is activated. In this case - by the user manually.
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
		
	// TODO: Figure out more fitting confirm sound or use standard.
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	// This will determine if this ability break concealment under default rules
	// And whether it's eligigible to Covering Fire reaction attacks.
	Template.Hostility = eHostility_Neutral;

	// This will tell TypicalAbility_BuildVisualization to display a flyover with the ability's LocFlyOverText when it's activated.
	Template.bShowActivation = true;

	// This will tell TypicalAbility_BuildVisualization to not play an activation animation for this ability. To be changed once we have an animation.
	Template.bSkipFireAction = false;

	// Works, not terribly inspiring - maybe more of a 'hold sword in the air anim' would be better?
	Template.CustomFireAnim = 'HL_CallGremlinA';	
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

static function X2AbilityTemplate Warden_BD_Retribution()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints					ActionPointCost;
	local X2AbilityCooldown								Cooldown;
	local X2AbilityMultiTarget_Radius					RadiusMultiTarget;
	local X2AbilityTarget_Cursor						CursorTarget;
	local X2Effect_DelayedAbilityActivation				DelayedOverwatchEffect;
	local X2Effect_MarkValidActivationTiles				MarkTilesEffect;
	local X2Effect_PerkAttachForFX						FXEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Retribution');	
	Template.TwoTurnAttackAbility = 'Warden_BD_Retribution_Stage2';

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_observer";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.bShowActivation = true;
	Template.Hostility = eHostility_Neutral;
	Template.ActivationSpeech = 'HunkerDown';

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
	RadiusMultiTarget.fTargetRadius = default.RETRIBUTION_RADIUS_METERS;
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

	// This effect is here to attach perk FX to
	FXEffect = new class'X2Effect_PerkAttachForFX';
	FXEffect.BuildPersistentEffect(1, false, true, , eGameRule_PlayerTurnEnd);
	FXEffect.EffectName = default.RetributionStage1FXName;
	Template.AddShooterEffect(FXEffect);

	//Effect on a successful test is adding the delayed marked effect to the target
	DelayedOverwatchEffect = new class 'X2Effect_DelayedAbilityActivation';
	DelayedOverwatchEffect.BuildPersistentEffect(1, false, false, , eGameRule_PlayerTurnEnd);
	DelayedOverwatchEffect.EffectName = default.RetributionStage1EffectName;
	DelayedOverwatchEffect.TriggerEventName = default.RetributionTriggerName;
	DelayedOverwatchEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddShooterEffect(DelayedOverwatchEffect);
	
	Template.TargetingMethod = class'X2TargetingMethod_VoidRift';
	Template.CustomFireAnim = 'HL_Seal_Blue';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	//Template.BuildAffectedVisualizationSyncFn = PsiBombStage1_BuildAffectedVisualization;
	Template.CinescriptCameraType = "Codex_PsiBomb_Stage1";
	//	Template.DamagePreviewFn = PsiBombDamagePreview;
	Template.bFrameEvenWhenUnitIsHidden = true;
	
	Template.AdditionalAbilities.AddItem('Warden_BD_Retribution_Stage2');

	return Template;
}

static function X2AbilityTemplate Warden_BD_Retribution_Stage2()
{
	local X2AbilityTemplate							Template;
	local X2AbilityMultiTarget_Radius				RadiusMultiTarget;
	local X2Condition_UnitProperty					LivingTargetCondition;
	local X2AbilityTrigger_EventListener			DelayedEventListener;
	local X2Effect_WardenRetributionOverwatch			OverwatchEffect;
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
	RadiusMultiTarget.fTargetRadius = default.RETRIBUTION_RADIUS_METERS;
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

	// Trigger OW using ActivateOverwatch (ported from specops)
	OverwatchEffect = new class'X2Effect_WardenRetributionOverwatch';
	Template.AddMultiTargetEffect(OverwatchEffect);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = Seal_BuildVisualization;
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
	local X2Effect_ApplyWeaponDamage							WeaponDamageEffect;
	local X2Effect_Flyover										FlyoverEffect;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'Warden_BD_Brand');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_xenobiology_overlays";	
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.CustomFireAnim = 'HL_Brand';			
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.DisplayTargetHitChance = false;
	Template.bLimitTargetIcons = true;
	Template.bShowActivation = false;
	Template.bCrossClassEligible = false;
	Template.bUniqueSource = true;

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
	HitModEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	HitModEffect.BuildPersistentEffect(1, true, true);
	HitModEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(HitModEffect);

	// Apply Damage-modifying effect
	DamageEffect = new class'X2Effect_WardenBrandDamage';
	DamageEffect.EffectName = 'WOTC_APA_BrandDamageEffect';
	DamageEffect.BonusDmg = default.BRAND_DAMAGE_BONUS;
	DamageEffect.BonusCritDmg = default.BRAND_CRIT_DAMAGE_BONUS;	
	DamageEffect.BuildPersistentEffect(1, true, true);	
	DamageEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(DamageEffect);	
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	// Flyover on target
	FlyoverEffect = new class'X2Effect_Flyover';
	FlyoverEffect.AbilityName = 'Warden_BD_Brand';
	FlyoverEffect.bPlayOnSource = false;	
	Template.AddTargetEffect(FlyoverEffect);

	// Dummy weapon damage effect to trigger flinch
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bIgnoreBaseDamage = true;
	Template.AddTargetEffect(WeaponDamageEffect);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

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
	// Works :)
	Template.CustomFireAnim = 'HL_Pillar';

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
	ActionPointPersistEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd );
	ActionPointPersistEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(ActionPointPersistEffect);

	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	
	Template.bShowActivation = true;	
	Template.CustomFireAnim = 'HL_Teamwork';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = "StandardGunFiring";
	Template.ActivationSpeech = 'Inspire';
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

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
	Template.CustomFireAnim = 'HL_Warden_Fuse';
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

		// fallback if the shot taken was from overwatch
		if(X2AbilityToHitCalc_StandardAim(AbilityTemplate.AbilityToHitCalc).bReactionFire)			
			return ELR_NoInterrupt; 	
	}
	// Fallback if any of these APs have been granted already
	If (SourceUnit.GetUnitValue(default.FlowAPGrantedValueName, UV))
		return ELR_NoInterrupt;
		
	// Grant APs if turn ending attack in correct stance (or ability is affected by total combat)
	if ((SourceUnit.GetUnitValue(default.MeleeStanceValueName, UV) && SourceWeapon.InventorySlot == eInvSlot_SecondaryWeapon && SourceUnit.NumAllActionPoints() == 0) || (SourceUnit.GetUnitValue(default.RangedStanceValueName, UV) && SourceWeapon.InventorySlot == eInvSlot_PrimaryWeapon && SourceUnit.NumAllActionPoints() == 0) || bIsAffectedByTotalCombat)
    {
    `LOG("SpecialAPTrigger Passed - Granting Flow APs");
		//Assign one of the several million combinations of action point types based on the various passive abilities which are active at any given moment
		If (SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderWatcherRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderWatcherRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderWatcherChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderWatcherRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
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
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderCrusaderChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderWatcherRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderWatcherChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.DefenderRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusdaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderWatcherRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusdaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderWatcherChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusdaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderRageChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
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
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_DefenderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
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
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_CrusaderPassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.CrusaderChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_RagePassive'))
				{
				GrantSpecialAP(SourceUnit, default.WatcherRageAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_WatcherPassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
				{
				GrantSpecialAP(SourceUnit, default.WatcherChargeAP);
				}
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_RagePassive') && SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
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
		Else If(SourceUnit.HasSoldierAbility('Warden_BD_Charge'))
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

function Consume_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateVisualizationMgr		VisMgr;
	local X2Action							FoundAction;
	local VisualizationActionMetadata		ActionMetadata;
	local XComGameStateHistory				History;
	local XComGameStateContext_Ability		Context;
	local int								SourceUnitID;
	local X2Action_CameraLookAt				LookAtTargetAction;

	//	Call the typical ability visuailzation. With just that, the ability would look like the soldier firing the rocket upwards, and then enemy getting damage for seemingly no reason.
	class'X2Ability'.static.TypicalAbility_BuildVisualization(VisualizeGameState);

	VisMgr = `XCOMVISUALIZATIONMGR;
	History = `XCOMHISTORY;
	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	SourceUnitID = Context.InputContext.SourceObject.ObjectID;

	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(SourceUnitID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(SourceUnitID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(SourceUnitID);

	//	Find the Fire Action in vis tree configured by Typical Ability Build Viz
	FoundAction = VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_Fire');

	if (FoundAction != none)
	{
		//	This action will pause the Vis Tree until the Unit Hit (Notify Target) Anim Notify is reached in the Fire Action's AnimSequence (in the Fire Lockon firing animation)
		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, true, FoundAction);

		//	Start setting up the action that will pan the camera towards the location of the primary target
		LookAtTargetAction = X2Action_CameraLookAt(class'X2Action_CameraLookAt'.static.AddToVisualizationTree(ActionMetadata, Context));
		LookAtTargetAction.LookAtLocation = Context.InputContext.TargetLocations[0];
		LookAtTargetAction.LookAtDuration = 4.0f;
		LookAtTargetAction.BlockUntilFinished = true;

		//	Pan camera towards the location of the primary target so PFX can be observed
		LookAtTargetAction = X2Action_CameraLookAt(class'X2Action_CameraLookAt'.static.AddToVisualizationTree(ActionMetadata, Context));
		LookAtTargetAction.LookAtActor = ActionMetadata.VisualizeActor;
		LookAtTargetAction.LookAtDuration = 1.5f;
		
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

// Seals 2nd Stage Visualisation Function
function Seal_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory								History;
	local XComGameStateContext_Ability						Context;
	local StateObjectReference								InteractingUnitRef;
	local X2AbilityTemplate									AbilityTemplate;
	local VisualizationActionMetadata						EmptyTrack;
	local VisualizationActionMetadata						CyberusBuildTrack, ActionMetadata;
	local int												i, j;
	local X2VisualizerInterface								TargetVisualizerInterface;
	local X2Action_PlayEffect								EffectAction;
	local X2Action_StartStopSound							SoundAction;
	local XComGameState_Unit								CyberusUnit;
	local X2Action_TimedInterTrackMessageAllMultiTargets	MultiTargetMessageAction;
	local X2Action_TimedWait								WaitAction;
	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//****************************************************************************************
	//Configure the visualization track for the source
	//****************************************************************************************
	CyberusBuildTrack = EmptyTrack;
	History.GetCurrentAndPreviousGameStatesForObjectID(InteractingUnitRef.ObjectID,
													   CyberusBuildTrack.StateObject_OldState, CyberusBuildTrack.StateObject_NewState,
													   eReturnType_Reference,
													   VisualizeGameState.HistoryIndex);
	CyberusBuildTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	CyberusUnit = XComGameState_Unit(CyberusBuildTrack.StateObject_OldState);

	if( CyberusUnit != none)
	{
		// Pause visualiser to allow camera to pan to loation
		WaitAction = X2Action_TimedWait(class'X2Action_TimedWait'.static.AddToVisualizationTree(CyberusBuildTrack, Context));
		WaitAction.DelayTimeSec = 1.0f;
		
		// Play the Explosion audio
		SoundAction = X2Action_StartStopSound(class'X2Action_StartStopSound'.static.AddToVisualizationTree(CyberusBuildTrack, Context));
		SoundAction.Sound = new class'SoundCue';
		SoundAction.Sound.AkEventOverride = AkEvent'SoundX2AvatarFX.Avatar_Ability_Dimensional_Rift_Explode';
		SoundAction.bIsPositional = true;
		SoundAction.vWorldPosition = Context.InputContext.TargetLocations[0];

		// Play the Explosion FX
		EffectAction = X2Action_PlayEffect(class'X2Action_PlayEffect'.static.AddToVisualizationTree(CyberusBuildTrack, Context));
		EffectAction.bWaitForCompletion = false;

			If (Context.InputContext.AbilityTemplateName == 'Warden_BD_Fissure_Stage2')
				{
				EffectAction.EffectName = "Perk_Warden_BD_Seals.P_Seal_Red_Stage2";
				}
			Else If (Context.InputContext.AbilityTemplateName == 'Warden_BD_DefensiveWard_Stage2')
				{
				EffectAction.EffectName = "Perk_Warden_BD_Seals.P_Seal_Purple_Stage2";
				}
			Else If (Context.InputContext.AbilityTemplateName == 'Warden_BD_Retribution_Stage2')
				{
				EffectAction.EffectName = "Perk_Warden_BD_Seals.P_Seal_Blue_Stage2";
				}			
			EffectAction.EffectLocation = Context.InputContext.TargetLocations[0];
			
		// Notify multi targets of explosion
		MultiTargetMessageAction = X2Action_TimedInterTrackMessageAllMultiTargets(class'X2Action_TimedInterTrackMessageAllMultiTargets'.static.AddToVisualizationTree(CyberusBuildTrack, Context));
		MultiTargetMessageAction.SendMessagesAfterSec = 0.2f;
	}

	//****************************************************************************************
	//Configure the visualization track for the targets
	//****************************************************************************************
	for (i = 0; i < Context.InputContext.MultiTargets.Length; ++i)
	{
		InteractingUnitRef = Context.InputContext.MultiTargets[i];

		if( InteractingUnitRef == CyberusUnit.GetReference() )
		{
			ActionMetadata = CyberusBuildTrack;

			WaitAction = X2Action_TimedWait(class'X2Action_TimedWait'.static.AddToVisualizationTree(CyberusBuildTrack, Context));
			WaitAction.DelayTimeSec = 0.1f;
		}
		else
		{
			ActionMetadata = EmptyTrack;
			ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
			ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
			ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

			class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		}

		for( j = 0; j < Context.ResultContext.MultiTargetEffectResults[i].Effects.Length; ++j )
		{
			Context.ResultContext.MultiTargetEffectResults[i].Effects[j].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, Context.ResultContext.MultiTargetEffectResults[i].ApplyResults[j]);
		}

		TargetVisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
		}
	}

	TypicalAbility_AddEffectRedirects(VisualizeGameState, CyberusBuildTrack);
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

// Total combat (defender) helper
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
	CrusaderWatcherRageChargeAP = "BD_CrusaderWatcherRageChargeAP"
	DefenderCrusaderWatcherRageChargeAP = "BD_DefenderCrusaderWatcherRageChargeAP"
	SpecialChargeAP = "BD_SpecialChargeAP"

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
	FissureStage1FXName="BD_FissureStage1FX"
	DefensiveWardStage1EffectName="BD_DefensiveWardStage1Effect"
	DefensiveWardStage1FXName="BD_DefensiveWardStage1FX"
	RetributionStage1EffectName="BD_RetributionStage1Effect"
	RetributionStage1FXName="BD_RetributionStage1FX"
	ConsumeFXName="BD_ConsumeFX"

	//Triggers
	FissureTriggerName="FissureTrigger"
	DefensiveWardTriggerName="DefensiveWardTrigger"
	RetributionTriggerName="RetributionTrigger"
}
class X2DLCInfo_WOTC_Prof_Warden_BD extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	SetupGTSUnlocks();
	PatchStandardShot();
	PatchSwordSlice();
	PatchReload();
	PatchHunker();
	PatchOverwatch();
}

static function bool AbilityTagExpandHandler_CH(string InString, out string OutString, Object ParseObj, Object StrategyParseObj, XComGameState GameState)
{
	//local XComGameState_Ability AbilityState;
	//local XComGameState_Effect EffectState;
	//local X2AbilityTemplate AbilityTemplate;
	//local X2ItemTemplate ItemTemplate;
	local name Type;
	
    Type = name(InString);
    switch(Type)
		{
		case 'MELEESTANCE_I_MOBILITY_BONUS':
			OutString = string(class'X2Ability_Warden'.default.MELEESTANCE_I_MOBILITY_BONUS);
			return true;
		case 'MELEESTANCE_II_MOBILITY_BONUS':
			OutString = string(class'X2Ability_Warden'.default.MELEESTANCE_II_MOBILITY_BONUS);
			return true;
		case 'MELEESTANCE_III_MOBILITY_BONUS':
			OutString = string(class'X2Ability_Warden'.default.MELEESTANCE_III_MOBILITY_BONUS);
			return true;
		case 'RANGEDSTANCE_I_CDEF_BONUS':
			OutString = string(class'X2Effect_WardenCounterDefense'.default.RANGEDSTANCE_I_CDEF_BONUS);
			return true;
		case 'RANGEDSTANCE_II_CDEF_BONUS': 
			OutString = string(class'X2Effect_WardenCounterDefense'.default.RANGEDSTANCE_II_CDEF_BONUS);
			return true;
		case 'RANGEDSTANCE_III_CDEF_BONUS':
			OutString = string(class'X2Effect_WardenCounterDefense'.default.RANGEDSTANCE_III_CDEF_BONUS);
			return true;
		case 'REWIND_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.REWIND_COOLDOWN);
			return true;
		case 'MIRROR_NUMBER_OF_ATTACKS':
			OutString = string(class'X2Ability_Warden'.default.MIRROR_NUMBER_OF_ATTACKS);
			return true;
		case 'MIRROR_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.MIRROR_COOLDOWN);
			return true;
		case 'KINETIC_ARMOR_PERCENTAGE':
			OutString = string(class'X2Ability_Warden'.default.KINETIC_ARMOR_SHIELD_HP_PERCENTAGE);
			return true;
		case 'KINETICARMOR_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.KINETIC_ARMOR_COOLDOWN);
			return true;
		case 'CRUSADER_AIM_BONUS':
			OutString = string(class'X2Ability_Warden'.default.CRUSADER_AIM_BONUS);
			return true;
		case 'CRUSADER_CRIT_BONUS':
			OutString = string(class'X2Ability_Warden'.default.CRUSADER_CRIT_BONUS);
			return true;
		case 'IMBUEAMMO_DAMAGE_BONUS':
			OutString = string(class'X2Ability_Warden'.default.IMBUEAMMO_DAMAGE_BONUS);
			return true;
		case 'IMBUEAMMO_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.IMBUEAMMO_COOLDOWN);
			return true;
		case 'SOULBLADE_DAMAGE_BONUS':
			OutString = string(class'X2Ability_Warden'.default.SOULBLADE_DAMAGE_BONUS);
			return true;
		case 'SOULBLADE_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.SOULBLADE_COOLDOWN);
			return true;
		case 'DEFENSIVEWARD_DAMAGE':
			OutString = string(class'X2Ability_Warden'.default.DEFENSIVE_WARD_DAMAGE);
			return true;
		case 'DEFENSIVEWARD_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.DEFENSIVE_WARD_COOLDOWN);
			return true;
		case 'FIREARMFOCUS_MAXIMUM_BONUS':
			OutString = string(class'X2Effect_WardenRangedDamageFocus'.default.FIREARMFOCUS_MAXIMUM_BONUS);
			return true;
		case 'MELEEFOCUS_MAXIMUM_BONUS':
			OutString = string(class'X2Effect_WardenMeleeDamageFocus'.default.MELEEFOCUS_MAXIMUM_BONUS);
			return true;
		case 'COUNTER_NUMBER_OF_ATTACKS':
			OutString = string(class'X2Ability_Warden'.default.MAX_COUNTERATTACKS_ALLOWED);
			return true;
		case 'FISSURE_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.FISSURE_COOLDOWN);
			return true;
		case 'TIDE_PLUSONE':
			OutString = string(class'X2Ability_Warden'.default.TIDE_DAMAGE_PLUSONE);
			return true;
		case 'TIDE_DAMAGE':
			OutString = string(class'X2Ability_Warden'.default.TIDE_DAMAGE_AMOUNT);
			return true;
		case 'TIDE_AREA_OF_EFFECT':	
			OutString = string(class'X2Ability_Warden'.default.TIDE_RADIUS);
			return true;
		case 'TIDE_STUN_DURATION':
			OutString = string(class'X2Ability_Warden'.default.TIDE_STUN_TURNS);
			return true;
		case 'TIDE_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.TIDE_COOLDOWN);
			return true;
		case 'CONSUME_MULTIPLIER':
			OutString = string(class'X2Effect_WardenConsumeDamage'.default.CONSUME_DAMAGE_MULTIPLIER);
			return true;
		case 'CONSUME_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.CONSUME_COOLDOWN);
			return true;
		case 'RETRIBUTION_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.RETRIBUTION_COOLDOWN);
			return true;
		case 'BRAND_OFFENSE_STAT_BONUS':
			OutString = string(class'X2Ability_Warden'.default.BRAND_OFFENSE_STAT_BONUS);
			return true;
		case 'BRAND_DAMAGE_BONUS':
			OutString = string(class'X2Ability_Warden'.default.BRAND_DAMAGE_BONUS);
			return true;
		case 'BRAND_EMPOWERED_CRIT_DAMAGE_BONUS':
			OutString = string(class'X2Ability_Warden'.default.BRAND_CRIT_DAMAGE_BONUS);
			return true;
		case 'PILLLAR_NUMBER_OF_TURNS':
			OutString = string(class'X2Ability_Warden'.default.PILLAR_DURATION);
			return true;
		case 'PILLAR_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.PILLAR_COOLDOWN);
			return true;
		case 'INSPIRE_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.INSPIRE_COOLDOWN);
			return true;
		case 'FUSE_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.FUSE_COOLDOWN);
			return true;
		default:
			return false;
    	}
}

static function SetupGTSUnlocks()
{
	local X2StrategyElementTemplateManager		TemplateManager;
	local X2FacilityTemplate					FacilityTemplate;
    local array<X2DataTemplate>					DataTemplates;
    local X2DataTemplate						DiffTemplate;

    TemplateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	TemplateManager.FindDataTemplateAllDifficulties('OfficerTrainingSchool', DataTemplates);
	foreach DataTemplates(DiffTemplate)
	{
		FacilityTemplate = X2FacilityTemplate(DiffTemplate);
		if (FacilityTemplate != none)
		{
			// Add initial Proficiency Class Unlocks
			if (IsClassEnabled('WOTC_Prof_Warden_BD'))
			{
				FacilityTemplate.SoldierUnlockTemplates.AddItem('WOTC_Prof_Warden_BD_Unlock1');
				FacilityTemplate.SoldierUnlockTemplates.AddItem('WOTC_Prof_Warden_BD_Unlock2');
			}						
		}	
	}
}

static function bool IsClassEnabled(name ClassName)
{
	local X2SoldierClassTemplateManager		SoldierClassManager;
	local X2SoldierClassTemplate			SoldierClassTemplate;

	SoldierClassManager = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager();
	SoldierClassTemplate = SoldierClassManager.FindSoldierClassTemplate(ClassName);

	if (SoldierClassTemplate != none && (SoldierClassTemplate.NumInForcedDeck > 0 || SoldierClassTemplate.NumInDeck > 0))
		return true;

	return false;
}

static function PatchStandardShot()
{
    local X2AbilityTemplateManager			AbilityTemplateManager;
    local X2AbilityTemplate					Template;
    local array<X2DataTemplate>				DifficultyVariants;
    local X2DataTemplate					DifficultyVariant;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCost						Cost;

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    AbilityTemplateManager.FindDataTemplateAllDifficulties('StandardShot', DifficultyVariants);

    foreach DifficultyVariants(DifficultyVariant)
    {
        Template = X2AbilityTemplate(DifficultyVariant);
        if (Template != none)
		{
			foreach Template.AbilityCosts(Cost)
			{
            ActionPointCost = X2AbilityCost_ActionPoints(Cost);
			If (ActionPointCost != none)
				{
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.RageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.WatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.RageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderWatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.WatcherRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderWatcherRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherRageChargeAP);
				}
			}
		}
	}
}

static function PatchSwordSlice()
{
    local X2AbilityTemplateManager          AbilityTemplateManager;
    local X2AbilityTemplate                 Template;
    local array<X2DataTemplate>             DifficultyVariants;
    local X2DataTemplate                    DifficultyVariant;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCost						Cost;

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    AbilityTemplateManager.FindDataTemplateAllDifficulties('SwordSlice', DifficultyVariants);

   foreach DifficultyVariants(DifficultyVariant)
    {
        Template = X2AbilityTemplate(DifficultyVariant);
        if (Template != none)
		{
			foreach Template.AbilityCosts(Cost)
			{
            ActionPointCost = X2AbilityCost_ActionPoints(Cost);
			If (ActionPointCost != none)
				{
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.SpecialChargeAP);
				}
			}
		}
	}
}

static function PatchOverwatch()
{
    local X2AbilityTemplateManager          AbilityTemplateManager;
    local X2AbilityTemplate                 Template;
    local array<X2DataTemplate>             DifficultyVariants;
    local X2DataTemplate                    DifficultyVariant;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCost						Cost;

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    AbilityTemplateManager.FindDataTemplateAllDifficulties('Overwatch', DifficultyVariants);

    foreach DifficultyVariants(DifficultyVariant)
    {
        Template = X2AbilityTemplate(DifficultyVariant);
        if (Template != none)
        {
            foreach Template.AbilityCosts(Cost)
			{
            ActionPointCost = X2AbilityCost_ActionPoints(Cost);
			If (ActionPointCost != none)
				{
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.WatcherAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderWatcherAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.WatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.WatcherChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderWatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.WatcherRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderWatcherRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherRageChargeAP);
				}
			}
		}
	}
}

static function PatchHunker()
{
    local X2AbilityTemplateManager          AbilityTemplateManager;
    local X2AbilityTemplate                 Template;
    local array<X2DataTemplate>             DifficultyVariants;
    local X2DataTemplate                    DifficultyVariant;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCost						Cost;

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    AbilityTemplateManager.FindDataTemplateAllDifficulties('HunkerDown', DifficultyVariants);

    foreach DifficultyVariants(DifficultyVariant)
    {
        Template = X2AbilityTemplate(DifficultyVariant);
        if (Template != none)
        {
            foreach Template.AbilityCosts(Cost)
			{
            ActionPointCost = X2AbilityCost_ActionPoints(Cost);
			If (ActionPointCost != none)
				{
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherRageChargeAP);
			   }
			}
		}
	}
}

static function PatchReload()
{
    local X2AbilityTemplateManager          AbilityTemplateManager;
    local X2AbilityTemplate                 Template;
    local array<X2DataTemplate>             DifficultyVariants;
    local X2DataTemplate                    DifficultyVariant;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCost						Cost;

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    AbilityTemplateManager.FindDataTemplateAllDifficulties('Reload', DifficultyVariants);

    foreach DifficultyVariants(DifficultyVariant)
    {
        Template = X2AbilityTemplate(DifficultyVariant);
        if (Template != none)
        {
            foreach Template.AbilityCosts(Cost)
			{
            ActionPointCost = X2AbilityCost_ActionPoints(Cost);
			If (ActionPointCost != none)
				{
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderWatcherAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderWatcherChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherRageAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderWatcherRageChargeAP);
				ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherRageChargeAP);
				 }
			 }
		}
	}
}

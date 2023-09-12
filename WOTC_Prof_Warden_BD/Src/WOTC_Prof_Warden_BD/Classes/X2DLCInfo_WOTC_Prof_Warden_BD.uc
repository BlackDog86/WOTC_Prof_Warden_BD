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


//static function bool AbilityTagExpandHandler_CH(string InString, out string OutString, Object ParseObj, Object StrategyParseObj, XComGameState GameState)
//{
//	local XComGameState_Ability AbilityState;
//	local XComGameState_Effect EffectState;
//	local X2AbilityTemplate AbilityTemplate;
//	local X2ItemTemplate ItemTemplate;
//	local name Type;
	
//    Type = name(InString);
//    switch(Type)
//    {
	//	case 'DEFILADE_DEFENSE_BONUS':
	//		OutString = string(class'X2Effect_Defilade'.default.DEFILADE_DEFENSE_BONUS);
	//		return true;	
	//	case 'FIREDISCIPLINE_REACTIONFIRE_BONUS':
	//		OutString = string(class'X2Effect_FireDiscipline'.default.FIREDISCIPLINE_REACTIONFIRE_BONUS);
	//		return true;	
	//	case 'LONEWOLF_MIN_BONUS_TILES':
	//		OutString = string(class'X2Effect_LoneWolf'.default.LONEWOLF_MIN_DIST_TILES - 
	//				(class'X2Effect_LoneWolf'.default.LONEWOLF_AIM_BONUS / class'X2Effect_LoneWolf'.default.LONEWOLF_AIM_PER_TILE) + 1);
	//		return true;
	//	case 'LONEWOLF_AIM_BONUS':
	//		OutString = string(class'X2Effect_LoneWolf'.default.LONEWOLF_AIM_BONUS);
	//		return true;
	//	case 'LONEWOLF_DEF_BONUS':
	//		OutString = string(class'X2Effect_LoneWolf'.default.LONEWOLF_DEF_BONUS);
	//		return true;
	//	case 'LONEWOLF_MIN_DIST_TILES':
	//		OutString = string(class'X2Effect_LoneWolf'.default.LONEWOLF_MIN_DIST_TILES);				
	//		return true;
	//	default:
    
//    }
//}

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
	
    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    AbilityTemplateManager.FindDataTemplateAllDifficulties('StandardShot', DifficultyVariants);

    foreach DifficultyVariants(DifficultyVariant)
    {
        Template = X2AbilityTemplate(DifficultyVariant);
        if (Template != none)
        {
            ActionPointCost = new class'X2AbilityCost_ActionPoints';
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
			Template.AbilityCosts.AddItem(ActionPointCost);
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

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    AbilityTemplateManager.FindDataTemplateAllDifficulties('SwordSlice', DifficultyVariants);

    foreach DifficultyVariants(DifficultyVariant)
    {
        Template = X2AbilityTemplate(DifficultyVariant);
        if (Template != none)
        {
            ActionPointCost = new class'X2AbilityCost_ActionPoints';
		    ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.ChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.WatcherChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.RageChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderWatcherChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderRageChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.WatcherRageChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderRageChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.CrusaderWatcherRageChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherRageChargeAP);
			Template.AbilityCosts.AddItem(ActionPointCost);
        }
    }
}

static function PatchOverwatch()
{
    local X2AbilityTemplateManager           AbilityTemplateManager;
    local X2AbilityTemplate                       Template;
    local array<X2DataTemplate>             DifficultyVariants;
    local X2DataTemplate                         DifficultyVariant;
	local X2AbilityCost_ActionPoints		ActionPointCost;

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    AbilityTemplateManager.FindDataTemplateAllDifficulties('Overwatch', DifficultyVariants);

    foreach DifficultyVariants(DifficultyVariant)
    {
        Template = X2AbilityTemplate(DifficultyVariant);
        if (Template != none)
        {
            ActionPointCost = new class'X2AbilityCost_ActionPoints';
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
			Template.AbilityCosts.AddItem(ActionPointCost);
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

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    AbilityTemplateManager.FindDataTemplateAllDifficulties('HunkerDown', DifficultyVariants);

    foreach DifficultyVariants(DifficultyVariant)
    {
        Template = X2AbilityTemplate(DifficultyVariant);
        if (Template != none)
        {
            ActionPointCost = new class'X2AbilityCost_ActionPoints';
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
			Template.AbilityCosts.AddItem(ActionPointCost);
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

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    AbilityTemplateManager.FindDataTemplateAllDifficulties('Reload', DifficultyVariants);

    foreach DifficultyVariants(DifficultyVariant)
    {
        Template = X2AbilityTemplate(DifficultyVariant);
        if (Template != none)
        {
            ActionPointCost = new class'X2AbilityCost_ActionPoints';
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderAP);
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
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageChargeAP);
			ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherRageChargeAP);
			Template.AbilityCosts.AddItem(ActionPointCost);
        }
    }
}

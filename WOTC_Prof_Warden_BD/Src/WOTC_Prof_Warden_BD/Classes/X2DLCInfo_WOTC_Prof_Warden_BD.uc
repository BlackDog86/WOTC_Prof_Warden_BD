class X2DLCInfo_WOTC_Prof_Warden_BD extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	SetupGTSUnlocks();
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
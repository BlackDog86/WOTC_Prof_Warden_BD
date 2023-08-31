class X2DLCInfo_WardenRemaster extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	SetupGTSUnlocks();
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
class WardenGTSUnlocks extends X2StrategyElement config(WardenSkills);

var config int			CLASS_UNLOCK_1_COST;
var config int			CLASS_UNLOCK_2_COST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
		
	Templates.AddItem(WOTC_Prof_Warden_BD_Unlock1());
	Templates.AddItem(WOTC_Prof_Warden_BD_Unlock2());
	
	return Templates;
}

function bool IsClassEnabled(name ClassName)
{
	local X2SoldierClassTemplateManager		SoldierClassManager;
	local X2SoldierClassTemplate			SoldierClassTemplate;

	SoldierClassManager = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager();
	SoldierClassTemplate = SoldierClassManager.FindSoldierClassTemplate(ClassName);

	if (SoldierClassTemplate != none && (SoldierClassTemplate.NumInForcedDeck > 0 || SoldierClassTemplate.NumInDeck > 0))
		return true;

	return false;
}

static function X2SoldierAbilityUnlockTemplate WOTC_Prof_Warden_BD_Unlock1()
{
	local X2SoldierAbilityUnlockTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'WOTC_Prof_Warden_BD_Unlock1');
	
	Template.AllowedClasses.AddItem('WOTC_Prof_Warden_BD');
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize1";

	// Requirements
	Template.Requirements.RequiredHighestSoldierRank = 3;
	Template.Requirements.RequiredSoldierClass = 'WOTC_Prof_Warden_BD';
	Template.Requirements.RequiredSoldierRankClassCombo = true;
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;
	Template.Requirements.SpecialRequirementsFn = IsWardenEnabled;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.CLASS_UNLOCK_1_COST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	// Ability
	Template.AbilityName = 'WOTC_Prof_Warden_BD_AcademyAbility';
	
	return Template;
}

static function X2SoldierAbilityUnlockTemplate WOTC_Prof_Warden_BD_Unlock2()
{
	local X2SoldierAbilityUnlockTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'WOTC_Prof_Warden_BD_Unlock2');
	
	Template.AllowedClasses.AddItem('WOTC_Prof_Warden_BD');
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize1";

	// Requirements
	Template.Requirements.RequiredHighestSoldierRank = 6;
	Template.Requirements.RequiredSoldierClass = 'WOTC_Prof_Warden_BD';
	Template.Requirements.RequiredSoldierRankClassCombo = true;
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;
	Template.Requirements.SpecialRequirementsFn = IsWardenEnabled;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.CLASS_UNLOCK_2_COST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	// Ability
	Template.AbilityName = 'WOTC_Prof_Warden_BD_Ability';
	
	return Template;
}

function bool IsWardenEnabled()
{
	return IsClassEnabled('WOTC_Prof_Warden_BD');
}

function bool IsWardenUnlock1Purchased()
{
	local XComGameState_HeadquartersXCom XComHQ;

	if (IsWardenEnabled())
	{
		XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
		if (XComHQ.SoldierUnlockTemplates.Find('WOTC_Prof_Warden_BD_Unlock1') != INDEX_NONE)
		{
			return true;
	}	}
		
	return false;
}
class X2Ability_Warden_Utilities extends X2Ability;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(WOTC_Prof_Warden_BD_AcademyAbility());
	Templates.AddItem(WOTC_Prof_Warden_BD_AcademyObjective());

	return Templates;
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

static function X2DataTemplate WOTC_Prof_Warden_BD_AcademyObjective()
{
	local X2ObjectiveTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ObjectiveTemplate', Template, 'WOTC_Prof_Warden_BD_AcademyObjective');
	Template.bMainObjective = false;
	Template.bNeverShowObjective = true;

	Template.CompletionRequirements.SpecialRequirementsFn = IsUnavailable;

	return Template;
}

static function bool IsUnavailable()
{
	return false;
}

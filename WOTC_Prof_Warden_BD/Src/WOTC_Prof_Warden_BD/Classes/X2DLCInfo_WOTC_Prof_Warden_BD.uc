class X2DLCInfo_WOTC_Prof_Warden_BD extends X2DownloadableContentInfo;

var config array<name> IncludeTemplateNames;

static event OnPostTemplatesCreated()
{
	SetupGTSUnlocks();
	PatchStandardShot();	
	PatchReload();
	PatchHunker();
	PatchOverwatch();
	PatchFlowAPAbilities();
	PatchWrongStanceText();
	PatchLastRitesChargeDisplayInfo();
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
		case 'MELEESTANCE_I_MELEE_DR':
			OutString = string(class'X2Ability_Warden'.default.MELEESTANCE_I_MELEE_DR);
			return true;
		case 'MELEESTANCE_II_MELEE_DR':
			OutString = string(class'X2Ability_Warden'.default.MELEESTANCE_II_MELEE_DR);
			return true;
		case 'MELEESTANCE_III_MELEE_DR':
			OutString = string(class'X2Ability_Warden'.default.MELEESTANCE_III_MELEE_DR);
			return true;
		case 'WARDENSSWORD_AIM_I_BONUS':
			OutString = string(class'X2Ability_Warden'.default.WARDENSSWORD_AIM_I_BONUS);
			return true;
		case 'WARDENSSWORD_AIM_II_BONUS':
			OutString = string(class'X2Ability_Warden'.default.WARDENSSWORD_AIM_II_BONUS);
			return true;
		case 'WARDENSSWORD_AIM_III_BONUS':
			OutString = string(class'X2Ability_Warden'.default.WARDENSSWORD_AIM_III_BONUS);
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
		case 'RANGEDSTANCE_I_CRIT_BONUS':
			OutString = string(class'X2Ability_Warden'.default.RANGEDSTANCE_I_CRIT_BONUS);
			return true;
		case 'RANGEDSTANCE_II_CRIT_BONUS': 
			OutString = string(class'X2Ability_Warden'.default.RANGEDSTANCE_II_CRIT_BONUS);
			return true;
		case 'RANGEDSTANCE_III_CRIT_BONUS':
			OutString = string(class'X2Ability_Warden'.default.RANGEDSTANCE_III_CRIT_BONUS);
			return true;
		case 'RANGEDSTANCE_AIM_PENALTY': 
			OutString = string(class'X2Ability_Warden'.default.RANGEDSTANCE_AIM_PENALTY);
			return true;
		case 'MELEESTANCE_AIM_PENALTY':
			OutString = string(class'X2Ability_Warden'.default.MELEESTANCE_AIM_PENALTY);
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
		case 'SOULBLADE_INITIAL_CHARGES':
			OutString = string(class'X2Ability_Warden'.default.SOULBLADE_INITIAL_CHARGES);
			return true;
		case 'IMBUEAMMO_INITIAL_CHARGES':
			OutString = string(class'X2Ability_Warden'.default.IMBUEAMMO_INITIAL_CHARGES);
			return true;
		case 'DEFENSIVEWARD_DAMAGE':
			OutString = string(class'X2Ability_Warden'.default.DEFENSIVE_WARD_DAMAGE);
			return true;
		case 'DEFENSIVE_WARD_DISORIENT_TURNS':
			OutString = string(class'X2Ability_Warden'.default.DEFENSIVE_WARD_DISORIENT_TURNS);
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
		case 'FISSURE_INITIAL_AMOUNT':
			OutString = string(class'X2Ability_Warden'.default.FISSURE_INITIAL_AMOUNT);
			return true;
		case 'FISSURE_AMOUNT':
			OutString = string(class'X2Ability_Warden'.default.FISSURE_AMOUNT);
			return true;
		case 'TIDE_DAMAGE':
			OutString = string(class'X2Ability_Warden'.default.TIDE_DAMAGE_AMOUNT);
			return true;
		case 'TIDE_AREA_OF_EFFECT':	
			OutString = string(class'X2Ability_Warden'.default.TIDE_RADIUS_METERS);
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
		case 'CHARGE_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.CHARGE_COOLDOWN);
			return true;
		case 'RETRIBUTION_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.RETRIBUTION_COOLDOWN);
			return true;
		case 'FRACTURE_RANGED_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.FRACTURE_RANGED_COOLDOWN);
			return true;
		case 'FRACTURE_RANGED_BULLET_CHARGES':
			OutString = string(class'X2Ability_Warden'.default.FRACTURE_RANGED_BULLET_CHARGES);
			return true;
		case 'LAST_RITES_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.LAST_RITES_COOLDOWN);
			return true;
		case 'LAST_RITES_SOULBLADE_CHARGES':
			OutString = string(class'X2Ability_Warden'.default.LAST_RITES_SOULBLADE_CHARGES);
			return true;
		case 'LAST_RITES_DURATION':
			OutString = string(class'X2Ability_Warden'.default.LAST_RITES_DURATION);
			return true;
		case 'FLOWFOCUS_COOLDOWN':
			OutString = string(class'X2Ability_Warden'.default.FLOWFOCUS_COOLDOWN);
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
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.WatcherRageAP);	
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageAP);					
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
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.WatcherRageAP);
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderCrusaderWatcherAP);					
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
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherAP);
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderRageAP);
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageAP);					
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
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderAP);					
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherAP);
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderRageAP);
					ActionPointCost.AllowedTypes.AddItem(class 'X2Ability_Warden'.default.DefenderWatcherRageAP);	
				}
			}
		}
	}
}

static function PatchFlowAPAbilities()
{
    local X2AbilityTemplateManager      AbilityTemplateManager;
    local X2AbilityTemplate             Template;
    local array<X2DataTemplate>         DifficultyVariants;
    local X2DataTemplate                DifficultyVariant;
    local X2AbilityCost                 Cost;
    local X2AbilityCost_ActionPoints    ActionPointCost;
    local array<name>                   AbilitiesToPatch;
    local name                          AbilityName;

    AbilitiesToPatch.AddItem('Warden_BD_ImbueAmmo');
    AbilitiesToPatch.AddItem('Warden_BD_SoulBlade');
    AbilitiesToPatch.AddItem('Warden_BD_Rewind');
    AbilitiesToPatch.AddItem('Warden_BD_Mirror');
    AbilitiesToPatch.AddItem('Warden_BD_DefensiveWard');
    AbilitiesToPatch.AddItem('Warden_BD_Fissure');
    AbilitiesToPatch.AddItem('Warden_BD_Tide');
    AbilitiesToPatch.AddItem('Warden_BD_Consume');
    AbilitiesToPatch.AddItem('Warden_BD_Retribution');
    AbilitiesToPatch.AddItem('Warden_BD_Brand');
    AbilitiesToPatch.AddItem('Warden_BD_Pillar');
    AbilitiesToPatch.AddItem('Warden_BD_Inspire');
    AbilitiesToPatch.AddItem('Warden_BD_Fuse');
    AbilitiesToPatch.AddItem('Warden_BD_FractureMelee');
    AbilitiesToPatch.AddItem('Warden_BD_EbbAndFlowDummy');
	AbilitiesToPatch.AddItem('Warden_BD_EbbAndFlowManual');
    AbilitiesToPatch.AddItem('Warden_BD_GrantImbueAmmoCharges');
    AbilitiesToPatch.AddItem('Warden_BD_GrantSoulBladeCharges');

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

    foreach AbilitiesToPatch(AbilityName)
    {
        AbilityTemplateManager.FindDataTemplateAllDifficulties(AbilityName, DifficultyVariants);
        foreach DifficultyVariants(DifficultyVariant)
        {
            Template = X2AbilityTemplate(DifficultyVariant);
            if (Template == none)
                continue;
            foreach Template.AbilityCosts(Cost)
            {
                ActionPointCost = X2AbilityCost_ActionPoints(Cost);
                if (ActionPointCost != none && ActionPointCost.bConsumeAllPoints)
                    ActionPointCost.DoNotConsumeAllEffects.AddItem('WardenChargeActive');
            }
        }
    }
}

static function PatchWrongStanceText()
{
    local X2AbilityTemplateManager  AbilityMgr;
    local X2AbilityTemplate         Template;
    local X2Effect_ToHitModifier    HitModEffect;
    local string                    LocalizedText;
    local int                       i, j;

    AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
    LocalizedText = class'X2Ability_Warden'.default.WrongStanceText;

    if (LocalizedText == "")
        return;

    Template = AbilityMgr.FindAbilityTemplate('Warden_BD_RangedStance');
    if (Template != none)
    {
        for (i = 0; i < Template.AbilityTargetEffects.Length; i++)
        {
            HitModEffect = X2Effect_ToHitModifier(Template.AbilityTargetEffects[i]);
            if (HitModEffect == none) continue;
            if (HitModEffect.EffectName != class'X2Ability_Warden'.default.WardenRangedStanceAimPenalty) continue;
            for (j = 0; j < HitModEffect.Modifiers.Length; j++)
                HitModEffect.Modifiers[j].Modifier.Reason = LocalizedText;
        }
    }

    Template = AbilityMgr.FindAbilityTemplate('Warden_BD_MeleeStance');
    if (Template != none)
    {
        for (i = 0; i < Template.AbilityTargetEffects.Length; i++)
        {
            HitModEffect = X2Effect_ToHitModifier(Template.AbilityTargetEffects[i]);
            if (HitModEffect == none) continue;
            if (HitModEffect.EffectName != class'X2Ability_Warden'.default.WardenMeleeStanceAimPenalty) continue;
            for (j = 0; j < HitModEffect.Modifiers.Length; j++)
                HitModEffect.Modifiers[j].Modifier.Reason = LocalizedText;
        }
    }
}

static function PatchLastRitesChargeDisplayInfo()
{
    local X2AbilityTemplateManager          AbilityMgr;
    local X2AbilityTemplate                 ChargeDisplayTemplate;
    local X2AbilityTemplate                 LastRitesTemplate;
    local X2Effect_WardenLastRitesCharge    ChargeEffect;
    local int                               i;

    AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
    ChargeDisplayTemplate = AbilityMgr.FindAbilityTemplate('Warden_BD_LastRitesCharge');
    LastRitesTemplate = AbilityMgr.FindAbilityTemplate('Warden_BD_LastRites');

    if (ChargeDisplayTemplate == none || LastRitesTemplate == none)
        return;

    for (i = 0; i < LastRitesTemplate.AbilityTargetEffects.Length; i++)
    {
        ChargeEffect = X2Effect_WardenLastRitesCharge(LastRitesTemplate.AbilityTargetEffects[i]);
        if (ChargeEffect == none) continue;

        ChargeEffect.SetDisplayInfo(ePerkBuff_Penalty,
            ChargeDisplayTemplate.LocFriendlyName,
            ChargeDisplayTemplate.GetMyLongDescription(),
            "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_HomingMine",
            true, , LastRitesTemplate.AbilitySourceName);
        break;
    }
}

static function WeaponInitialized(XGWeapon WeaponArchetype, XComWeapon Weapon, optional XComGameState_Item ItemState = none)
{
    local XComContentManager            Content;
    local X2UnifiedProjectile           Projectile;
    local X2UnifiedProjectileElement    Element;
	local XComGameState_Unit			UnitState;


	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ItemState.OwnerStateObject.ObjectID));
	
	if (UnitState != none && UnitState.HasAbilityFromAnySource('Warden_BD_ImbueAmmo'))
    {
        Content = `CONTENT;
        Weapon.CustomUnitPawnAnimsets.AddItem(AnimSet(Content.RequestGameArchetype("Anim_Warden_BD_ImbueAmmo.Anims.AS_ImbueAmmo")));

        Projectile = X2UnifiedProjectile(Content.RequestGameArchetype("Anim_Warden_BD_ImbueAmmo.PJ_ImbuedShot"));
        foreach Projectile.ProjectileElements(Element)
        {
            `AMLOG("Adding projectile elements into array:" @ Weapon.DefaultProjectileTemplate.ProjectileElements.Length);
            Weapon.DefaultProjectileTemplate.ProjectileElements.AddItem(Element);
        }
    }

}
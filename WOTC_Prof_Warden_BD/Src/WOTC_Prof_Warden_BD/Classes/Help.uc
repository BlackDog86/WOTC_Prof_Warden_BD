//  FILE:    Help.uc
//  AUTHOR:  Iridar  --  20/04/2022
//  PURPOSE: Helper class for static functions and script snippet repository.     
//---------------------------------------------------------------------------------------

class Help extends Object abstract;

	// For Refernce:
	// Persistent Effect Format:
	// 1) 2 - for how many turns should this effect be active
	// 2) false - whether effect has infinite duration
	// 3) false - whether the effect should be removed when source (unit that applied the effect) dies - irrelevant for self-target abilities.
	// 4) false - ignore player check on tick - relevant for effects that tick each turn. Determines whether the effect should tick for every player, or just for the player that applied the effect.
	// In this context, "player" is a side in tactical combat, e.g. human player, ADVENT, Chosen, Lost - all are separate players (teams).
	// 5) eGameRule_PlayerTurnEnd - when should this effect tick.
	
	// Visualisation:
	// 1) ePerkBuff_Bonus - this will make the effect show up as a green chevron on the unit flag.
	// 2) Template.LocFriendlyName - localized name that the effect should use, e.g. to display the source of bonus damage.
	// In this case, set to the same name as the ability itself.
	// 3) Template.GetMyLongDescription() - localized description of the effect, visible if the player mouseovers the green chevron to check what's the effect.
	// In this case it's set to have the same description as the ability.
	// 4) Template.IconImage - Icon used by the effect. You guessed it - same as the ability. 
	// 5) true - Whether the effect should be displayed at all.
	// 6) "" - path to the status icon for this effect. In this case - empty. It's a small red icon that shows up under unit flag, e.g. when unit is burning.
	// 7) Template.AbilitySourceName - color of the effect'sS icon. Set to be the same as the ability.

/*

### Creating and Submitting a Game State

local XComGameState NewGameState;

NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Optional Debug Comment");

`GAMERULES.SubmitGameState(NewGameState);

### Random Number Generation

FRand() returns a random `float` value from the [0; 1] range. 
int(x * FRand()) - returns a random `int` value from [0; x] range.

FRand() can only return 32 768 distinct results. (c) robojumper

`SYNC_FRAND() - returns a random `flaot` value from [0; 1) range
`SYNC_FRAND_STATIC()

`SYNC_RAND(x) - returns a random `int` value from [0; x) range.
`SYNC_RAND_STATIC(x)

`SYNC_VRAND() - returns a random `vector`, each component of the vector will have value from (-1; 1) range.
`SYNC_VRAND_STATIC()

`SYNC_VRAND() * x - return a random `vector` where each component is from the (-x; x) range.

### Action Points

class'X2CharacterTemplateManager'.default.StandardActionPoint
class'X2CharacterTemplateManager'.default.MoveActionPoint
class'X2CharacterTemplateManager'.default.OverwatchReserveActionPoint
class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint
class'X2CharacterTemplateManager'.default.GremlinActionPoint
class'X2CharacterTemplateManager'.default.RunAndGunActionPoint
class'X2CharacterTemplateManager'.default.EndBindActionPoint
class'X2CharacterTemplateManager'.default.GOHBindActionPoint
class'X2CharacterTemplateManager'.default.CounterattackActionPoint
class'X2CharacterTemplateManager'.default.UnburrowActionPoint
class'X2CharacterTemplateManager'.default.ReturnFireActionPoint
class'X2CharacterTemplateManager'.default.DeepCoverActionPoint
class'X2CharacterTemplateManager'.default.MomentumActionPoint
class'X2CharacterTemplateManager'.default.SkirmisherInterruptActionPoint


### Ability Icon Colors

'eAbilitySource_Perk': yellow
'eAbilitySource_Debuff': red
'eAbilitySource_Psionic': purple
'eAbilitySource_Commander': green 
'eAbilitySource_Item': blue 
'eAbilitySource_Standard': blue

### Persistent Effects applied to Units

if (UnitState.IsUnitAffectedByEffectName('NameOfTheEffect'))
{
    // Do stuff
}

# Get an effect's Effect State from unit

local XComGameState_Effect EffectState;

EffectState = UnitState.GetUnitAffectedByEffectState('NameOfTheEffect');

if (EffectState != none)
{
    // Do stuff
}

# Iterate over all effects on unit

local StateObjectReference EffectRef;
local XComGameStateHistory History;
local XComGameState_Effect EffectState;

History = `XCOMHISTORY;

foreach UnitState.AffectedByEffects(EffectRef)
{
    EffectState = XComGameState_Effect(History.GetGameStateForObjectID(EffectRef.ObjectID));

    // Do stuff with EffectState
}


### Working with ClassDefaultObjects

class'XComEngine'.static.GetClassDefaultObject(class SeachClass);
class'XComEngine'.static.GetClassDefaultObjectByName(name ClassName);

// This method will give you an array of CDOs for the specified class and all of its subclasses, in case you need to handle them as well.
class'XComEngine'.static.GetClassDefaultObjects(class SeachClass);

class'Engine'.static.FindClassDefaultObject(string ClassName)

### Check if a Unit can see a Location

local XComGameState_Unit UnitState;
local TTile TileLocation;

if (class'X2TacticalVisibilityHelpers'.static.CanUnitSeeLocation(UnitState.ObjectID, TileLocation))
{
    // Do stuff
}

### Modnames of commonly required mods

PrototypeArmoury
CovertInfiltration
LongWarOfTheChosen
XCOM2RPGOverhaul
X2WOTCCommunityPromotionScreen
WOTCIridarTemplateMaster
PrimarySecondaries
TruePrimarySecondaries
DualWieldedPistols
WOTC_LW2SecondaryWeapons

*/



static final function XComGameState_HeadquartersXCom GetAndPrepXComHQ(XComGameState NewGameState)
{
    local XComGameState_HeadquartersXCom XComHQ;

    foreach NewGameState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
    {
        break;
    }

    if (XComHQ == none)
    {
        XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
        XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
    }

    return XComHQ;
}

static final function bool IsModActive(name ModName)
{
    local XComOnlineEventMgr    EventManager;
    local int                   Index;

    EventManager = `ONLINEEVENTMGR;

    for (Index = EventManager.GetNumDLC() - 1; Index >= 0; Index--) 
    {
        if (EventManager.GetDLCNames(Index) == ModName) 
        {
            return true;
        }
    }
    return false;
}

static final function bool AreModsActive(const array<name> ModNames)
{
	local name ModName;

	foreach ModNames(ModName)
	{
		if (!IsModActive(ModName))
		{
			return false;
		}
	}
	return true;
}

static final function bool IsInStrategy()
{
    return `HQPRES != none;
}

static final function bool ReallyIsInStrategy()
{
	return `HQGAME  != none && `HQPC != None && `HQPRES != none;
}

// Sound managers don't exist in Shell, have to do it by hand.
static final function PlayStrategySoundEvent(string strKey, Actor InActor)
{
	local string	SoundEventPath;
	local AkEvent	SoundEvent;

	foreach class'XComStrategySoundManager'.default.SoundEventPaths(SoundEventPath)
	{
		if (InStr(SoundEventPath, strKey) != INDEX_NONE)
		{
			SoundEvent = AkEvent(`CONTENT.RequestGameArchetype(SoundEventPath));
			if (SoundEvent != none)
			{
				InActor.WorldInfo.PlayAkEvent(SoundEvent);
				return;
			}
		}
	}
}

// For using hex color.
static function string ColourText(string strValue, string strColour)
{
	return "<font color='#" $ strColour $ "'>" $ strValue $ "</font>";
}



static final function int GetForceLevel()
{
	local XComGameStateHistory		History;
	local XComGameState_BattleData	BattleData;

	History = `XCOMHISTORY;
	BattleData = XComGameState_BattleData(History.GetSingleGameStateObjectForClass(class'XComGameState_BattleData', true));
	if (BattleData == none)
	{
		`AMLOG("WARNING :: No Battle Data!" @ GetScriptTrace());
		return -1;
	}

	return BattleData.GetForceLevel();
}

static final function AddItemToHQInventory(const name TemplateName)
{
    local XComGameState						NewGameState;
    local XComGameState_HeadquartersXCom    XComHQ;
    local XComGameState_Item                ItemState;
    local X2ItemTemplate                    ItemTemplate;
    local X2ItemTemplateManager				ItemMgr;

    ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();    

    ItemTemplate = ItemMgr.FindItemTemplate(TemplateName);

    if (ItemTemplate != none)
    {
        NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding item to HQ Inventory");
        XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', `XCOMHQ.ObjectID));

        ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);     

		// XComHQ.PutItemInInventory() is unable to work with infinite items. Use XComHQ.AddItemToHQInventory(ItemState) for those.		
        XComHQ.PutItemInInventory(NewGameState, ItemState);
        `GAMERULES.SubmitGameState(NewGameState);
    }
}


// Get Bond Level between two soldiers
static final function int GetBondLevel(const XComGameState_Unit SourceUnit, const XComGameState_Unit TargetUnit)
{
    local SoldierBond BondInfo;

    if (SourceUnit.GetBondData(SourceUnit.GetReference(), BondInfo))
    {
        if (BondInfo.Bondmate.ObjectID == TargetUnit.ObjectID)
        {
            return BondInfo.BondLevel;
        }
    }
    return 0;
}

// Check if a Unit has a Weapon of specified WeaponCategory equipped
static final function bool HasWeaponOfCategory(const XComGameState_Unit UnitState, const name WeaponCat, optional XComGameState CheckGameState)
{
    local XComGameState_Item Item;
    local StateObjectReference ItemRef;

    foreach UnitState.InventoryItems(ItemRef)
    {
        Item = UnitState.GetItemGameState(ItemRef, CheckGameState);

        if (Item != none && Item.GetWeaponCategory() == WeaponCat)
        {
            return true;
        }
    }

    return false;
}

// Similar check, but also for a specific slot:
static final function bool HasWeaponOfCategoryInSlot(const XComGameState_Unit UnitState, const name WeaponCat, const EInventorySlot Slot, optional XComGameState CheckGameState)
{
    local XComGameState_Item Item;
    local StateObjectReference ItemRef;

    foreach UnitState.InventoryItems(ItemRef)
    {
        Item = UnitState.GetItemGameState(ItemRef, CheckGameState);

        if (Item != none && Item.GetWeaponCategory() == WeaponCat && Item.InventorySlot == Slot)
        {
            return true;
        }
    }
    return false;
}

// Check if a Unit has one of the specified items equipped
static final function bool UnitHasItemEquipped(const XComGameState_Unit UnitState, const array<name> ItemNames, optional XComGameState CheckGameState)
{
    local XComGameState_Item Item;
    local StateObjectReference ItemRef;

    foreach UnitState.InventoryItems(ItemRef)
    {
        Item = UnitState.GetItemGameState(ItemRef, CheckGameState);

        if (Item != none && ItemNames.Find(Item.GetMyTemplateName()) != INDEX_NONE)
        {
            return true;
        }
    }

    return false;
}

static final function int TileDistanceBetweenUnitAndTile(const XComGameState_Unit UnitState, const TTile TileLocation)
{
	local XComWorldData WorldData;
	local vector UnitLoc, TargetLoc;
	local float Dist;
	local int Tiles;

	if (UnitState.TileLocation == TileLocation)
		return 0;

	WorldData = `XWORLD;
	UnitLoc = WorldData.GetPositionFromTileCoordinates(UnitState.TileLocation);
	TargetLoc = WorldData.GetPositionFromTileCoordinates(TileLocation);
	Dist = VSize(UnitLoc - TargetLoc);
	Tiles = Dist / WorldData.WORLD_StepSize;

	return Tiles;
}

// Calculate Tile Distance Between Tiles
static final function int GetTileDistanceBetweenTiles(const TTile TileA, const TTile TileB) 
{
	local XComWorldData WorldData;
	local vector LocA;
	local vector LocB;
	local float Dist;
	local int TileDistance;

	WorldData = `XWORLD;
	LocA = WorldData.GetPositionFromTileCoordinates(TileA);
	LocB = WorldData.GetPositionFromTileCoordinates(TileB);

	Dist = VSize(LocA - LocB);
	TileDistance = Dist / WorldData.WORLD_StepSize;
	
	return TileDistance;
}

// Rank = 0 for Squaddie
// Note: ModifyEarnedSoldierAbilities DLC hook is usually better for non-temporary ability granting.
static function GiveSoldierAbilityToUnit(const name AbilityName, const int Rank, XComGameState_Unit UnitState, XComGameState NewGameState)
{	
	local SoldierClassAbilityType AbilityStruct;
	local int Index;

	AbilityStruct.AbilityName = AbilityName;
	UnitState.AbilityTree[Rank].Abilities.AddItem(AbilityStruct);

	Index = UnitState.AbilityTree[Rank].Abilities.Length - 1;

	UnitState.BuySoldierProgressionAbility(NewGameState, Rank, Index, 0); // 0 = ability points cost
}

/*
The GetLocalizedString() function is a helper with the purpose similar to that of the Config Engine:
make using localized strings more convenient without having to explicitly declare localized them as variables.

It relies on using Localize() function, which probably is far from optimal in terms of performance,
so you probably shouldn't use it *too much*, especially in performance-sensitive code.

Set localized value:

# Setting: 

WardenRemaster.int
[Help]
StringName = "Wow fancy localized string!"

# Getting: 

YourString = class'Help'.static.GetLocalizedString('StringName');

Or with global macro for brevity:

YourString = `GetLocalizedString('StringName');

*/
static final function string GetLocalizedString(const coerce string StringName)
{
	return Localize("Help", StringName, "WardenRemaster");
}

// Create a single big string out of an array of smaller strings, separated by an optional delimiter.
static final function string JoinStrings(array<string> Arr, optional string Delim = "")
{
	local string ReturnString;
	local int i;

	// Handle it this way so there's no delim after the final member.
	for (i = 0; i < Arr.Length - 1; i++)
	{
		ReturnString $= Arr[i] $ Delim;
	}
	if (Arr.Length > 0)
	{
		ReturnString $= Arr[Arr.Length - 1];
	}
	return ReturnString;
}

static final function array<XComGameState_Unit> GetSquadUnitStates()
{
	local XComGameState_HeadquartersXCom	XComHQ;
	local StateObjectReference				SquadUnitRef;
	local array<XComGameState_Unit>			UnitStates;
	local XComGameState_Unit				UnitState;
	local XComGameStateHistory				History;

	XComHQ = `XCOMHQ;
	History = `XCOMHISTORY;
	foreach XComHQ.Squad(SquadUnitRef)
	{
		UnitState = XComGameState_Unit(History.GetGameStateForObjectID(SquadUnitRef.ObjectID));
		if (UnitState != none)
		{
			UnitStates.AddItem(UnitState);
		}
	}
	return UnitStates;
}

static final function bool AreItemTemplatesMutuallyExclusive(const X2ItemTemplate TemplateA, const X2ItemTemplate TemplateB)
{
	return TemplateA.ItemCat == TemplateB.ItemCat || 
			X2WeaponTemplate(TemplateA) != none && X2WeaponTemplate(TemplateB) != none && 
			X2WeaponTemplate(TemplateA).WeaponCat == X2WeaponTemplate(TemplateB).WeaponCat;
}


static final function bool IsItemUniqueEquipInSlot(X2ItemTemplateManager ItemMgr, const X2ItemTemplate ItemTemplate, const EInventorySlot Slot)
{
	local X2WeaponTemplate WeaponTemplate;

	if (class'X2TacticalGameRulesetDataStructures'.static.InventorySlotBypassesUniqueRule(Slot))
		return false;

	WeaponTemplate = X2WeaponTemplate(ItemTemplate);

	return ItemMgr.ItemCategoryIsUniqueEquip(ItemTemplate.ItemCat) || WeaponTemplate != none && ItemMgr.ItemCategoryIsUniqueEquip(WeaponTemplate.WeaponCat);
}

/* Junked Abils for reference
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

    // If at this point bAffectedByTotalCombat is true, then all of this ability's action costs are effected by Total Comba


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

class X2Effect_DestroyAbomination extends X2Effect_ApplyWeaponDamage;

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef)
{
    
	local WeaponDamageValue DamageValue; 

    DamageValue = EffectDamageValue;

    DamageValue.Damage = 1.5 * SourceUnit.GetMaxStat(eStat_HP);
	
    return DamageValue;
}

defaultproperties
{
    bIgnoreBaseDamage = true
}
// This is an Unreal Script
*/
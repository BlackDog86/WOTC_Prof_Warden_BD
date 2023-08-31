class X2Effect_Blockade extends X2Effect_Persistent config(WardenSkills);

var float		DamageReduction;
var int			DamageReductionAbs;
var bool 		bAbsoluteVal;
var config int	BLOCKADE_DR_PERCENTAGE;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMgr;
	local Object EffectObj;
    local XComGameState_Unit UnitState;

	EventMgr = `XEVENTMGR;

	EffectObj = EffectGameState;
    UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));
	
    EventMgr.RegisterForEvent(EffectObj, 'DRFlyover', EffectGameState.TriggerAbilityFlyover, ELD_OnStateSubmitted,, UnitState);
}

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Unit UnitState;
	local XComGameState_Ability AbilityState;
	
	AbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(ApplyEffectParameters.AbilityStateObjectRef.ObjectID));
	UnitState = XComGameState_Unit(kNewTargetState);

	if (AbilityState != none && UnitState != none)
		`XEVENTMGR.TriggerEvent('DRFlyover', AbilityState, UnitState, NewGameState);
	
	super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
}

function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState)
{
	local int 								DamageMod;

	if (bAbsoluteVal)
	{
		if (CurrentDamage > 0)
		{
			DamageMod = -DamageReductionAbs;
		}
		
	}
	else
	{
		if (CurrentDamage > 0)
		{
			DamageMod = -int(float(CurrentDamage) * float(100 - BLOCKADE_DR_PERCENTAGE) / 100.0f);
		}
	}	
	return DamageMod;
}

DefaultProperties
{
	DuplicateResponse = eDupe_Ignore
	bDisplayInSpecialDamageMessageUI = true
	bAbsoluteVal = false;
}
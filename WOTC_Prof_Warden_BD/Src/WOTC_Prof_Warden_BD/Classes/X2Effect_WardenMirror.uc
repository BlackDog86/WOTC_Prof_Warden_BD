class X2Effect_WardenMirror extends X2Effect_Persistent config(WardenSkills);

function bool ChangeHitResultForTarget(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, bool bIsPrimaryTarget, const EAbilityHitResult CurrentResult, out EAbilityHitResult NewHitResult)
{ 
	local	X2AbilityToHitCalc_StandardAim	Aim;

		Aim = X2AbilityToHitCalc_StandardAim(AbilityState.GetMyTemplate().AbilityToHitCalc);

		// Only respond to direct attacks against the target, ignore AOE attacks 
		If ( Aim == none || Aim.bReactionFire || !bIsPrimaryTarget)
		{ 		
		return false;
		}
		switch (CurrentResult)
		{
		case eHit_Crit:
			NewHitResult = eHit_Graze;	
			return true;
		case eHit_Success:
			NewHitResult = eHit_Graze;		
			return true;
		case eHit_Graze:
			NewHitResult = eHit_Graze;
			return true;
		default:
			break;
		}	

	return false; 
}

function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState)
{ 
		local X2AbilityToHitCalc_StandardAim	Aim;
		local XComGameState_Player				Player;
		local XComGameState_Unit				UnitState;

		UnitState = XComGameState_Unit(TargetDamageable);			
		Player = XComGameState_Player(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.PlayerStateObjectRef.ObjectID));
		Aim = X2AbilityToHitCalc_StandardAim(AbilityState.GetMyTemplate().AbilityToHitCalc);
		
		// Do not trigger the event for damage preview, reaction fire, explosive damage or stuff that doesn't actually do any damage in the first place
		If (UnitState == none || Player == none || Aim == none || Aim.bReactionFire || WeaponDamageEffect.bExplosiveDamage || CurrentDamage == 0 || NewGameState == none)
		{
		Return 0;
		`log("One of the states in Mirror GetDefendingDamageModifier was None - not triggereing the tick event");
		}
		Else
		{	
		`XEVENTMGR.TriggerEvent('MirrorReturnFire', Player, UnitState, NewGameState);	
		`XEVENTMGR.TriggerEvent('MirrorManualTick', Player, UnitState, NewGameState);
		 `log("Triggering mirror tick event");
		 return 0; 
		}
}

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager		EventMgr;
	local Object				EffectObj;
	
	EventMgr = `XEVENTMGR;

	EffectObj = EffectGameState;

	//	Unregister from this event so that the effect does not get removed based on turns.
	EventMgr.UnRegisterFromEvent(EffectObj, 'PlayerTurnEnded');

	//	Instead, subscribe an event that we trigger manually 
	EventMgr.RegisterForEvent(EffectObj, 'MirrorManualTick', OnPlayerTurnTickedWrapper, ELD_OnStateSubmitted,,,, EffectGameState);
}

static function EventListenerReturn OnPlayerTurnTickedWrapper(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameState_Unit   TargetUnit;
	local XComGameState_Effect EffectGameState;

	EffectGameState = XComGameState_Effect(CallbackData);
	TargetUnit = XComGameState_Unit(EventSource);

	//	If this event was triggered by a unit this effect was applied to
	if (EffectGameState != none && TargetUnit != none && EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID == TargetUnit.ObjectID)
	{		
		//	Then "tick" the effect. Since the effect has 1 turn duration, that's effectively the same as removing it.
		//	Straight up removing the effect doesn't work, because that for some reason doesn't handle removing perk content PFX
		return EffectGameState.OnPlayerTurnTicked(EventData, EventSource, GameState, Event, CallbackData);
	}
	return ELR_NoInterrupt;
}

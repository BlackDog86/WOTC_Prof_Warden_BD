class X2Effect_WardenMirror extends X2Effect_Persistent config(WardenSkills);

function bool ChangeHitResultForTarget(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, bool bIsPrimaryTarget, const EAbilityHitResult CurrentResult, out EAbilityHitResult NewHitResult)
{ 
	local	X2AbilityToHitCalc_StandardAim	Aim;
	local	XComGameState_Player			Player;

		Aim = X2AbilityToHitCalc_StandardAim(AbilityState.GetMyTemplate().AbilityToHitCalc);
		
		If (Aim == none)
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
		//If hit by an environmenal explosive, or if the attack didn't do any damage, due to missing or not being a damaging atatck at all, don't do anything
		If (Aim == none || CurrentDamage == 0 )
		{		
		// Do not trigger at all against damage not applied by a unit & don't tick
		Return 0;	
		}
		// Do not trigger the reaction fire against OW, damage preview, explosives or if the unit is impaired
		Else If (UnitState == none || UnitState.IsImpaired() || UnitState.IsBurning() || UnitState.IsPanicked() || Aim.bReactionFire || WeaponDamageEffect.bExplosiveDamage || NewGameState == none)
		{
		// Tick the effect for AOE effects that graze even if fire wasn't returned
		`XEVENTMGR.TriggerEvent('MirrorManualTick', Player, UnitState, NewGameState);
		`log("Mirror not returning fire due to conditions");
		Return 0;		
		}
		Else
		//someone made a direct attack - tick effect & return fire!
		{		
		`XEVENTMGR.TriggerEvent('MirrorReturnFire', Player, UnitState, NewGameState);	
		`XEVENTMGR.TriggerEvent('MirrorManualTick', Player, UnitState, NewGameState);		
		 `log("Triggering mirror return fire");
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

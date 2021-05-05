#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Spawns units from cache and activates tactical FSM.
*
* Arguments:
* 0: Stronghold <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_location] call TWC_Insurgency_OPFOR_fnc_activateStronghold;
*/

params ["_stronghold"];

private _enemySide = call TWC_Insurgency_OPFOR_fnc_enemySide;

private _strongholdPos = locationPosition _stronghold;
private _strongholdSize = size _stronghold;
private _radius = (_strongholdSize call BIS_fnc_arithmeticMean) * 2;

private _nearbyEnemies = [2000, _strongholdPos] call TWC_Insurgency_OPFOR_fnc_nearbyEnemies;

private _spawnedGroups = [];
{
	_x params ["_pos", "_units"];
	private _group = [_pos, _enemySide, _units] call BIS_fnc_spawnGroup;
	
	if ((_units select 0) isKindOf "StaticWeapon") then {
		private _static = vehicle leader _group;
		_static setPosASL _pos;
	};
	
	_spawnedGroups pushBack _group;
	
	[_pos] call TWC_Insurgency_OPFOR_fnc_removeFromCache;
} forEach _nearbyEnemies;

private _fsm = [_spawnedGroups, _stronghold] execFSM "Insurgency_Core\server\OPFOR\tacticalAI\tacticalAI.fsm";

//Storing when the stronghold was activated and what enemies were activated with it
_location setVariable ["TWC_Insurgency_Locations_time", CBA_missionTime];
_location setVariable ["TWC_Insurgency_Locations_fsm", _fsm];
_location setVariable ["TWC_Insurgency_Locations_groups", _spawnedGroups];

DEBUG_LOG("Activated Stronghold " + text _stronghold);
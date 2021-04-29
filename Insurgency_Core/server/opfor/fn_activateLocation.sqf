#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Spawns units from cache and activates tactical FSM.
*
* Arguments:
* 0: Location <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_location] call TWC_Insurgency_OPFOR_fnc_activateLocation;
*/

params ["_location"];

private _enemySide = call TWC_Insurgency_OPFOR_fnc_enemySide;

private _locationPos = locationPosition _location;
private _locationSize = size _location;
private _radius = (_locationSize call BIS_fnc_arithmeticMean) * 2;

private _nearbyEnemies = [2000, _locationPos] call TWC_Insurgency_OPFOR_fnc_nearbyEnemies;

private _spawnedGroups = [];
{
	_x params ["_pos", "_units"];
	private _group = [_pos, _enemySide, _units] call BIS_fnc_spawnGroup;
	
	_spawnedGroups pushBack _group;
	
	[_pos] call TWC_Insurgency_OPFOR_fnc_removeFromCache;
} forEach _nearbyEnemies;

private _fsm = [_spawnedGroups, _location] execFSM "Insurgency_Core\server\OPFOR\tacticalAI\tacticalAI.fsm";

//Storing when the location was activated and what enemies were activated with it
missionNameSpace setVariable [text _location + "_opfor", [[_spawnedGroups, _fsm], CBA_missionTime]];

DEBUG_LOG("Activated Location " + text _location);
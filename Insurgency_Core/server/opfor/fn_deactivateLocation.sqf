#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Caches all units and completes tactical FSM in a location.
*
* Arguments:
* 0: Location <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_location] call TWC_Insurgency_OPFOR_fnc_deactivateLocation;
*/

params ["_location"];

private _fsm = _location getVariable ["TWC_Insurgency_Locations_fsm", -1];
private _enemyGroups = _location getVariable ["TWC_Insurgency_Locations_groups", []];

_fsm setFSMVariable ["_doComplete", true];

if (count _enemyGroups > 0) then {
	{
		[_x] call TWC_Insurgency_OPFOR_fnc_cacheGroup;
	} forEach _enemyGroups;
};

_location setVariable ["TWC_Insurgency_Locations_fsm", -1];
_location setVariable ["TWC_Insurgency_Locations_groups", []];

DEBUG_LOG(text _location + " deactivated");
#include "..\..\includes\script_component.hpp"

params ["_location"];

private _locationDetails = missionNameSpace getVariable [text _location, []];

if (count _locationDetails == 0) exitWith {DEBUG_LOG(text _location + " is already inactive")};

(_locationDetails select 0) params ["_enemyGroups", "_fsm"];
private _activationTime = _locationDetails select 1;

if (CBA_missionTime < _activationTime + 30) exitWith {DEBUG_LOG(text _location + " told to be active < 30 seconds ago")};

_fsm setFSMVariable ["_doComplete", true];

{
	[_x] call TWC_Insurgency_OPFOR_fnc_cacheGroup;
} forEach _enemyGroups;

missionNameSpace setVariable [text _location, nil];

DEBUG_LOG(text _location + " deactivated");
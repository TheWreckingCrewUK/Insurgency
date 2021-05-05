#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Sends all Location info to a client as a hint.
*
* Arguments:
* 0: Location <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_location, _target] call TWC_Insurgency_Debug_fnc_sendInfo;
*/

params ["_target"];

private _location = [getPos _target] call TWC_Insurgency_Locations_fnc_nearestLocation;

private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task", "_time", "_fsm", "_groups"];

private _message = formatText [
	"Stronghold: %2%1 Cache: %3%1 Allegiance: %4%1 Active: %5%1 Eldergroup: %6%1 Civgroup: %7%1 Task: %8%1 Time: %9%1 FSM: %10%1 Groups: %11",
	lineBreak,
	_isStronghold,
	_hasCache,
	_allegiance,
	_isActive,
	_elderGroup,
	_civGroup,
	_task,
	_time,
	_fsm,
	_groups
];

["TWC_Insurgency_debugActions_sendInfo", [_message], _target] call CBA_fnc_targetEvent;
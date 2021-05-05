#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Returns all information about a location from the variables stored on it.
*
* Arguments:
* 0: Location <LOCATION>
*
* Return Value:
* [_isStronghold, _hasCache, _allegiance, _isActive, _elderGroup, _civGroup, _task] <ARRAY>
*
* Example:
* [_location] call TWC_Insurgency_Locations_fnc_getInfo;
*/

params ["_location"];

private _isStronghold = _location getVariable ["TWC_Insurgency_Locations_isStronghold", false];
private _hasCache = _location getVariable ["TWC_Insurgency_Locations_hasCache", false];
private _allegiance = _location getVariable ["TWC_Insurgency_Locations_allegiance", 0];
private _isActive = _location getVariable ["TWC_Insurgency_Locations_isActive", false];
private _elderGroup = _location getVariable ["TWC_Insurgency_Locations_elderGroup", grpNull];
private _civGroup = _location getVariable ["TWC_Insurgency_Locations_civGroup", grpNull];
private _task = _location getVariable ["TWC_Insurgency_Locations_task", ""];
private _time = _location getVariable ["TWC_Insurgency_Locations_time", -600];
private _fsm = _location getVariable ["TWC_Insurgency_Locations_fsm", -1];
private _groups = _location getVariable ["TWC_Insurgency_Locations_groups", []];

[_isStronghold, _hasCache, _allegiance, _isActive, _elderGroup, _civGroup, _task, _time, _fsm, _groups]
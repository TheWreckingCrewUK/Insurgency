#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Changes whether a location has a cache.
*
* Arguments:
* 0: Location <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_location] call TWC_Insurgency_Locations_fnc_modifyCache;
*/

params ["_location"];

private _hasCache = _location getVariable ["TWC_Insurgency_Locations_hasCache", false];
_location setVariable ["TWC_Insurgency_Locations_hasCache", !_hasCache];

["TWC_Insurgency_Save_checkVictory", []] call CBA_fnc_serverEvent;

DEBUG_LOG("Modified Cache in location" + text _location);
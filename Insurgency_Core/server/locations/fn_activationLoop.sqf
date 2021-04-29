#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Checks whether there are players near, and consequently sends activation/deactivation events.
*
* Arguments:
* 0: Location <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_location] call TWC_Insurgency_Locations_fnc_activationLoop;
*/

params ["_location"];

private _nearPlayer = [_location, 1200] call CBA_fnc_nearPlayer;

private _isActive = _location getVariable ["TWC_Insurgency_Locations_isActive", false];

if (_nearPlayer) then {
	if (!_isActive) then {
		["TWC_Insurgency_Locations_Activate", [_location]] call CBA_fnc_serverEvent;
	};
} else {
	if (_isActive) then {
		["TWC_Insurgency_Locations_Deactivate", [_location]] call CBA_fnc_serverEvent;
	};
};
#include "..\..\includes\script_component.hpp"

params ["_location"];

private _isActive = _location getVariable ["TWC_Insurgency_Locations_isActive", false];
private _nearPlayer = [_location, 1200] call CBA_fnc_nearPlayer;

if (_nearPlayer) then {
	if (!_isActive) then {
		["TWC_Insurgency_Locations_Activate", [_location]] call CBA_fnc_serverEvent;
	};
} else {
	if (_isActive) then {
		["TWC_Insurgency_Locations_Deactivate", [_location]] call CBA_fnc_serverEvent;
	};
};
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

//Edited CBA_fnc_nearPlayer, players in a helicopter going > 80kph are excluded from spawning anything.
private _position = _location call CBA_fnc_getPos;
private _nearPlayer = false;

{
	private _isClose = _position distance _x < 1200;
	private _inHeli = vehicle _x isKindOf "Helicopter";
	private _isFast = speed (vehicle _x) > 80;
	if (_isClose && (!_inHeli || !_isFast)) exitWith {
		_nearPlayer = true;
	};
} forEach ([] call CBA_fnc_players);

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
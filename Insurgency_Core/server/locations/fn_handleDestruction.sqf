#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Handles building destruction event.
*
* Arguments:
* 0: Old Object <OBJECT>
* 1: New Object <OBJECT>
* 2: is Ruined <BOOLEAN>
*
* Return Value:
* NONE
*
* Example:
* [_previousObject, _newObject, _isRuin] call TWC_Insurgency_Locations_fnc_handleDesruction;
*/

params ["_previousObject", "_newObject", "_isRuin"];

if (_isRuin) then {
	private _location = [getPos _newObject] call TWC_Insurgency_Locations_fnc_nearestLocation;
	[_location, -5] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
};
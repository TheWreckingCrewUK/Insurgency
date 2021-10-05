#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Saves the game on a loop.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Save_fnc_save;
*/

private _allegiances = [];
{
	private _allegiance = _x getVariable ["TWC_Insurgency_Locations_allegiance", 0];
	_allegiances pushBack [_x, _allegiance];
} forEach TWC_Insurgency_Locations;

profileNamespace setVariable ["TWC_Insurgency_SaveInfo", _allegiances];
saveProfileNamespace;

[{call TWC_Insurgency_Save_fnc_save}, [], 300] call CBA_fnc_waitAndExecute;

DEBUG_LOG("Mission Saved");
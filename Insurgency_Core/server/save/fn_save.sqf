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

profileNamespace setVariable [missionName, [TWC_Insurgency_supplyBLUFOR, TWC_Insurgency_supplyOPFOR, TWC_Insurgency_manpowerOPFOR, _allegiances]];
saveProfileNamespace;

DEBUG_LOG("Mission Saved");
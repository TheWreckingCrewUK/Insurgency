#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Depawns Civs elders, and clean ups.
*
* Arguments:
* 0: Location <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_location] call TWC_Insurgency_Locations_fnc_townDeactivate;
*/

params ["_location"];

private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task"];

if (!_isActive) exitWith {DEBUG_LOG(text _location + " is already inactive")};

if (_isStronghold) exitWith {
	["TWC_Insurgency_OPFOR_deactivateStronghold", [_location]] call CBA_fnc_serverEvent;
};

//Clean-up units.
{
	deleteVehicle _x;
} forEach units _elderGroup;
deleteGroup _elderGroup;

{
	deleteVehicle _x;
} forEach units _civGroup;
deleteGroup _civGroup;

//Change location variables.
_location setVariable ["TWC_Insurgency_Locations_isActive", false];
_location setVariable ["TWC_Insurgency_Locations_elderGroup", grpNull];
_location setVariable ["TWC_Insurgency_Locations_civGroup", grpNull];

DEBUG_LOG(text _location + " deactivated");
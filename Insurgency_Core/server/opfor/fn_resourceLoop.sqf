#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Gives OPFOR Supply/Manpower based on holdings in a loop.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_OPFOR_fnc_resourceLoop;
*/

_allLocations = TWC_Insurgency_Locations;

private _manpower = 0;
{
	private _locationInfo = _x call TWC_Insurgency_Locations_fnc_getInfo;
	_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task", "_time", "_fsm", "_groups"];
	
	if (_hasCache) then {
		[50] call TWC_Insurgency_OPFOR_updateSupply;
	};
	private _menToAdd = switch (type _location) do {
		case "NameCityCapital": {10};
		case "NameCity": {8};
		case "NameVillage": {3};
		case "NameLocal": {1};
		default {0};
	};
	_menToAdd = _menToAdd * (1 - _allegiance / 100);
	_manpower = _manpower + _menToAdd;
} forEach _allLocations;

[_manpower] call TWC_Insurgency_OPFOR_fnc_updateManpower;

[{call TWC_Insurgency_OPFOR_fnc_resourceLoop}, [], 600] call CBA_fnc_waitAndExecute;

DEBUG_LOG("Added " + str _manpower + " manpower");
#include "..\..\includes\script_component.hpp"

_allLocations = TWC_Insurgency_Locations;

private _manpower = 0;
{
	private _locationInfo = _x call TWC_Insurgency_Locations_fnc_getInfo;
	_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task"];
	
	if (_hasCache) then {
		[50] call TWC_Insurgency_OPFOR_updateSupply;
	};
	private _menToAdd = switch (type _location) do {
		case "NameCityCapital": {20};
		case "NameCity": {15};
		case "NameVillage": {10};
		case "NameLocal": {5};
		default {0};
	};
	_menToAdd = _menToAdd * (1 - _allegiance / 100);
	_manpower = _manpower + _menToAdd;
} forEach _allLocations;

[_manpower] call TWC_Insurgency_OPFOR_fnc_updateManpower;

[{call TWC_Insurgency_OPFOR_fnc_resourceLoop}, [], 600] call CBA_fnc_waitAndExecute;

DEBUG_LOG("Added " + str _manpower + " manpower");
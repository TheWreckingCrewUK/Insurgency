#include "..\..\includes\script_component.hpp"

private _manpower = 0;
{
	_x params ["_location", "_isStronghold", "_hasCache", "_allegiance"];
	if (_hasCache) then {
		[30] call TWC_Insurgency_OPFOR_updateSupply;
	};
	private _menToAdd = switch (type _location) do {
		case "NameCityCapital": {40};
		case "NameCity": {30};
		case "NameVillage": {20};
		case "NameLocal": {10};
		default {0};
	};
	_menToAdd = _menToAdd * (1 - _allegiance / 100);
	_manpower = _manpower + _menToAdd;
} forEach TWC_Insurgency_Locations;

[_manpower] call TWC_Insurgency_OPFOR_fnc_updateManpower;

[{call TWC_Insurgency_OPFOR_fnc_resourceLoop}, [], 600] call CBA_fnc_waitAndExecute;

DEBUG_LOG("Added " + str _manpower + " manpower");
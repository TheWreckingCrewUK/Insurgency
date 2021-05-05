#include "..\..\..\includes\script_component.hpp"

params ["_location"];

//Spawning near base is probably a bit cavalier.
private _locationPos = locationPosition _location;
private _basePos = getMarkerPos "base";

if (_locationPos distance2d _basePos < 3000) exitWith {false};

//Don't spawn camps near locations OPFOR already has control over or are currently active.
private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task", "_time", "_fsm", "_groups"];

if (_allegiance < 30 || _isActive) exitWith {false};

//Make sure we have enough supply for a camp.
private _supply = TWC_Insurgency_supplyOPFOR;
private _manpower = TWC_Insurgency_manpowerOPFOR;

if (_supply < 100 || _manpower < 40) exitWith {false};

//Increase the chance depending on the size of the town.
private _weight = switch (type _location) do {
	case "NameLocal": {1.0001};
	case "NameVillage": {1.0002};
	case "NameCity": {1.0003};
	case "NameCityCapital": {1.0004};
};

if (random _weight < 1) exitWith {false};

true
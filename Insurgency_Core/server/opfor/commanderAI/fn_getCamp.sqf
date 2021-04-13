#include "..\..\..\includes\script_component.hpp"

params ["_location"];

//Don't spawn camps near active locations.
private _locationActivation = missionNameSpace getVariable [text _location, []];
if (count _locationActivation > 0) exitWith {false};

//Don't spawn camps near locations OPFOR already has control over.
private _locationArray = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationArray params ["_locationInfo", "_locationIndex"];
_locationInfo params ["_location", "_isStronghold", "_hasCache", "_allegiance"];

if (_allegiance < 30) exitWith {false};

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
#include "..\..\..\includes\script_component.hpp"

params ["_location"];

private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup"];

if (_allegiance < 30 && _allegiance > 70) exitWith {false};

private _supply = TWC_Insurgency_supplyOPFOR;
private _manpower = TWC_Insurgency_manpowerOPFOR;

if (_supply < 4 || _manpower < 1) exitWith {false};

private _weight = 1.001;

if (random _weight < 1) exitWith {false};

true
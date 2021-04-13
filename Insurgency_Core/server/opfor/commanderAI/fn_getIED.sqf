#include "..\..\..\includes\script_component.hpp"

params ["_location"];

private _locationArray = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationArray params ["_locationInfo", "_locationIndex"];
_locationInfo params ["_location", "_isStronghold", "_hasCache", "_allegiance"];

if (_allegiance < 30 && _allegiance > 70) exitWith {false};

private _supply = TWC_Insurgency_supplyOPFOR;
private _manpower = TWC_Insurgency_manpowerOPFOR;

if (_supply < 4 || _manpower < 1) exitWith {false};

private _weight = 1.001;

if (random _weight < 1) exitWith {false};

true
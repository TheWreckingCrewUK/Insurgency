#include "..\..\..\includes\script_component.hpp"

params ["_location"];

private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task", "_time", "_fsm", "_groups"];

if (_allegiance < 30) exitWith {false};

if (_time + 1800 > CBA_missionTime) exitWith {false};

private _supply = TWC_Insurgency_supplyOPFOR;
private _manpower = TWC_Insurgency_manpowerOPFOR;

if (_supply < 4 || _manpower < 1) exitWith {false};

private _weight = 1.0003;

if (random _weight < 1) exitWith {false};

true
#include "..\..\..\includes\script_component.hpp"

params ["_location"];

private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task", "_time", "_fsm", "_groups"];

if (_allegiance > 70) exitWith {false};

private _supply = TWC_Insurgency_supplyOPFOR;
private _manpower = TWC_Insurgency_manpowerOPFOR;

if (_supply < 10 || _manpower < 10) exitWith {false};

private _weight = 1.005;

private _locationPos = locationPosition _location;

private _strongholdInfo = [_locationPos, true] call TWC_Insurgency_OPFOR_fnc_getClosestStronghold;
_strongholdInfo params ["_stronghold", "_strongholdDistance"];

private _baseDistance = _locationPos distance2d (getMarkerPos "BASE");

//For every km we increase the chance by 0.001
private _weight = _weight + (_baseDistance - _strongholdDistance) / 1000000;

if (_isStronghold) then {
	_weight = _weight + 0.005;
};
if (_hasCache) then {
	_weight = _weight + 0.005;
};
if (_task isNotEqualTo "") then {
	_weight = _weight + 0.002;
};
if (_isActive) then {
	_weight = _weight + 0.003;
};

if (random _weight < 1) exitWith {false};

true
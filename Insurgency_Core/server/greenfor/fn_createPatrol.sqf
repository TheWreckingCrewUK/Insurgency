#include "..\..\includes\script_component.hpp"

params ["_location"];

private _spawnPos = getMarkerPos "BASE";
private _pos = locationPosition _location;

private _truckType = selectRandom (getArray (missionConfigFile >> "TWC_Insurgency" >> "greenfor_trucks"));
private _truck = createVehicle [_truckType, [0,0,0]];
_truck setPos _spawnPos;

private _section = getArray (missionConfigFile >> "TWC_Insurgency" >> "greenfor_section");
private _friendlySide = call TWC_Insurgency_GREENFOR_fnc_friendlySide;
private _group = [_spawnPos, _friendlySide, _section] call BIS_fnc_spawnGroup;

_group addVehicle _truck;

private _wp = _group addWaypoint [_pos, 100];
_wp setWaypointType "GETOUT";

private _size = size _location;
private _radius = _size call BIS_fnc_arithmeticMean;

[_group, _pos, _radius, 8, "MOVE", "AWARE", "YELLOW", "LIMITED", "COLUMN"] call CBA_fnc_taskPatrol;

DEBUG_LOG("Patrol created at " + text _location);
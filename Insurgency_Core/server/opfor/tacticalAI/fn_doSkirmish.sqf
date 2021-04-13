#include "..\..\..\includes\script_component.hpp"

params ["_group", "_BLUFOR", ["_location", locationNull]];

private _targetInfo = [_BLUFOR] call TWC_Insurgency_OPFOR_fnc_getPriorityBLUFOR;
_targetInfo params ["_target", "_targetPos", "_cost"];

private _groupPos = getPos leader _group;
private _dir = _targetPos getDir _groupPos;
private _skirmishPos1 = _targetPos getPos [500, _dir];
private _skirmishPos2 = _targetPos getPos [800, _dir];

private _wp1 = _group addWaypoint [_skirmishPos1, 50];
_wp1 setWaypointType "MOVE";

private _wp2 = _group addWaypoint [_skirmishPos2, 50];
_wp2 setWaypointType "MOVE";

DEBUG_LOG(str _group + " received order skirmish.");
#include "..\..\..\includes\script_component.hpp"

params ["_group", "_BLUFOR"];

private _targetInfo = [_BLUFOR] call TWC_Insurgency_OPFOR_fnc_getPriorityBLUFOR;
_targetInfo params ["_target", "_targetPos", "_cost"];

private _static = vehicle leader _group;
private _dir = _static getDir _target;

_static setDir _dir;

private _wp1 = _group addWaypoint [getPos leader _group, 2];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointTimeout [20, 30, 40];

DEBUG_LOG(str _group + " received order turn static.");
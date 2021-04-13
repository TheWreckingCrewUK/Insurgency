#include "..\..\..\includes\script_component.hpp"

params ["_group", "_BLUFOR", ["_location", locationNull]];

private _targetInfo = [_BLUFOR] call TWC_Insurgency_OPFOR_fnc_getPriorityBLUFOR;
_targetInfo params ["_target", "_targetPos", "_cost"];

private _wp1 = _group addWaypoint [_targetPos, 0];
_wp1 setWaypointType "SAD";

DEBUG_LOG(str _group + " received order attack.");
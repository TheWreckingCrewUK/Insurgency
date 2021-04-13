#include "..\..\..\includes\script_component.hpp"

params ["_group", "_BLUFOR", ["_location", locationNull]];

private _targetInfo = [_BLUFOR] call TWC_Insurgency_OPFOR_fnc_getPriorityBLUFOR;
_targetInfo params ["_target", "_targetPos", "_cost"];

private _attackSide = selectRandom [-90, 90];

private _flankPos = if !(isNull _location) then {
	private _locationPos = locationPosition _location;
	private _dirToLocation = (_targetPos getDir _locationPos) + _attackSide;
	_targetPos getPos [600, _dirToLocation];
} else {
	private _groupPos = getPos leader _group;
	private _dirToOPFOR = (_targetPos getDir _groupPos) + _attackSide;
	_targetPos getPos [600, _dirToOPFOR];
};

private _wp1 = _group addWaypoint [_flankPos, 50];
_wp1 setWaypointType "MOVE";

private _wp2 = _group addWaypoint [_targetPos, 0];
_wp2 setWaypointType "SAD";

DEBUG_LOG(str _group + " received order flank.");
#include "..\..\..\includes\script_component.hpp"

params ["_group", "_BLUFOR"];

//_BLUFOR array in format [["_unit", "_pos", "_cost"]...];

private _target = [_BLUFOR] call TWC_Insurgency_OPFOR_fnc_getPriorityBLUFOR;

_target params ["_unit", "_pos", "_cost"];
{
	private _mortar = vehicle _x;
	if (_mortar isKindOf "StaticMortar") then {
		_x doArtilleryFire [_pos, getArtilleryAmmo [_mortar] select 0, random 6];
	};
} forEach (units _group);

private _wp1 = _group addWaypoint [getPos leader _group, 2];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointTimeout [20, 30, 40];

DEBUG_LOG(str _group + " received order mortar.");
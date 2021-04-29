#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Gets the nearest Camp.
*
* Arguments:
* 0: Position <ARRAY>
*
* Return Value:
* Camp <MARKER>
*
* Example:
* [_pos] call TWC_Insurgency_OPFOR_fnc_nearestCamp;
*/

params ["_pos"];

private _allCamps = TWC_Insurgency_OPFOR_Camps;

private _distance = INFINITE_DISTANCE;
private _nearestCamp = "";

{
	private _campPos = getMarkerPos _x;
	private _checkDistance = _campPos distance2d _pos;
	if (_checkDistance < _distance) then {
		_nearestCamp = _x;
		_distance = _checkDistance;
	};
} forEach _allCamps;

_nearestCamp
#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Gets the nearest IED.
*
* Arguments:
* 0: Position <ARRAY>
*
* Return Value:
* IED <OBJECT>
*
* Example:
* [_pos] call TWC_Insurgency_OPFOR_fnc_nearestIED;
*/

params ["_pos"];

private _allMines = allMines;

private _distance = INFINITE_DISTANCE;
private _nearestMine = objNull;

{
	private _minePos = getPos _x;
	private _checkDistance = _minePos distance2d _pos;
	if (_checkDistance < _distance) then {
		_nearestMine = _x;
		_distance = _checkDistance;
	};
} forEach _allMines;

_nearestMine
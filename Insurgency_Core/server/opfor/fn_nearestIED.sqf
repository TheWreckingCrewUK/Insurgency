#include "..\..\includes\script_component.hpp"

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
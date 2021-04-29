#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Gets all nearby cached enemies within given radius from given position.
*
* Arguments:
* 0: Radius <NUMBER>
* 1: Position <ARRAY>
*
* Return Value:
* [Enemies] <ARRAY>
*
* Example:
* [_radius, _pos] call TWC_Insurgency_OPFOR_fnc_nearbyEnemies;
*/

params ["_radius", "_center"];

private _allEnemies = TWC_Insurgency_troopsOPFOR;

private _nearbyEnemies = [];
{
	_x params ["_pos", "_troops"];
	if (_pos distance2d _center < _radius) then {
		_nearbyEnemies pushBack _x;
	};
} forEach _allEnemies;

_nearbyEnemies
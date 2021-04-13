#include "..\..\includes\script_component.hpp"

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
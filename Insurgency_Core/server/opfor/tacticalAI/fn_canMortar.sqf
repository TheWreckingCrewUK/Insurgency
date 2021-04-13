#include "..\..\..\includes\script_component.hpp"

params ["_group"];

if (count waypoints _group > 1) exitWith {false};
private _hasMortar = false;
{
	if (vehicle _x isKindOf "StaticMortar") exitWith {
		_hasMortar = true;
	};
} forEach (units _group);

_hasMortar
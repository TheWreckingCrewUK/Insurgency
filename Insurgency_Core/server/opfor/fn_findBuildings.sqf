#include "..\..\includes\script_component.hpp"

params ["_pos", "_minimum"];

private _buildings = _pos nearObjects ["Building", 500];
_buildings select {
	private _positions = _x buildingPos -1;
	count _positions >= _minimum;
};

_buildings
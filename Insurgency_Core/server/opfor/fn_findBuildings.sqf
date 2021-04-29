#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Find all buildings of a certain quality.
*
* Arguments:
* 0: Position <ARRAY>
* 1: Quality <NUMBER>
*
* Return Value:
* Buildings <ARRAY>
*
* Example:
* [_pos, 2] call TWC_Insurgency_OPFOR_fnc_findBuildings;
*/

params ["_pos", "_minimum"];

private _buildings = _pos nearObjects ["Building", 500];
_buildings select {
	private _positions = _x buildingPos -1;
	count _positions >= _minimum;
};

_buildings
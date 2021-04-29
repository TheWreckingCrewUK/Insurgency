#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Caches a group.
*
* Arguments:
* 0: Enemy Group <GROUP>
*
* Return Value:
* NONE
*
* Example:
* [_group] call TWC_Insurgency_OPFOR_fnc_cacheGroup;
*/

params ["_group"];

private _pos = getPos (leader _group);

private _types = [];
{
	_types pushBack (typeOf _x);
} forEach (units _group);

TWC_Insurgency_troopsOPFOR pushBack [_pos, _types];

{
	if (vehicle _x != _x) then {
		deleteVehicle (vehicle _x);
	};
	deleteVehicle _x;
} forEach units _group;

deleteGroup _group;
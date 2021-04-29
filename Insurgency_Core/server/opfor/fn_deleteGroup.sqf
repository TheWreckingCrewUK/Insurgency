#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Delete a group.
*
* Arguments:
* 0: Enemy Group <GROUP>
*
* Return Value:
* NONE
*
* Example:
* [_group] call TWC_Insurgency_OPFOR_fnc_deleteGroup;
*/

params ["_group"];

{
	deleteVehicle _x;
} forEach units _group;

deleteGroup _group;
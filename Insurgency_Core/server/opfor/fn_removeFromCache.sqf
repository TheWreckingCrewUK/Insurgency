#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Removes OPFOR Units at position from cache.
*
* Arguments:
* 0: Position <ARRAY>
*
* Return Value:
* NONE
*
* Example:
* [_pos] call TWC_Insurgency_OPFOR_fnc_removeFromCache;
*/

params ["_pos"];

private _index = TWC_Insurgency_troopsOPFOR findIf {
	_x params ["_troopPos", "_troops"];
	_troopPos isEqualTo _pos
};

TWC_Insurgency_troopsOPFOR deleteAt _index;
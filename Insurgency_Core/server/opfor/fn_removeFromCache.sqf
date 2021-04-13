#include "..\..\includes\script_component.hpp"

params ["_pos"];

private _index = TWC_Insurgency_troopsOPFOR findIf {
	_x params ["_troopPos", "_troops"];
	_troopPos isEqualTo _pos
};

TWC_Insurgency_troopsOPFOR deleteAt _index;
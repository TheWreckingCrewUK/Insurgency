#include "..\..\includes\script_component.hpp"

params ["_target", "_player", "_type"];

private _cost = [_type] call TWC_Insurgency_bluforActions_fnc_getAmmoCost;

TWC_Insurgency_supplyBLUFOR >= _cost
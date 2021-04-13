#include "..\..\includes\script_component.hpp"

params ["_target", "_player", "_type"];

private _cost = [_type] call TWC_Insurgency_Actions_fnc_getVehicleCost;

TWC_Insurgency_supplyBLUFOR >= _cost
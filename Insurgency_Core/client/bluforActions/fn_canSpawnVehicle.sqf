#include "..\..\includes\script_component.hpp"

params ["_target", "_player", "_typeInfo"];

_typeInfo params ["_type", "_category"];

private _cost = getNumber (missionConfigFile >> "CfgTransport" >> _category >> _type >> "cost");

TWC_Insurgency_supplyBLUFOR >= _cost
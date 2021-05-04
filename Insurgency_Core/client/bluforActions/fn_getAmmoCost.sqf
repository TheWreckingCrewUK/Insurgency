#include "..\..\includes\script_component.hpp"

params ["_type"];

private _cost = getNumber (missionConfigFile >> "CfgAmmoboxes" >> _type >> "cost");

_cost
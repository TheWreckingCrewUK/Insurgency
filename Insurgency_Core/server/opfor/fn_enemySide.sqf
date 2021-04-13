#include "..\..\includes\script_component.hpp"

private _enemySide = getNumber (missionConfigFile >> "TWC_Insurgency" >> "enemySide");
_enemySide = _enemySide call BIS_fnc_sideType;
_enemySide
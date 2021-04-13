#include "..\..\includes\script_component.hpp"

private _friendlySide = getNumber (missionConfigFile >> "TWC_Insurgency" >> "friendlySide");
_friendlySide = _friendlySide call BIS_fnc_sideType;
_friendlySide
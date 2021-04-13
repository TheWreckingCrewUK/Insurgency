#include "..\..\includes\script_component.hpp"

private _playerside = getNumber (missionConfigFile >> "TWC_Insurgency" >> "playerSide");
_playerside = _playerside call BIS_fnc_sideType;
_playerside
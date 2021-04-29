#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Gets the player side from mission config.
*
* Arguments:
* NONE
*
* Return Value:
* Player Side <SIDE>
*
* Example:
* call TWC_Insurgency_BLUFOR_fnc_playerSide;
*/

private _playerside = getNumber (missionConfigFile >> "TWC_Insurgency" >> "playerSide");
_playerside = _playerside call BIS_fnc_sideType;
_playerside
#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Get the mission defined enemy side.
*
* Arguments:
* NONE
*
* Return Value:
* Enemy Side <SIDE>
*
* Example:
* call TWC_Insurgency_OPFOR_fnc_enemySide;
*/

private _enemySide = getNumber (missionConfigFile >> "TWC_Insurgency" >> "enemySide");
_enemySide = _enemySide call BIS_fnc_sideType;
_enemySide
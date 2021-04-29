#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Saves the game on a loop.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Save_fnc_save;
*/

saveGame;

[{call TWC_Insurgency_Save_fnc_save}, [], 300] call CBA_fnc_waitAndExecute;

DEBUG_LOG("Mission Saved");
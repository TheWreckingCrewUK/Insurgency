#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Changes the OPFOR Manpower by given change.
*
* Arguments:
* 0: Change <NUMBER>
*
* Return Value:
* NONE
*
* Example:
* [_change] call TWC_Insurgency_OPFOR_fnc_updateManpower;
*/

params ["_change"];

TWC_Insurgency_manpowerOPFOR = (TWC_Insurgency_manpowerOPFOR + _change) max 0;

["TWC_Insurgency_Save_save", []] call CBA_fnc_serverEvent;

["TWC_Insurgency_Save_checkVictory", []] call CBA_fnc_serverEvent;
#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Changes the OPFOR Supply by given change.
*
* Arguments:
* 0: Change <NUMBER>
*
* Return Value:
* NONE
*
* Example:
* [_change] call TWC_Insurgency_OPFOR_fnc_updateSupply;
*/

params ["_change"];

TWC_Insurgency_supplyOPFOR = (TWC_Insurgency_supplyOPFOR + _change) max 0;

["TWC_Insurgency_Save_checkVictory", []] call CBA_fnc_serverEvent;
#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Modifies BLUFOR supply by given change and broadcasts it to players.
*
* Arguments:
* 0: Change <NUMBER>
*
* Return Value:
* NONE
*
* Example:
* [-5] call TWC_Insurgency_BLUFOR_fnc_updateSupply;
*/

params ["_change"];

private _supply = TWC_Insurgency_supplyBLUFOR;
_supply = _supply + _change;

if (_supply < 0) then {
	"Defeat" call BIS_fnc_endMissionServer;
};

["TWC_Insurgency_Save_save", []] call CBA_fnc_serverEvent;

TWC_Insurgency_supplyBLUFOR = _supply max 0;

["TWC_Insurgency_Actions_getSupply", _supply] call CBA_fnc_globalEvent;
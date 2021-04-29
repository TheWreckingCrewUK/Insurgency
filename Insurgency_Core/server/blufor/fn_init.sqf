#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Initializes BLUFOR tasks, handlers and global variables on init.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_BLUFOR_fnc_init;
*/

if (!isServer) exitWith {DEBUG_LOG("BLUFOR Init not executed on client.")};

TWC_Insurgency_supplyBLUFOR = getNumber (missionConfigFile >> "TWC_Insurgency" >> "supplyBLUFOR");

TWC_Insurgency_PatrolBases = [];

private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, "bluforTasks", "bluforTasks", objNull, "CREATED", -1, false, "whiteboard", false] call BIS_fnc_taskCreate;

for "_i" from 1 to 3 do {
	[{
		["bluforTasks", str _this] call TWC_Insurgency_BLUFOR_fnc_taskCreate;
	}, _i, 2] call CBA_fnc_waitAndExecute;
};

["TWC_Insurgency_BLUFOR_playerDeath", {
	[-10] call TWC_Insurgency_BLUFOR_fnc_updateSupply;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_BLUFOR_goodRecovery", {
	_this call TWC_Insurgency_BLUFOR_fnc_goodRecovery;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_BLUFOR_updateSupply", {
	_this call TWC_Insurgency_BLUFOR_fnc_updateSupply;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_BLUFOR_createPatrolBase", {
	_this call TWC_Insurgency_BLUFOR_fnc_createPatrolBase;
}] call CBA_fnc_addEventHandler;

//We need to resync BLUFOR supply to respawning players so that new players get the current supply.
addMissionEventHandler ["EntityRespawned", {
	params ["_entity", "_corpse"];
	["TWC_Insurgency_Actions_getSupply", TWC_Insurgency_supplyBLUFOR, _entity] call CBA_fnc_targetEvent;
}];

DEBUG_LOG("BLUFOR Init Complete");
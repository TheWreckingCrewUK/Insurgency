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

TWC_Insurgency_playerInit = false;

TWC_Insurgency_supplyBLUFOR = getNumber (missionConfigFile >> "TWC_Insurgency" >> "supplyBLUFOR");

TWC_Insurgency_PatrolBases = [];

private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, "bluforTasks", "bluforTasks", objNull, "CREATED", -1, false, "whiteboard", false] call BIS_fnc_taskCreate;

//Do not execute task creation until a player has been initialised, because at mission creation the players are not JIP and therefore won't receive events from the mission creation when they're not objects themselves, I think.
[{TWC_Insurgency_playerInit}, {
	for "_i" from 1 to 3 do {
		["bluforTasks", str _i] spawn TWC_Insurgency_BLUFOR_fnc_taskCreate;
	};
}] call CBA_fnc_waitUntilAndExecute;

["TWC_Insurgency_playerInit", {
	params ["_player"];
	
	TWC_Insurgency_playerInit = true;
	
	_player setVariable ["TWC_Insurgency_spawnCount", 0];
}] call CBA_fnc_addEventHandler;

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

//Deduct supply in case of player death.
addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (isPlayer _unit) then {
		private _spawnCount = _player getVariable ["TWC_Insurgency_spawnCount", 0];
		_player setVariable ["TWC_Insurgency_spawnCount", _spawnCount + 1];
		
		if (_spawnCount > 1) then {
			[-1] call TWC_Insurgency_BLUFOR_fnc_updateSupply;
		};
	};
}];

DEBUG_LOG("BLUFOR Init Complete");
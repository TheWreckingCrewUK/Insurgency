#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Generates a Recover Vehicle Task.
*
* Arguments:
* 0: Parent Task ID <STRING>
* 1: Task ID <STRING>
*
* Return Value:
* NONE
*
* Example:
* ["1", "bluforTasks"] call TWC_Insurgency_BLUFOR_fnc_taskRecoverVehicle;
*/

params ["_parentTask", "_taskNumber"];

//Lets spawn the vehicle in the neighbourhood of a town, near a road
private _spawnPos = [2000] call TWC_Insurgency_Locations_fnc_randomLocationASL;

//Select a vehicle from the settings
private _vehicleType = selectRandom ("true" configClasses (missionConfigFile >> "CfgTransport" >> "Cars"));
_vehicleType = configName _vehicleType;

//Spawn in the vehicle, make it a little more challenging to get out
private _vehicle = createVehicle [_vehicleType, [0,0,0]];
_vehicle setPosASL _spawnPos;
_vehicle setFuel (random 0.5);
_vehicle setDamage (random 0.5);

//We want the vehicle to know what task it belongs to for when we complete or fail it
_vehicle setVariable ["TWC_Insurgency_BLUFOR_Task", _taskNumber];

//If OPFOR hijacks the vehicle, we fail the task
_vehicle addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	
	_enemySide = call TWC_Insurgency_OPFOR_fnc_enemySide;
	if (side _unit == _enemySide) then {
		_task = _vehicle getVariable ["TWC_Insurgency_BLUFOR_Task", ""];
		[_task] call TWC_Insurgency_BLUFOR_fnc_taskFail;
	};
}];

//If the vehicle blows up, we fail the task
_vehicle addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_task = _unit getVariable ["TWC_Insurgency_BLUFOR_Task", ""];
	[_task] call TWC_Insurgency_BLUFOR_fnc_taskFail;
}];

//Cancel the task if he is deleted
_vehicle addEventHandler ["Deleted", {
	params ["_vehicle"];
	_task = _vehicle getVariable ["TWC_Insurgency_BLUFOR_Task", ""];
	[_task] call TWC_Insurgency_BLUFOR_fnc_taskCancelled;
}];

private _jipID = ["TWC_Insurgency_Actions_recover", _vehicle] call CBA_fnc_globalEventJIP;
[_jipID, _vehicle] call CBA_fnc_removeGlobalEventJIP;

private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;

[_playerside, [_taskNumber, _parentTask], "recoverVehicle", _spawnPos, "CREATED", -1, false, "car", false] call BIS_fnc_taskCreate;

//Fire an event to let the OPFOR Commander know we've spawned a task.
["TWC_Insurgency_OPFOR_spawnTask", [_spawnPos]] call CBA_fnc_serverEvent;

DEBUG_LOG("Recover Vehicle Task Created");
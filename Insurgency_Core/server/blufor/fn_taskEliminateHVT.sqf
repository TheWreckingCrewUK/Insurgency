#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Generates an Eliminate HVT Task.
*
* Arguments:
* 0: Parent Task ID <STRING>
* 1: Task ID <STRING>
*
* Return Value:
* NONE
*
* Example:
* ["1", "bluforTasks"] call TWC_Insurgency_BLUFOR_fnc_taskEliminateHVT;
*/

params ["_parentTask", "_taskNumber"];

//Pick a random spot in town
private _spawnPos = [300] call TWC_Insurgency_Locations_fnc_randomLocationASL;

//Fetch spawn information from settings
private _warlordType = getText (missionConfigFile >> "TWC_Insurgency" >> "warlord");
private _enemySide = call TWC_Insurgency_OPFOR_fnc_enemySide;

private _group = [[0,0,0], _enemySide, [_warlordType]] call BIS_fnc_spawnGroup;

//Set the task so we know what to complete
private _warlord = leader _group;
_warlord setPosASL _spawnPos;
_warlord setVariable ["TWC_Insurgency_BLUFOR_Task", _taskNumber];

//Create the task
private _playerSide = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, [_taskNumber, _parentTask], "eliminateHVT", _spawnPos, "CREATED", -1, false, "kill", false] call BIS_fnc_taskCreate;

//Succeed if killed
_warlord addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	private _task = _unit getVariable ["TWC_Insurgency_BLUFOR_Task", ""];
	[_task] call TWC_Insurgency_BLUFOR_fnc_taskSucceed;
}];

//Cancel the task if he is deleted
_warlord addEventHandler ["Deleted", {
	params ["_unit"];
	if (damage _unit isEqualTo 1) exitWith {DEBUG_LOG("Warlord task already complete, no cancel necessary.")};
	private _task = _unit getVariable ["TWC_Insurgency_BLUFOR_Task", ""];
	[_task] call TWC_Insurgency_BLUFOR_fnc_taskCancelled;
}];

//Allow him to be recovered if players drag him bag to base in cuffs
private _jipID = ["TWC_Insurgency_Actions_recover", _warlord] call CBA_fnc_globalEventJIP;
[_jipID, _warlord] call CBA_fnc_removeGlobalEventJIP;

//Fire an event to let the OPFOR Commander know we've spawned a task.
["TWC_Insurgency_OPFOR_spawnTask", [_spawnPos]] call CBA_fnc_serverEvent;

DEBUG_LOG("Eliminate HVT Task Created");
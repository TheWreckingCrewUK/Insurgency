#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Generates a HVT Task.
*
* Arguments:
* 0: Location <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_location] call TWC_Insurgency_Locations_fnc_taskHVT;
*/

params ["_location"];

//Get a new task ID.
private _taskID = call TWC_Insurgency_Locations_fnc_taskID;
_location setVariable ["TWC_Insurgency_Locations_task", _taskID select 0];

//Pick a random spot in town
private _spawnPos = [300] call TWC_Insurgency_Locations_fnc_randomLocationASL;

//Fetch spawn information from settings
private _warlordType = getText (missionConfigFile >> "TWC_Insurgency" >> "warlord");
private _enemySide = call TWC_Insurgency_OPFOR_fnc_enemySide;

private _group = [[0,0,0], _enemySide, [_warlordType]] call BIS_fnc_spawnGroup;

//Set the task so we know what to complete
private _warlord = leader _group;
_warlord setPosASL _spawnPos;
_warlord setVariable ["TWC_Insurgency_Locations_Task", _taskID select 0];
_warlord setVariable ["TWC_Insurgency_Locations_Location", _location];

//Create the task
private _playerSide = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, _taskID, "stopHVT", _spawnPos, "CREATED", -1, false, "kill", false] call BIS_fnc_taskCreate;

//Succeed if killed
_warlord addEventHandler ["Killed", {
	params ["_warlord", "_killer", "_instigator", "_useEffects"];
	
	private _location = _warlord getVariable ["TWC_Insurgency_Locations_Location", nearestLocation [getPos _warlord, ""]];
	
	private _taskID = _warlord getVariable ["TWC_Insurgency_Locations_Task", ""];
	
	[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
	
	private _reward = [_taskID] call TWC_Insurgency_Locations_fnc_taskReward;
	[_location, _reward] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
	
	_location setVariable ["TWC_Insurgency_Locations_task", nil];
	
	DEBUG_LOG("Task HVT Complete");
}];

//Cancel the task if he is deleted
_warlord addEventHandler ["Deleted", {
	params ["_unit"];
	
	if (damage _unit isEqualTo 1) exitWith {DEBUG_LOG("Warlord task already complete, no cancel necessary.")};
	
	private _taskID = _unit getVariable ["TWC_Insurgency_Locations_Task", ""];
	
	[_taskID, "CANCELED", false] call BIS_fnc_taskSetState;
	
	_location setVariable ["TWC_Insurgency_Locations_task", nil];
	
	DEBUG_LOG("Task HVT Canceled");
}];

//Allow him to be recovered if players drag him bag to base in cuffs
private _jipID = ["TWC_Insurgency_Actions_recover", _warlord] call CBA_fnc_globalEventJIP;
[_jipID, _warlord] call CBA_fnc_removeGlobalEventJIP;

//Fire an event to let the OPFOR Commander know we've spawned a task.
["TWC_Insurgency_OPFOR_spawnTask", [_spawnPos]] call CBA_fnc_serverEvent;

DEBUG_LOG("Stop HVT Task Created");
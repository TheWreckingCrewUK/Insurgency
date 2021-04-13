#include "..\..\includes\script_component.hpp"

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
	private _task = _unit getVariable ["TWC_Insurgency_BLUFOR_Task", ""];
	[_task] call TWC_Insurgency_BLUFOR_fnc_taskCanceled;
}];

//Allow him to be recovered if players drag him bag to base in cuffs
["TWC_Insurgency_Actions_recover", _warlord] call CBA_fnc_globalEventJIP;

DEBUG_LOG("Eliminate HVT Task Created");
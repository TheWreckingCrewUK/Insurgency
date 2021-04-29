#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Succesfully completes a BLUFOR task, generating a new one.
*
* Arguments:
* 0: Task ID <STRING>
*
* Return Value:
* NONE
*
* Example:
* ["1"] call TWC_Insurgency_BLUFOR_fnc_taskSucceed;
*/

params ["_taskNumber"];

[_taskNumber, "SUCCEEDED", false] call BIS_fnc_taskSetState;

private _taskTitle = (_taskNumber call BIS_fnc_taskDescription) select 1;
private _tasksList = "getNumber (_x >> 'blufor') == 1" configClasses (missionConfigFile >> "CfgTaskDescriptions");
_tasksList select {
	getText (_x >> "title") isEqualTo _taskTitle;
};
private _taskType = configName (_tasksList select 0);

private _reward = getNumber (missionConfigFile >> "CfgTaskDescriptions" >> _taskType >> "reward");
[_reward] call TWC_Insurgency_BLUFOR_fnc_updateSupply;

private _newID = [_taskNumber] call TWC_Insurgency_BLUFOR_fnc_taskID;
[{
	_this call TWC_Insurgency_BLUFOR_fnc_taskCreate;
}, _newID, 5] call CBA_fnc_waitAndExecute;

DEBUG_LOG("BLUFOR Task Succeeded");
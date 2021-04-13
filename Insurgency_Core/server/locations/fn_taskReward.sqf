#include "..\..\includes\script_component.hpp"

params ["_task"];

private _taskTitle = ((_task call BIS_fnc_taskDescription) select 1) select 0;
private _tasksList = "getNumber (_x >> 'blufor') == 0" configClasses (missionConfigFile >> "CfgTaskDescriptions");
_tasksList = _tasksList select {
	getText (_x >> "title") isEqualTo _taskTitle;
};
private _taskType = configName (_tasksList select 0);

private _reward = getNumber (missionConfigFile >> "CfgTaskDescriptions" >> _taskType >> "reward");

_reward
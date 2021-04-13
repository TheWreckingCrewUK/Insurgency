#include "..\..\includes\script_component.hpp"

params ["_parentTask", "_taskNumber"];

DEBUG_LOG("Creating BLUFOR task with ID " + _taskNumber);

private _tasksList = "getNumber (_x >> 'blufor') == 1" configClasses (missionConfigFile >> "CfgTaskDescriptions");
private _task = selectRandom _tasksList;
_task = configName _task;

switch (_task) do {
	case "rescuePilot": {[_parentTask, _taskNumber] call TWC_Insurgency_BLUFOR_fnc_taskRescuePilot};
	case "rescueJournalist": {[_parentTask, _taskNumber] call TWC_Insurgency_BLUFOR_fnc_taskRescueJournalist};
	case "pacifyRegion": {[_parentTask, _taskNumber] call TWC_Insurgency_BLUFOR_fnc_taskPacifyRegion};
	case "recoverVehicle": {[_parentTask, _taskNumber] call TWC_Insurgency_BLUFOR_fnc_taskRecoverVehicle};
	case "eliminateHVT": {[_parentTask, _taskNumber] call TWC_Insurgency_BLUFOR_fnc_taskEliminateHVT};
};
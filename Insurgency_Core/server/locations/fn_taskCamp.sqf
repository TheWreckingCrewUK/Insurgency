#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Generates a Camp Task.
*
* Arguments:
* 0: Location <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_location, _camp] call TWC_Insurgency_Locations_fnc_taskCamp;
*/

params ["_location", "_camp"];

private _taskID = call TWC_Insurgency_Locations_fnc_taskID;
_location setVariable ["TWC_Insurgency_Locations_task", _taskID select 0];

//Eventhandler on the destruction of the camp.
["TWC_Insurgency_Locations_campDeath", {
	_this params ["_camp"];
	_thisArgs params ["_location"];
	
	private _taskID = _location getVariable ["TWC_Insurgency_Locations_task", ""];
	
	if (_taskID isEqualTo "") exitWith {DEBUG_LOG(text _location + " has no task for this")};
	
	[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
	
	private _reward = [_taskID] call TWC_Insurgency_Locations_fnc_taskReward;
	[_location, _reward] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
	
	//Clean up eventhandlers/variables.
	_location setVariable ["TWC_Insurgency_Locations_task", nil];
	["TWC_Insurgency_Locations_campDeath", _thisId] call CBA_fnc_removeEventHandler;
	
	DEBUG_LOG("Task Camp Complete");
}, [_location]] call CBA_fnc_addEventHandlerArgs;

//Create the task.
private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, _taskID, "camp", _locationPos, "CREATED", -1, false, "destroy", false] call BIS_fnc_taskCreate;

DEBUG_LOG("Task Camp Created");
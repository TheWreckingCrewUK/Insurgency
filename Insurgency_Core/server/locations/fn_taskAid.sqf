#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Generates an Aid Task.
*
* Arguments:
* 0: Location <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_location] call TWC_Insurgency_Locations_fnc_taskAid;
*/

params ["_location"];

private _locationPos = locationPosition _location;

//Eventhandler for handing over the crate.
["TWC_Insurgency_Locations_giveCrate", {
	params ["_crate"];
	
	private _location = [getPos _crate] call TWC_Insurgency_Locations_fnc_nearestLocation;
	
	private _taskID = _location getVariable ["TWC_Insurgency_Locations_task", ""];
	
	if (_taskID isEqualTo "") exitWith {DEBUG_LOG(text _location + " has no task for this")};
	
	[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
	
	private _reward = [_taskID] call TWC_Insurgency_Locations_fnc_taskReward;
	[_location, _reward] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
	
	deleteVehicle _crate;
	
	_location setVariable ["TWC_Insurgency_Locations_task", nil];
	
	DEBUG_LOG("Task Aid Complete");
}] call CBA_fnc_addEventHandler;

private _taskID = call TWC_Insurgency_Locations_fnc_taskID;
_location setVariable ["TWC_Insurgency_Locations_task", _taskID select 0];

//Create the task.
private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, _taskID, "aid", _locationPos, "CREATED", -1, false, "container", false] call BIS_fnc_taskCreate;

DEBUG_LOG("Task Aid Created");
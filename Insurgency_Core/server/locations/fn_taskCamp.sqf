#include "..\..\includes\script_component.hpp"

params ["_location", "_camp"];

private _taskID = call TWC_Insurgency_Locations_fnc_taskID;
missionNameSpace setVariable [_camp + "_task", _taskID];

//Eventhandler on the destruction of the camp.
["TWC_Insurgency_Locations_campDeath", {
	_this params ["_camp"];
	_thisArgs params ["_location"];
	
	private _taskDetails = missionNameSpace getVariable [_camp + "_task", ""];
	
	if (count _taskDetails < 1) exitWith {DEBUG_LOG(text _location + " has no task for this")};
	_taskDetails params ["_taskID", "_parentTask"];
	
	[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
	
	private _reward = [_taskID] call TWC_Insurgency_Locations_fnc_taskReward;
	[_location, _reward] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
	
	//Clean up eventhandlers/variables.
	missionNameSpace setVariable [text _location + "_task", nil];
	["TWC_Insurgency_Locations_campDeath", _thisId] call CBA_fnc_removeEventHandler;
	
	DEBUG_LOG("Task Camp Complete");
}, [_location]] call CBA_fnc_addEventHandlerArgs;

//Create the task.
private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, _taskID, "camp", _locationPos, "CREATED", -1, false, "destroy", false] call BIS_fnc_taskCreate;
#include "..\..\includes\script_component.hpp"

params ["_location"];

private _locationPos = locationPosition _location;

//Eventhandler for handing over the crate.
["TWC_Insurgency_Locations_giveCrate", {
	params ["_crate"];
	
	private _location = [getPos _crate] call TWC_Insurgency_Locations_fnc_nearestLocation;
	
	private _taskDetails = missionNameSpace getVariable [text _location + "_task", []];
	
	if (count _taskDetails < 1) exitWith {DEBUG_LOG(text _location + " has no task for this")};
	_taskDetails params ["_taskID", "_parentTask"];
	
	[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
	
	private _reward = [_taskID] call TWC_Insurgency_Locations_fnc_taskReward;
	[_location, _reward] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
	
	deleteVehicle _crate;
	
	missionNameSpace setVariable [text _location + "_task", nil];
	
	DEBUG_LOG("Task Aid Complete");
}] call CBA_fnc_addEventHandler;

private _taskID = call TWC_Insurgency_Locations_fnc_taskID;
missionNameSpace setVariable [text _location + "_task", _taskID];

//Create the task.
private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, _taskID, "aid", _locationPos, "CREATED", -1, false, "container", false] call BIS_fnc_taskCreate;
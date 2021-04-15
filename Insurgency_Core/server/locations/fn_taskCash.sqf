#include "..\..\includes\script_component.hpp"

params ["_location"];

private _locationPos = locationPosition _location;

private _taskID = call TWC_Insurgency_Locations_fnc_taskID;
missionNameSpace setVariable [text _location + "_task", _taskID];

//Add action to give cash to elder now.
private _locationGroups = (missionNameSpace getVariable [text _location, []]) select 0;
_locationGroups params ["_elderGroup", "_civGroup"];
["TWC_Insurgency_Actions_taskCash", [_elderGroup]] call CBA_fnc_globalEventJIP;

//Add an eventhandler for elder spawn to add an action to give cash.
private _actionEventID = ["TWC_Insurgency_Actions_elderSpawn", {
	params ["_elderGroup"];
	_thisArgs params ["_taskID", "_taskLocation"];
	
	private _spawnedLocation = _elderGroup getVariable ["TWC_Insurgency_Location", locationNull];
	
	if (_taskLocation isEqualTo _spawnedLocation) then {
		["TWC_Insurgency_Actions_taskCash", [_elderGroup]] call CBA_fnc_globalEventJIP;
		DEBUG_LOG("Task Cash Added Elder Action");
	};
}, [_taskID select 0, _location]] call CBA_fnc_addEventHandlerArgs;

//Eventhandler for giving the cash.
["TWC_Insurgency_Locations_taskCash", {
	params ["_taskLocation", "_player", "_elder"];
	_thisArgs params ["_taskID", "_location", "_actionEventID"];
	
	[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
	
	private _reward = [_taskID] call TWC_Insurgency_Locations_fnc_taskReward;
	[_location, _reward] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
	
	//Remove action from elder.
	["TWC_Insurgency_Actions_taskCashRemove", [group _elder]] call CBA_fnc_globalEventJIP;
	
	//Event and variable clean-up.
	missionNameSpace setVariable [text _location + "_task", nil];
	["TWC_Insurgency_Locations_taskDispute", _thisId] call CBA_fnc_removeEventHandler;
	["TWC_Insurgency_Actions_elderSpawn", _actionEventID] call CBA_fnc_removeEventHandler;
	
	DEBUG_LOG("Task Dispute Complete");
}, [_taskID select 0, _location, _actionEventID]] call CBA_fnc_addEventHandlerArgs;

//Create the task.
private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, _taskID, "cash", _locationPos, "CREATED", -1, false, "box", false] call BIS_fnc_taskCreate;

DEBUG_LOG("Task Camp Created");
#include "..\..\includes\script_component.hpp"

params ["_location"];

private _locationPosition = locationPosition _location;

private _possibleLocations = TWC_Insurgency_Locations select {
	private _testLocation = _x select 0;
	private _testPos = locationPosition _testLocation;
	(_locationPosition distance2d _testPos < 5000) && (_location isNotEqualTo _testLocation) && !(_x select 1)
};

private _taskLocation = (selectRandom _possibleLocations) select 0;
private _taskPos = locationPosition _taskLocation;

private _taskID = call TWC_Insurgency_Locations_fnc_taskID;
missionNameSpace setVariable [text _location + "_task", _taskID];

//Add an eventhandler for elder spawn to add an action to speak to the elder about the dispute.
private _actionEventID = ["TWC_Insurgency_Actions_elderSpawn", {
	params ["_elderGroup"];
	_thisArgs params ["_taskID", "_taskLocation"];
	
	private _spawnedLocation = _elderGroup getVariable ["TWC_Insurgency_Location", locationNull];
	
	if (_taskLocation isEqualTo _spawnedLocation) then {
		["TWC_Insurgency_Actions_taskDispute", [_elderGroup]] call CBA_fnc_globalEventJIP;
		DEBUG_LOG("Task Dispute Added Elder Action");
	};
}, [_taskID select 0, _taskLocation]] call CBA_fnc_addEventHandlerArgs;

//Eventhandler for the result of the dispute.
["TWC_Insurgency_Locations_taskDispute", {
	params ["_taskLocation", "_player", "_elder"];
	_thisArgs params ["_taskID", "_location", "_actionEventID"];
	
	private _locationInfo = [_taskLocation] call TWC_Insurgency_Locations_fnc_getInfo;
	_locationInfo params ["_locationDetails", "_locationIndex"];
	_locationDetails params ["_taskLocation", "_isStronghold", "_hasCache", "_allegiance"];
	
	//Chance of success in the talks depends on the allegiance of the village we're talking to; 100% chance at full allegiance and 0% chance at no allegiance.
	private _success = random 1 > (1 - _allegiance / 100);
	
	private _message = "This message shouldn't be returned, and if it did you should Rik he is a moron.";
	
	if (_success) then {
		[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
		
		private _reward = [_taskID] call TWC_Insurgency_Locations_fnc_taskReward;
		[_location, _reward] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
		
		_message = "We have also tired of the fighting. I will agree to peace.";
		
		DEBUG_LOG("Task Dispute Complete");
	} else {
		[_taskID, "FAILED", false] call BIS_fnc_taskSetState;
		
		_message = "The scoundrels that sent you here will never be forgiven for the injustices they have committed!";
		
		DEBUG_LOG("Task Dispute Failed");
	};
	
	//Remove action from elder.
	["TWC_Insurgency_Actions_taskDisputeRemove", [group _elder]] call CBA_fnc_globalEventJIP;
	
	//Return the message to the player doing the talking.
	["TWC_Insurgency_Locations_taskDisputeResult", [_message], _player] call CBA_fnc_targetEvent;
	
	//Event and variable clean-up.
	missionNameSpace setVariable [text _location + "_task", nil];
	["TWC_Insurgency_Locations_taskDispute", _thisId] call CBA_fnc_removeEventHandler;
	["TWC_Insurgency_Actions_elderSpawn", _actionEventID] call CBA_fnc_removeEventHandler;
}, [_taskID select 0, _location, _actionEventID]] call CBA_fnc_addEventHandlerArgs;

//Create the task.
private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, _taskID, "dispute", _taskPos, "CREATED", -1, false, "talk", false] call BIS_fnc_taskCreate;
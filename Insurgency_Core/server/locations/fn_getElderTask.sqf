#include "..\..\includes\script_component.hpp"

params ["_player", "_elderGroup"];

//Determine what location we're talking about from the elder, stored in townActivate.
private _location = _elderGroup getVariable ["TWC_Insurgency_Location", locationNull];

//Check for any active tasks, only one per town at a time.
private _activeTask = _location getVariable ["TWC_Insurgency_Locations_task", ""];
if (_activeTask isNotEqualTo "") exitWith {
	["TWC_Insurgency_Actions_getElderTask", ["Please take care of what we asked before."], _player] call CBA_fnc_targetEvent;
	DEBUG_LOG(text _location + " already has active civ task")
};

//Get location information.
private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task"];
_locationPos = locationPosition _location;

//No point in doing tasks for a town that is already 100% friendly.
if (_allegiance isEqualTo 100) exitWith {
	["TWC_Insurgency_Actions_getElderTask", ["We do not need your help for now, friends."], _player] call CBA_fnc_targetEvent;
	DEBUG_LOG(text _location + " already fully friendly.")
};

//These tasks are always available.
private _tasks = ["aid", "hvt", "dispute"];

//These tasks are conditional.
private _nearestIED = [_locationPos] call TWC_Insurgency_OPFOR_fnc_nearestIED;
if (_nearestIED distance _locationPos < 1000) then {_tasks pushBack "ied"};

private _nearestCamp = [_locationPos] call TWC_Insurgency_OPFOR_fnc_nearestCamp;
private _campPos = getMarkerPos _nearestCamp;
if ((_campPos distance _locationPos < 2000) && (_campPos isNotEqualTo [0,0,0])) then {_tasks pushBack "camp"};

if (isClass (configFile >> "CfgPatches" >> "CUP_Weapons_WeaponsCore")) then {_tasks pushBack "cash"};

//Select a random task type from our determined available tasks.
_task = selectRandom _tasks;

//Select the return message based on the task and spawn the task.
private _message = "";
switch _task do {
	case "ied": {
		_message = "Some men have put a bomb on a nearby road, it is a great danger to my people. Could you remove it, please?";
		[_location, _nearestIED] call TWC_Insurgency_Locations_fnc_taskIED;
	};
	case "aid": {
		_message = "My people are starving. In the war, our animals die, our crops fail. We need food!";
		[_location] call TWC_Insurgency_Locations_fnc_taskAid;
	};
	case "hvt": {
		_message = "A wicked man has preyed on the women of my village. Could you make him stop?";
		[_location] call TWC_Insurgency_Locations_fnc_taskHVT;
	};
	case "dispute": {
		_message = "As long as I remember we have had problems with a nearby town. I am sick of the fighting. Could you talk to them on our behalf?";
		[_location] call TWC_Insurgency_Locations_fnc_taskDispute;
	};
	case "cash": {
		_message = "I want a new car, but have not the money to buy one. Could you spare some cash?";
		[_location] call TWC_Insurgency_Locations_fnc_taskCash;
	};
	case "camp": {
		_message = "A group of armed men came in the night and set up camp near our homes. They take our food and steal our wives. Please help us!";
		[_location, _nearestCamp] call TWC_Insurgency_Locations_fnc_taskCamp;
	};
};

//Return the message to the player.
["TWC_Insurgency_Actions_getElderTask", [_message], _player] call CBA_fnc_targetEvent;
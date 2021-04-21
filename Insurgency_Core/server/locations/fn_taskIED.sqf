#include "..\..\includes\script_component.hpp"

params ["_location", "_nearestIED"];

private _iedPos = getPos _nearestIED;

private _taskID = call TWC_Insurgency_Locations_fnc_taskID;
_location setVariable ["TWC_Insurgency_Locations_task", _taskID];

//Eventhandler completing for the defusing.
["ace_explosives_defuse", {
	params ["_explosive", "_player"];
	_thisArgs params ["_IED", "_taskID", "_location"];
	
	if (_explosive isNotEqualTo _IED) exitWith {DEBUG_LOG("IED was not part of task.")};
	
	private _reward = [_taskID] call TWC_Insurgency_Locations_fnc_taskReward;
	
	[_taskID, "SUCCEEDED", false] call BIS_fnc_taskSetState;
	
	[_location, _reward] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
	
	_location setVariable ["TWC_Insurgency_Locations_task", nil];
	["ace_explosives_defuse", _thisId] call CBA_fnc_removeEventHandler;
	
	DEBUG_LOG("Task IED Complete");
}, [_nearestIED, _taskID select 0, _location]] call CBA_fnc_addEventHandlerArgs;

//Eventhandlers failing for the exploding.
["ace_explosives_explodeOnDefuse", {
	params ["_explosive", "_player"];
	_thisArgs params ["_IED", "_taskID", "_location"];
	
	if (_explosive isNotEqualTo _IED) exitWith {DEBUG_LOG("IED was not part of task.")};
	
	[_taskID, "FAILED", false] call BIS_fnc_taskSetState;
	
	_location setVariable ["TWC_Insurgency_Locations_task", nil];
	["ace_explosives_explodeOnDefuse", _thisId] call CBA_fnc_removeEventHandler;
	
	DEBUG_LOG("Task IED Failed");
}, [_nearestIED, _taskID select 0, _location]] call CBA_fnc_addEventHandlerArgs;

//Eventhandler failing for the exploding.
["ace_explosives_detonate", {
	params ["_explosive", "_player"];
	_thisArgs params ["_IED", "_taskID", "_location"];
	
	if (_explosive isNotEqualTo _IED) exitWith {DEBUG_LOG("IED was not part of task.")};
	
	[_taskID, "FAILED", false] call BIS_fnc_taskSetState;
	
	_location setVariable ["TWC_Insurgency_Locations_task", nil];
	["ace_explosives_explodeOnDefuse", _thisId] call CBA_fnc_removeEventHandler;
	
	DEBUG_LOG("Task IED Failed");
}, [_nearestIED, _taskID select 0, _location]] call CBA_fnc_addEventHandlerArgs;

//Create the task
private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, _taskID, "ied", _iedPos, "CREATED", -1, false, "mine", false] call BIS_fnc_taskCreate;

DEBUG_LOG("Task IED Created");
#include "..\..\includes\script_component.hpp"

params ["_location", "_nearestIED"];

private _iedPos = getPos _nearestIED;

private _taskID = call TWC_Insurgency_Locations_fnc_taskID;
_location setVariable ["TWC_Insurgency_Locations_task", _taskID select 0];

//I am now going to make what's called a pro-gamer move;
private _pumpkin = createVehicle ["Land_Pumpkin_01_F", [0,0,0]];
_pumpkin setPos _iedPos;
hideObjectGlobal _pumpkin;
_pumpkin setVariable ["TWC_Insurgency_Locations_IED", _nearestIED];
_pumpkin setVariable ["TWC_Insurgency_Locations_Task", _taskID select 0];

_pumpkin addEventHandler ["Killed", {
	params ["_pumpkin", "_killer", "_instigator", "_useEffects"];
	
	private _IED = _pumpkin getVariable ["TWC_Insurgency_Locations_IED", objNull];
	
	//Make sure the IED detonates if the pumpkin goes, shouldn't shoot at IEDs anyways, dummy.
	_IED setDamage 1;
	
	["TWC_Insurgency_Locations_taskIED", [_IED]] call CBA_fnc_serverEvent;
}];

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

//Eventhandler failing for exploding in general.
["TWC_Insurgency_Locations_taskIED", {
	params ["_explosive"];
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
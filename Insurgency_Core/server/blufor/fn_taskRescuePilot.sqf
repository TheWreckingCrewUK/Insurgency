#include "..\..\includes\script_component.hpp"

params ["_parentTask", "_taskNumber"];

//Lets spawn the helicopter in the neighbourhood of a town
private _spawnPos = [2000] call TWC_Insurgency_Locations_fnc_randomLocationASL;

//Select a random helicopter from the settings
private _heliType = selectRandom (getArray (missionConfigFile >> "TWC_Insurgency" >> "blufor_helicopters"));

//Spawn in a helicopter and destroy it without cook-off
private _heli = createVehicle [_heliType, [0,0,0]];
_heli setPosASL _spawnPos;
_heli setVariable ["ace_cookoff_enable", false];
_heli setDamage 1;

//Spawn in our pilot and a dead pilot, don't want him to have been lonely
private _pilotType = getText (missionConfigFile >> "TWC_Insurgency" >> "pilot");
private _playerSide = call TWC_Insurgency_BLUFOR_fnc_playerSide;
private _group = [_spawnPos, _playerSide, [_pilotType, _pilotType], [[random 20, random 20, 0],[random 20, random 20, 0]]] call BIS_fnc_spawnGroup;
private _pilot = leader _group;
_pilot setPosASL _spawnPos;
[_pilot, true] call ACE_captives_fnc_setHandcuffed;
_pilot setVariable ["TWC_Insurgency_BLUFOR_Task", _taskNumber];
removeAllWeapons _pilot;

private _deadPilot = ((units _group) select {leader _x != _x}) select 0;
_deadPilot setDamage 1;

//We don't want our pilot to die by the helicopter
_pilot allowDamage false;
[{_this allowDamage true}, _pilot, 10] call CBA_fnc_waitAndExecute;

//Create the task
[_playerside, [_taskNumber, _parentTask], "rescuePilot", _spawnPos, "CREATED", -1, false, "heli", false] call BIS_fnc_taskCreate;

//Failure if pilot killed
_pilot addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_task = _unit getVariable ["TWC_Insurgency_BLUFOR_Task", ""];
	[_task] call TWC_Insurgency_BLUFOR_fnc_taskFail;
}];

//Cancel the task if he is deleted
_pilot addEventHandler ["Deleted", {
	params ["_unit"];
	_task = _unit getVariable ["TWC_Insurgency_BLUFOR_Task", ""];
	[_task] call TWC_Insurgency_BLUFOR_fnc_taskCanceled;
}];

//Add the recovery action on clients
["TWC_Insurgency_Actions_recover", _pilot] call CBA_fnc_globalEventJIP;

DEBUG_LOG("Rescue Pilot Task Created");
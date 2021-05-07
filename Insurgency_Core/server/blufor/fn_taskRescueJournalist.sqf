#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Generates a Rescue Journalist Task.
*
* Arguments:
* 0: Parent Task ID <STRING>
* 1: Task ID <STRING>
*
* Return Value:
* NONE
*
* Example:
* ["1", "bluforTasks"] call TWC_Insurgency_BLUFOR_fnc_taskRescueJournalist;
*/

params ["_parentTask", "_taskNumber"];

//Finding a town where we could put him, don't want him in a friendly town
private _allLocations = TWC_Insurgency_Locations;
private _possibleLocations = [];
{
	_locationInfo = [_x] call TWC_Insurgency_Locations_fnc_getInfo;
	_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task", "_time", "_fsm", "_groups"];
	if (_allegiance < 70) then {_possibleLocations pushBack _x};
} forEach _allLocations;
private _location = selectRandom _possibleLocations;
private _location = locationNull;

//Want to spawn him in a building, hidden and away from prying eyes
private _spawnPos = [];
while {count _spawnPos != 3} do {
	private _randomPos = [[_location]] call BIS_fnc_randomPos;
	private _building = nearestBuilding _randomPos;
	private _positions = [_building] call CBA_fnc_buildingPositions;
	if (count _positions > 3) then {
		_spawnPos = selectRandom _positions;
	};
};

//Spawn him in as civ so he doesn't get shot by everyone else (except us)
private _group = [_spawnPos, civilian, ["C_journalist_F"]] call BIS_fnc_spawnGroup;
private _press = leader _group;
_press setVariable ["TWC_Insurgency_BLUFOR_Task", _taskNumber];
[_press, true] call ACE_captives_fnc_setHandcuffed;

//Create the task
private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, [_taskNumber, _parentTask], "rescueJournalist", _spawnPos, "CREATED", -1, false, "documents", false] call BIS_fnc_taskCreate;

//Fail the task if he dies
_press addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_task = _unit getVariable ["TWC_Insurgency_BLUFOR_Task", ""];
	[_task] call TWC_Insurgency_BLUFOR_fnc_taskFail;
}];

//Cancel the task if he is deleted
_press addEventHandler ["Deleted", {
	params ["_unit"];
	_task = _unit getVariable ["TWC_Insurgency_BLUFOR_Task", ""];
	[_task] call TWC_Insurgency_BLUFOR_fnc_taskCanceled;
}];

//Add the recovery action on clients
private _jipID = ["TWC_Insurgency_Actions_recover", [_press]] call CBA_fnc_globalEventJIP;
[_jipID, _press] call CBA_fnc_removeGlobalEventJIP;

//Fire an event to let the OPFOR Commander know we've spawned a task.
["TWC_Insurgency_OPFOR_spawnTask", [_spawnPos]] call CBA_fnc_serverEvent;

DEBUG_LOG("Rescue Journalist Task Created");
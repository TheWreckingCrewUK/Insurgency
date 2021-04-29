#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Generates a Pacify Region Task.
*
* Arguments:
* 0: Parent Task ID <STRING>
* 1: Task ID <STRING>
*
* Return Value:
* NOTHING
*
* Example:
* ["1", "bluforTasks"] call TWC_Insurgency_BLUFOR_fnc_taskPacifyRegion;
*/

params ["_parentTask", "_taskNumber"];

//Find some villages close to each other.
private _center = selectRandom TWC_Insurgency_Locations;
private _centerPos = locationPosition _center;
private _locations = nearestLocations [_centerPos, ["NameCity","NameCityCapital","NameVillage","NameLocal"], 3000, _centerPos];

//Remove any locations in the mission defined bad location
private _badLocations = getArray (missionConfigFile >> "TWC_Insurgency" >> "invalidTowns");
_locations = _locations select {
	!(text _x in _badLocations)
};

//Only want three locations
if (count _locations > 3) then {
	_locations resize 3;
};

private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;

[_playerside, [_taskNumber, _parentTask], "pacifyRegion", _centerPos, "CREATED", -1, false, "meet", false] call BIS_fnc_taskCreate;

["TWC_Insurgency_BLUFOR_pacifyRegion", {
	_this params ["_updatedLocation"];
	_thisArgs params ["_locations", "_taskNumber"];
	DEBUG_LOG("Pacify Task Check: " + text _updatedLocation);
	
	if (_updatedLocation in _locations) then {
		_done = true;
		DEBUG_LOG("Checking" + str _locations);
		{
			private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
			_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task"];
			if (_allegiance < 70) then {
				_done = false;
				DEBUG_LOG(str _x + " not ready");
			};
		} forEach _locations;
		
		if (_done) then {
			[_taskNumber] call TWC_Insurgency_BLUFOR_fnc_taskSucceed;
			[_thisType, _thisId] call CBA_fnc_removeEventHandler;
			DEBUG_LOG("Task Pacify Succeeded");
		};
	};
}, [_locations, _taskNumber]] call CBA_fnc_addEventHandlerArgs;

//Fire an event to let the OPFOR Commander know we've spawned a task.
["TWC_Insurgency_OPFOR_spawnTask", [_centerPos]] call CBA_fnc_serverEvent;

DEBUG_LOG("Pacify Region Task Created");
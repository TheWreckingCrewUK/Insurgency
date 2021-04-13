#include "..\..\includes\script_component.hpp"

params ["_parentTask", "_taskNumber"];

//Find some villages close to each other.
private _center = (selectRandom TWC_Insurgency_Locations) select 0;
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
			_locationInfo = [_x] call TWC_Insurgency_Locations_fnc_getInfo;
			(_locationInfo select 0) params ["_location", "_isStronghold", "_hasCache", "_allegiance"];
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

DEBUG_LOG("Pacify Region Task Created");
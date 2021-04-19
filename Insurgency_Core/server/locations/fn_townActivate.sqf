#include "..\..\includes\script_component.hpp"

params ["_location"];

//Get the location information
private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup"];

if (_isActive) exitWith {DEBUG_LOG(text _location + " already active")};

//No elders and civs if it is a stronghold.
if (_isStronghold) exitWith {
	["TWC_Insurgency_OPFOR_activateStronghold", [_location]] call CBA_fnc_serverEvent;
};

//If the relations are low enough, tell the enemy that we are in the village
if (_allegiance < 70) then {
	["TWC_Insurgency_OPFOR_activateLocation", [_location]] call CBA_fnc_serverEvent;
};

//Spawn in Village Elders
private _civilianTypes = getArray (missionConfigFile >> "TWC_Insurgency" >> "civilians");
private _elders = [];
for "_i" from 1 to 3 do {
	_elders pushBack (selectRandom _civilianTypes);
};

//Find a position near some buildings for them to sit.
private _randPos = [[_location], [nearestLocation [getMarkerPos "BASE", ""]]] call BIS_fnc_randomPos;
private _posArray = selectBestPlaces [_randPos, 200, "houses", 1, 1];
private _elderPos = ((_posArray select 0) select 0);

private _elderGroup = [_elderPos, civilian, _elders, [[0,0,0],[1,0.5,0],[-1,0.5,0]]] call BIS_fnc_spawnGroup;
private _elder = leader _elderGroup;

{
	_x addEventHandler ["Killed", {
		_this call TWC_Insurgency_Locations_fnc_handleDeath;
	}];
} forEach (units _elderGroup);

//Make 'em sit, nice and passive.
{
	private _dir = _x getDir _elderPos;
	_x setDir _dir;
	_x playAction "SitDown";
	_x disableAI "MOVE";
	_x disableAI "ANIM";
} forEach units _elderGroup;

//Spawn in ambient civilians.
private _size = switch (type _location) do {
	case "NameCityCapital": {24};
	case "NameCity": {16};
	case "NameVillage": {8};
	case "NameLocal": {6};
};

private _locationPos = getPos _location;

private _civilianGroup = createGroup civilian;
for "_i" from 1 to _size do {
	private _spawnPos = [[[_locationPos, 300]]] call BIS_fnc_randomPos;
	private _nearestRoadPos = [_spawnPos, 100] call BIS_fnc_nearestRoad;
	if (isNull _nearestRoadPos) then {
		_nearestRoadPos = _spawnPos
	} else {
		_nearestRoadPos = getPos _nearestRoadPos;
	};
	private _civ = _civilianGroup createUnit [selectRandom _civilianTypes, _nearestRoadPos, [], 3, "NONE"];
	_civ disableAI "PATH";
	_civ addEventHandler ["Killed", {
		_this call TWC_Insurgency_Locations_fnc_handleDeath;
	}];
};

//The dismissed waypoint is meant to simulate casual behaviour. However, it requires you the waypoint to 'complete' before working. The units meanwhile stay very clustered.
/*_wp = _civilianGroup addWaypoint [_locationPos, 0];
_wp setWaypointType "DISMISS";
_wp setWaypointSpeed "LIMITED";*/

//Also store the location on the elders/civs for use.
_civilianGroup setVariable ["TWC_Insurgency_Location", _location];
_elderGroup setVariable ["TWC_Insurgency_Location", _location];

//Fire an event on all clients, including JIP, that addes actions to the elders and civilians.
private _jipID = ["TWC_Insurgency_Actions_elderSpawn", _elderGroup] call CBA_fnc_globalEventJIP;
[_jipID, _elder] call CBA_fnc_removeGlobalEventJIP;

private _jipID = ["TWC_Insurgency_Actions_civSpawn", _civilianGroup] call CBA_fnc_globalEventJIP;
[_jipID, leader _civilianGroup] call CBA_fnc_removeGlobalEventJIP;

//Store the civilians and elders for clean up by the deactivation script, also store activation time so the server knows the loop.
_location setVariable ["TWC_Insurgency_Locations_isActive", true];
_location setVariable ["TWC_Insurgency_Locations_elderGroup", _elderGroup];
_location setVariable ["TWC_Insurgency_Locations_civGroup", _civilianGroup];

DEBUG_LOG(text _location + " activated");
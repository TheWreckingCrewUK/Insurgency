#include "..\..\..\includes\script_component.hpp"

params ["_location"];

private _locationPos = locationPosition _location;

private _strongholdInfo = [_locationPos] call TWC_Insurgency_OPFOR_fnc_getClosestStronghold;
_strongholdInfo params ["_stronghold", "_strongholdDistance"];

private _strongholdPos = locationPosition _stronghold;

private _spawnPos = [[_stronghold]] call BIS_fnc_randomPos;
private _spawnRoad = [_spawnPos, 500] call BIS_fnc_nearestRoad;
_spawnPos = getPos _spawnRoad;
_spawnPos set [2, 0];

private _section = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_section");
private _side = call TWC_Insurgency_OPFOR_fnc_enemySide;

private _vehicle = objNull;

if (_location isNotEqualTo _stronghold) then {
	private _info = getRoadInfo _spawnRoad;
	private _spawnDir = (_info select 6) getDir (_info select 7);
	
	private _truck = selectRandom (getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_trucks"));
	private _vehicleGroup = [_spawnPos, _side, [_truck]] call BIS_fnc_spawnGroup;
	_vehicle setDir _spawnDir;
	_vehicle = vehicle leader _vehicleGroup;
	
	private _wp1 = _vehicleGroup addWaypoint [_locationPos, 200];
	_wp1 setWaypointType "TR UNLOAD";

	private _wp2 = _vehicleGroup addWaypoint [_strongholdPos, 100];
	_wp2 setWaypointType "MOVE";

	private _wp3 = _vehicleGroup addWaypoint [_strongholdPos, 100];
	_wp3 setWaypointType "SCRIPTED";
	_wp3 setWaypointScript "Insurgency_Core\server\OPFOR\fn_deleteGroup.sqf";
};

private _group = [_spawnPos, _side, _section] call BIS_fnc_spawnGroup;

private _wp1 = _group addWaypoint [_vehicle, 0];
_wp1 setWaypointType "GETIN";
_wp1 waypointAttachVehicle _vehicle;

private _wp2 = _group addWaypoint [_locationPos, 200];
_wp2 setWaypointType "MOVE";

private _wp3 = _group addWaypoint [_locationPos, 200];
_wp3 setWaypointType "SCRIPTED";
_wp3 setWaypointScript "Insurgency_Core\server\OPFOR\fn_cacheGroup.sqf";

[-10] call TWC_Insurgency_OPFOR_fnc_updateSupply;
[-10] call TWC_Insurgency_OPFOR_fnc_updateManpower;

DEBUG_LOG("Reinforcing " + text _location);
#include "..\..\..\includes\script_component.hpp"

params ["_location"];

private _locationPos = locationPosition _location;

private _randPos = [[[_locationPos, 3000]]] call BIS_fnc_randomPos;
private _road = [_randPos, 2000] call BIS_fnc_nearestRoad;
private _bombPos = getPos _road;

private _strongholdInfo = [_bombPos] call TWC_Insurgency_OPFOR_fnc_getClosestStronghold;
_strongholdInfo params ["_stronghold", "_strongholdDistance"];

private _strongholdPos = locationPosition _stronghold;
private _spawnRoad = [_strongholdPos, 500] call BIS_fnc_nearestRoad;
_strongholdPos = getPos _spawnRoad;
_strongholdPos set [2, 0];

private _type = selectRandom getArray (missionConfigFile >> "TWC_Insurgency" >> "civilians");

private _side = call TWC_Insurgency_OPFOR_fnc_enemySide;

private _group = [_strongholdPos, _side, [_type]] call BIS_fnc_spawnGroup;

if (_strongholdDistance > 2000) then {
	private _civVehicle = selectRandom getArray (missionConfigFile >> "TWC_Insurgency" >> "civVehicles");
	private _vehicle = createVehicle [_civVehicle, [0,0,0]];
	_vehicle setPos _strongholdPos;
	_group addVehicle _vehicle;
};

private _wp1 = _group addWaypoint [_bombPos, 4];
_wp1 setWaypointType "GETOUT";
_wp1 setWaypointCombatMode "BLUE";
_wp1 setWaypointBehaviour "CARELESS";

private _wp2 = _group addWaypoint [_bombPos, 4];
_wp2 setWaypointSpeed "LIMITED";
_wp2 setWaypointType "SCRIPTED";
_wp2 setWaypointScript "Insurgency_Core\server\OPFOR\fn_plantIED.sqf";

private _wp3 = _group addWaypoint [_bombPos, 0];
_wp3 setWaypointType "GETIN";

private _wp4 = _group addWaypoint [_strongholdPos, 100];
_wp4 setWaypointSpeed "FULL";
_wp4 setWaypointType "MOVE";

private _wp5 = _group addWaypoint [_strongholdPos, 0];
_wp5 setWaypointType "SCRIPTED";
_wp5 setWaypointScript "Insurgency_Core\server\OPFOR\fn_deleteGroup.sqf";

[-4] call TWC_Insurgency_OPFOR_fnc_updateSupply;

DEBUG_LOG("Planting IED near " + text _location);
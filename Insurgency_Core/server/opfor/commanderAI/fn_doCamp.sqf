#include "..\..\..\includes\script_component.hpp"

params ["_location"];

private _locationPosition = locationPosition _location;
private _size = size _location;
private _minRadius = _size call BIS_fnc_arithmeticMean;
_minRadius = _minRadius + 200;

private _campPos = [_locationPosition, _minRadius, 4000, 0, 0, 0.5, 0, [], [0,0,0]] call BIS_fnc_findSafePos;
if (_campPos isEqualTo [0,0,0]) exitWith {DEBUG_LOG("No suitable position for camp at " + text _location);};

private _camp = call TWC_Insurgency_Compositions_fnc_getCamp;

[_campPos, random 360, _camp] call BIS_fnc_objectsMapper;

private _camps = TWC_Insurgency_OPFOR_Camps;
private _count = count _camps;

private _marker = createMarkerLocal ["camp" + str _count, _campPos];
_marker setMarkerTypeLocal "hd_flag";
_marker setMarkerColorLocal "ColorEAST";
_marker setMarkerAlpha 0;

TWC_Insurgency_OPFOR_Camps pushBack _marker;

[-100] call TWC_Insurgency_OPFOR_fnc_updateSupply;

//Spawn the enemy forces holding the camp.
private _section = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_section");
private _side = call TWC_Insurgency_OPFOR_fnc_enemySide;

private _groups = [];
for "_i" from 1 to 4 do {
	private _spawnPos = [[[_campPos, 200]]] call BIS_fnc_randomPos;
	
	private _group = [_spawnPos, _side, _section] call BIS_fnc_spawnGroup;
	
	//2 patrolling, 2 holding
	if (_i > 2) then {
		[_group, _campPos, 200, 8, "MOVE", "AWARE", "YELLOW", "LIMITED", "STAG COLUMN"] call CBA_fnc_taskPatrol;
	} else {
		_wp = _group addWaypoint [_campPos, 50];
		_wp setWaypointType "DISMISS";
	};
	
	{
		_x addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			private _group = group _unit;
			private _marker = _group getVariable ["TWC_Insurgency_OPFOR_Camp", ""];
			["TWC_Insurgency_OPFOR_campDeath", [_marker]] call CBA_fnc_serverEvent;
		}];
	} forEach (units _group);
	
	_group setVariable ["TWC_Insurgency_OPFOR_Camp", _marker];
	_groups pushBack _group;
};

missionNameSpace setVariable [_marker + "_groups", _groups];

//Add an eventHandler to handle camp destruction.
["TWC_Insurgency_OPFOR_campDeath", {
	_this params ["_testMarker"];
	_thisArgs params ["_marker"];
	
	if (_testMarker isEqualTo _marker) then {
		private _groups = missionNameSpace getVariable [_marker + "_groups", []];
		private _units = [];
		{
			_units append (units _x);
		} forEach _groups;
		
		_alives = {alive _x} count _units;
		if (_alives isEqualTo 0) then {
			["TWC_Insurgency_Locations_campDeath", [_marker]] call CBA_fnc_serverEvent;
			deleteMarker _marker;
			TWC_Insurgency_OPFOR_Camps - [_marker];
			["TWC_Insurgency_OPFOR_campDeath", _thisId] call CBA_fnc_removeEventHandler;
		};
	};
}, [_marker]] call CBA_fnc_addEventHandlerArgs;

DEBUG_LOG("Created Camp " + _marker + " at " + str _campPos);
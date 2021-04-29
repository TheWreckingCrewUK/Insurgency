#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Spawns OPFOR Units at a task.
*
* Arguments:
* 0: Position <ARRAY>
*
* Return Value:
* NONE
*
* Example:
* [_pos] call TWC_Insurgency_OPFOR_fnc_spawnTask;
*/

params ["_pos"];

//If another format position then AGL is given, then they spawn in the air and they die.
_pos set [2, 0];

//The amount of people we spawn in and whether we spawn depends on the OPFOR stats.
private _manpower = TWC_Insurgency_manpowerOPFOR;
private _supply = TWC_Insurgency_supplyOPFOR;

private _section = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_section");
private _sectionSize = count _section;

//Don't spawn anything if we cannot even spawn a section worth.
if (_manpower < _sectionSize || _supply < _sectionSize) exitWith {
	DEBUG_LOG("Not enough manpower or supply to provide forces for task.");
};

//Amount of sections is a tenth of the current manpower.
private _sectionCount = round ((_manpower / 10) / _sectionSize);

private _enemySide = call TWC_Insurgency_OPFOR_fnc_enemySide;

for "_i" from 1 to _sectionCount do {
	private _spawnPos = [[[_pos, 300]]] call BIS_fnc_randomPos;
	private _group = [_spawnPos, _enemySide, _section] call BIS_fnc_spawnGroup;
	
	//Some sections will be patrolling, some will be standing around.
	if (random 1 > 0.5) then {
		[_group, _pos, 200, 8, "MOVE", "AWARE", "YELLOW", "LIMITED", "STAG COLUMN"] call CBA_fnc_taskPatrol;
	} else {
		_wp = _group addWaypoint [_pos, 50];
		_wp setWaypointType "DISMISS";
	};
};
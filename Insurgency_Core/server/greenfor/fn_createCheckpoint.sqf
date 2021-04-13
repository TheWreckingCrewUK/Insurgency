#include "..\..\includes\script_component.hpp"

params ["_pos"];

private _checkpoint = call TWC_Insurgency_Compositions_fnc_getCheckpoint;

private _road = roadAt _pos;
private _roadInfo = getRoadInfo _road;
private _dir = (_roadInfo select 6) getDir (_roadInfo select 7);

[_pos, _dir, _checkpoint] call BIS_fnc_objectsMapper;

private _possibleNames = getArray (missionConfigFile >> "TWC_Insurgency" >> "checkpointNames");
_possibleNames = _possibleNames select {getMarkerColor ("checkpoint_" + _x) isEqualTo ""};

private _name = selectRandom _possibleNames;
private _marker = createMarkerLocal ["checkpoint_" + _name, _pos];
_marker setMarkerTypeLocal "hd_join";
_marker setMarkerColorLocal "ColorGUER";
_marker setMarkerDirLocal _dir;
_marker setMarkerText "Checkpoint " + _name;

TWC_Insurgency_GREENFOR_Checkpoints pushBack [_marker];

DEBUG_LOG("Checkpoint created at " + str _pos);
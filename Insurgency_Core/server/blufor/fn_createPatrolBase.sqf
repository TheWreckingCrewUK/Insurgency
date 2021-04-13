#include "..\..\includes\script_component.hpp"

params ["_box", "_generator", "_table"];

private _possibleNames = getArray (missionConfigFile >> "TWC_Insurgency" >> "patrolBaseNames");
_possibleNames = _possibleNames select {getMarkerColor ("TWC_PatrolBase_" + _x) isEqualTo ""};
private _name = selectRandom _possibleNames;

private _marker = createMarkerLocal ["TWC_PatrolBase_" + _name, getPos _box];
_marker setMarkerTypeLocal "hd_flag";
_marker setMarkerColorLocal "ColorWEST";
_marker setMarkerText ("FOB " + _name);

TWC_Insurgency_PatrolBases pushBack _marker;

_playerSide = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerSide, _marker, markerText _marker] call BIS_fnc_addRespawnPosition;
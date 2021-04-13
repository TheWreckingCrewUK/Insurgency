#include "..\..\includes\script_component.hpp"

params ["_box", "_player"];

private _pos = getPos _box;

private _baseDistance = _pos distance (getMarkerPos "BASE");
if (_baseDistance < 2000) exitWith {false};

private _allMarkers = allMapMarkers;

private _baseMarkers = _allMarkers select {"PatrolBase" in _x};

private _markersClose = _baseMarkers select {(getMarkerPos _x) distance _pos < 1000};

if (count _markersClose > 0) exitWith {false};

private _generator = _box getVariable ["TWC_Insurgency_Generator", objNull];
private _table = _box getVariable ["TWC_Insurgency_Table", objNull];

private _generatorDistance = _generator distance _box;
private _tableDistance = _table distance _box;

_tableDistance < 20 && _generatorDistance < 20
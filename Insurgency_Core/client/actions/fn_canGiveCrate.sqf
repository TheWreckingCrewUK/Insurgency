#include "..\..\includes\script_component.hpp"

params ["_crate", "_player"];

private _nearestCivs = getPos _target nearEntities [getArray (missionConfigFile >> "TWC_Insurgency" >> "civilians"), 400];

if (count _nearestCivs < 1) exitWith {false};

private _leaders = _nearestCivs select {leader _x == _x};
private _elders = _leaders select {count (units _x) < 4};

if (count _elders < 0) exitWith {false};

private _elder = _elders select 0;
private _elderPos = getPos _elder;

private _cratePos = getPos _crate;

if (_elderPos distance _cratePos > 50) exitWith {false};

true
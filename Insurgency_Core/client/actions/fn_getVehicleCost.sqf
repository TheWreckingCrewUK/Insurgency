#include "..\..\includes\script_component.hpp"

params ["_type"];

_categories = ["lightVehicles", "trucks", "helicopters", "armour", "planes"];

_category = {
	private _vehicles = getArray (missionConfigFile >> "CfgTransport" >> _x);
	if (_type in _vehicles) exitWith {_x};
} forEach _categories;

private _vehicles = getArray (missionConfigFile >> "CfgTransport" >> _category);

private _index = _vehicles find _type;

private _costs = getArray (missionConfigFile >> "CfgTransport" >> _category + "_cost");
private _cost = _costs select _index;

_cost
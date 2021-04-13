#include "..\..\includes\script_component.hpp"

params ["_type"];

_categories = ["blufor_lightVehicles", "blufor_helicopters", "blufor_armour", "blufor_planes"];

_category = {
	private _vehicles = getArray (missionConfigFile >> "TWC_Insurgency" >> _x);
	if (_type in _vehicles) exitWith {_x};
} forEach _categories;

private _vehicles = getArray (missionConfigFile >> "TWC_Insurgency" >> _category);

private _index = _vehicles find _type;

private _costs = getArray (missionConfigFile >> "TWC_Insurgency" >> _category + "_cost");
private _cost = _costs select _index;

_cost
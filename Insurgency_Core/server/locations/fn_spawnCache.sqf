#include "..\..\includes\script_component.hpp"

params ["_location"];

private _pos = locationPosition _location;
private _radius = (size _location) call BIS_fnc_arithmeticMean;

private _findBuilding = {
	private _cachePos = [[[_pos, _radius]]] call BIS_fnc_randomPos;
	private _building = nearestBuilding _cachePos;
	private _coverPosList = _building buildingPos -1;
	if (count _coverPosList < 1) exitWith {call _findBuilding};
	selectRandom _coverPosList;
};

private _cachePos = call _findBuilding;
private _type = selectRandom getArray (missionConfigFile >> "TWC_Insurgency" >> "caches");

private _cache = createVehicle [_type, [0,0,0]];
_cache setPos _cachePos;

_cache allowDamage false;
[{_this allowDamage true}, _cache, 10] call CBA_fnc_waitAndExecute;

_cache addEventHandler ["Killed", {
	_this call TWC_Insurgency_Locations_fnc_cacheDestroyed;
}];
#include "..\..\includes\script_component.hpp"

params ["_target", "_player"];

private _spawnPos = getPos TWC_Insurgency_SpawnPad;
private _spawnDir = getDir TWC_Insurgency_SpawnPad;
_spawnDir = _spawnDir + 90;

private _box = createVehicle ["B_supplyCrate_F", _spawnPos];
private _table = createVehicle ["Land_CampingTable_F", _spawnPos];
private _generator = createVehicle ["Land_Portable_generator_F", _spawnPos];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

private _objects = [_box, _table, _generator];

{
	_x setDir _spawnDir;
	[_x, 5] call ace_cargo_fnc_setSize;
	[_x, true] call ace_dragging_fnc_setDraggable;
	[_x, true] call ace_dragging_fnc_setCarryable;
} forEach _objects;

["TWC_Insurgency_Actions_addPatrolBase", _objects] call CBA_fnc_globalEventJIP;

["TWC_Insurgency_BLUFOR_updateSupply", [-100]] call CBA_fnc_serverEvent;

DEBUG_LOG("Spawned Patrol Base Gear");
#include "..\..\includes\script_component.hpp"

params ["_target", "_player", "_type"];

private _spawnPos = getPos TWC_Insurgency_SpawnPad;
private _spawnDir = getDir TWC_Insurgency_SpawnPad;
_spawnDir = _spawnDir + 90;

private _vehicle = createVehicle [_type, _spawnPos];

clearItemCargoGlobal _vehicle;
_vehicle setDir _spawnDir;

private _cost = [_type] call TWC_Insurgency_Actions_fnc_getVehicleCost;

["TWC_Insurgency_BLUFOR_updateSupply", [-1 * _cost]] call CBA_fnc_serverEvent;

DEBUG_LOG("Spawned " + _type);
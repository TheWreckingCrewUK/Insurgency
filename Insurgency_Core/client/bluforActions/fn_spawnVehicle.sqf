#include "..\..\includes\script_component.hpp"

params ["_target", "_player", "_typeInfo"];

_typeInfo params ["_type", "_category"];

private _spawnPos = getPos TWC_Insurgency_SpawnPad;
private _spawnDir = getDir TWC_Insurgency_SpawnPad;
_spawnDir = _spawnDir + 90;

private _vehicle = createVehicle [_type, _spawnPos];

clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
_vehicle setDir _spawnDir;

private _cost = getNumber (missionConfigFile >> "CfgTransport" >> _category >> _type >> "cost");
private _variant = getText (missionConfigFile >> "CfgTransport" >> _category >> _type >> "cost");
_variant = if (_variant isEqualTo "") then {true};

[_vehicle, _variant] call BIS_fnc_initVehicle;

["TWC_Insurgency_BLUFOR_updateSupply", [-1 * _cost]] call CBA_fnc_serverEvent;

private _jipID = ["TWC_Insurgency_Actions_addDelete", [_vehicle]] call CBA_fnc_globalEventJIP;
[_jipID, _vehicle] call CBA_fnc_removeGlobalEventJIP;

DEBUG_LOG("Spawned " + _type);
#include "..\..\includes\script_component.hpp"

params ["_target", "_player", "_type"];

private _boxType = getText (missionConfigFile >> "CfgAmmoboxes" >> _type >> "type");
private _boxSize = getNumber (missionConfigFile >> "CfgAmmoboxes" >> _type >> "size");

private _spawnPos = getPos TWC_Insurgency_SpawnPad;
private _spawnDir = getDir TWC_Insurgency_SpawnPad;
_spawnDir = _spawnDir + 90;

private _box = createVehicle [_boxType, _spawnPos];
_box setDir _spawnDir;

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

[_box, _boxSize] call ace_cargo_fnc_setSize;
[_box, true] call ace_dragging_fnc_setDraggable;
[_box, true] call ace_dragging_fnc_setCarryable;

private _jipID = ["TWC_Insurgency_Actions_addDragging", [_box]] call CBA_fnc_globalEventJIP;
[_jipID, _box] call CBA_fnc_removeGlobalEventJIP;

private _vehicleSupply = getNumber (missionConfigFile >> "CfgAmmoboxes" >> _type >> "vehicleSupply");
[_box, _vehicleSupply] call ace_rearm_fnc_setSupplyCount;

private _weapons = "true" configClasses (missionConfigFile >> "CfgAmmoboxes" >> _type >> "Weapons");
private _magazines = "true" configClasses (missionConfigFile >> "CfgAmmoboxes" >> _type >> "Magazines");
private _items = "true" configClasses (missionConfigFile >> "CfgAmmoboxes" >> _type >> "Items");

{
	private _weapon = configName _x;
	private _class = getText (missionConfigFile >> "CfgAmmoboxes" >> _type >> "weapons" >> _weapon >> "type");
	private _amount = getNumber (missionConfigFile >> "CfgAmmoboxes" >> _type >> "weapons" >> _weapon >> "count");
	_box addWeaponCargoGlobal [_class, _amount];
} forEach _weapons;

{
	private _magazine = configName _x;
	private _class = getText (missionConfigFile >> "CfgAmmoboxes" >> _type >> "magazines" >> _magazine >> "type");
	private _amount = getNumber (missionConfigFile >> "CfgAmmoboxes" >> _type >> "magazines" >> _magazine >> "count");
	_box addMagazineCargoGlobal [_class, _amount];
} forEach _magazines;

{
	private _item = configName _x;
	private _class = getText (missionConfigFile >> "CfgAmmoboxes" >> _type >> "items" >> _item >> "type");
	private _amount = getNumber (missionConfigFile >> "CfgAmmoboxes" >> _type >> "items" >> _item >> "count");
	_box addItemCargoGlobal [_class, _amount];
} forEach _items;

private _code = getText (missionConfigFile >> "CfgAmmoboxes" >> _type >> "script");
_code = compile _code;
[_box] call _code;

private _cost = [_type] call TWC_Insurgency_Actions_fnc_getAmmoCost;

["TWC_Insurgency_BLUFOR_updateSupply", [-1 * _cost]] call CBA_fnc_serverEvent;

DEBUG_LOG("Spawned " + _type);
#include "..\..\includes\script_component.hpp"

//Action to check BLUFOR Supply.
private _action = [
	"TWC_Insurgency_Actions_getSupply",
	"Check Supply",
	"",
	{_this call TWC_Insurgency_Actions_fnc_getSupply},
	{true}
] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//Civilian/town interactions created upon init, added when towns are spawned in.
TWC_Insurgency_Actions_getElder = [
	"TWC_Insurgency_Actions_getElder",
	"Find Elder",
	"",
	{_this call TWC_Insurgency_Actions_fnc_getElder},
	{alive _target}
] call ace_interact_menu_fnc_createAction;

TWC_Insurgency_Actions_questionElder = [
	"TWC_Insurgency_Actions_questionElder",
	"Question Elder",
	"",
	{_this call TWC_Insurgency_Actions_fnc_questionElder},
	{alive _target}
] call ace_interact_menu_fnc_createAction;

TWC_Insurgency_Actions_getElderTask = [
	"TWC_Insurgency_Actions_getElderTask",
	"Offer Help",
	"",
	{_this call TWC_Insurgency_Actions_fnc_getElderTask},
	{alive _target}
] call ace_interact_menu_fnc_createAction;

TWC_Insurgency_Actions_taskDispute = [
	"TWC_Insurgency_Actions_taskDispute",
	"Resolve Dispute",
	"",
	{_this call TWC_Insurgency_Actions_fnc_taskDispute},
	{alive _target}
] call ace_interact_menu_fnc_createAction;

TWC_Insurgency_Actions_taskCash = [
	"TWC_Insurgency_Actions_taskCash",
	"Resolve Dispute",
	"",
	{_this call TWC_Insurgency_Actions_fnc_taskCash},
	{alive _target && "CUP_item_Money" in (items _player)}
] call ace_interact_menu_fnc_createAction;

TWC_Insurgency_Actions_recover = [
	"TWC_Insurgency_Actions_recover",
	"Hand over to Base",
	"",
	{_this call TWC_Insurgency_Actions_fnc_recover},
	{alive _target && (_target distance getMarkerPos "BASE") < 100}
] call ace_interact_menu_fnc_createAction;

//Create category actions to group vehicle actions under.
private _action = [
	"TWC_Insurgency_Actions_spawnVehicle",
	"Spawn Light Vehicle",
	"",
	{true},
	{},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"TWC_Insurgency_Actions_spawnHeli",
	"Spawn Helicopter",
	"",
	{true},
	{},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"TWC_Insurgency_Actions_spawnArmour",
	"Spawn Armour",
	"",
	{true},
	{},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"TWC_Insurgency_Actions_spawnPlane",
	"Spawn Plane",
	"",
	{true},
	{},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//Create subactions for vehicle spawning, everyone can spawn light vehicles.
private _vehicles = getArray (missionConfigFile >> "TWC_Insurgency" >> "blufor_lightVehicles");
{
	private _vehicle = _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnVehicle_" + _vehicle,
		getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName"),
		"",
		{_this call TWC_Insurgency_Actions_fnc_spawnVehicle},
		{_this call TWC_Insurgency_Actions_fnc_canSpawnVehicle},
		{},
		_vehicle
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnVehicle"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _vehicles;

//Only add helicopters spawns for heli pilots.
if (player getVariable ["TWC_Insurgency_isHeli", false]) then {
	private _helicopters = getArray (missionConfigFile >> "TWC_Insurgency" >> "blufor_helicopters");
	{
		private _helicopter = _x;
		private _action = [
			"TWC_Insurgency_Actions_spawnVehicle_" + _helicopter,
			getText (configFile >> "CfgVehicles" >> _helicopter >> "displayName"),
			"",
			{_this call TWC_Insurgency_Actions_fnc_spawnVehicle},
			{_this call TWC_Insurgency_Actions_fnc_canSpawnVehicle},
			{},
			_helicopter
		] call ace_interact_menu_fnc_createAction;
		[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnHeli"], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _helicopters;
};

//Only add armour spawns for armour crew.
if (player getVariable ["TWC_Insurgency_isArmour", false]) then {
	private _armours = getArray (missionConfigFile >> "TWC_Insurgency" >> "blufor_armour");
	{
		private _armour = _x;
		private _action = [
			"TWC_Insurgency_Actions_spawnVehicle_" + _armour,
			getText (configFile >> "CfgVehicles" >> _armour >> "displayName"),
			"",
			{_this call TWC_Insurgency_Actions_fnc_spawnVehicle},
			{_this call TWC_Insurgency_Actions_fnc_canSpawnVehicle},
			{},
			_armour
		] call ace_interact_menu_fnc_createAction;
		[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnArmour"], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _armours;
};

//Only add jet spawns for jet pilots.
if (player getVariable ["TWC_Insurgency_isPlane", false]) then {
	private _armours = getArray (missionConfigFile >> "TWC_Insurgency" >> "blufor_planes");
	{
		private _plane = _x;
		private _action = [
			"TWC_Insurgency_Actions_spawnVehicle_" + _plane,
			getText (configFile >> "CfgVehicles" >> _plane >> "displayName"),
			"",
			{_this call TWC_Insurgency_Actions_fnc_spawnVehicle},
			{_this call TWC_Insurgency_Actions_fnc_canSpawnVehicle},
			{},
			_plane
		] call ace_interact_menu_fnc_createAction;
		[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnPlane"], _action] call ace_interact_menu_fnc_addActionToObject;
	} forEach _armours;
};

//Create actions for box spawning.
private _boxes = "true" configClasses (missionConfigFile >> "CfgAmmoboxes");
{
	private _box = configName _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnAmmo_" + _box,
		getText (missionConfigFile >> "CfgAmmoboxes" >> _box >> "displayName"),
		"",
		{_this call TWC_Insurgency_Actions_fnc_spawnAmmo},
		{_this call TWC_Insurgency_Actions_fnc_canSpawnAmmo},
		{},
		_box
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign2, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _boxes;

//Create actions for patrol base objects.
private _action = [
	"TWC_Insurgency_Actions_spawnPatrolBase",
	"Patrol Base Gear",
	"",
	{_this call TWC_Insurgency_Actions_fnc_spawnPatrolBase},
	{_this call TWC_Insurgency_Actions_fnc_canSpawnPatrolBase},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign2, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

TWC_Insurgency_Actions_createPatrolBase = [
	"TWC_Insurgency_Actions_createPatrolBase",
	"Create Patrol Base",
	"",
	{_this call TWC_Insurgency_Actions_fnc_createPatrolBase},
	{_this call TWC_Insurgency_Actions_fnc_canCreatePatrolBase},
	{}
] call ace_interact_menu_fnc_createAction;

//Create action to give a crate to towns.
TWC_Insurgency_Actions_giveCrate = [
	"TWC_Insurgency_Actions_giveCrate",
	"Give Crate",
	"",
	{_this call TWC_Insurgency_Actions_fnc_giveCrate},
	{_this call TWC_Insurgency_Actions_fnc_canGiveCrate},
	{}
] call ace_interact_menu_fnc_createAction;

//Eventhandlers for adding in actions on civs/towns when spawned in.
["TWC_Insurgency_Actions_civSpawn", {
	_this call TWC_Insurgency_Actions_fnc_addCiv;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Actions_elderSpawn", {
	_this call TWC_Insurgency_Actions_fnc_addElder;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Actions_taskDispute", {
	_this call TWC_Insurgency_Actions_fnc_addTaskDispute;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Actions_taskCash", {
	_this call TWC_Insurgency_Actions_fnc_addTaskCash;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Actions_recover", {
	_this call TWC_Insurgency_Actions_fnc_addRecover;
}] call CBA_fnc_addEventHandler;

//Remove Action Handlers
["TWC_Insurgency_Actions_taskDisputeRemove", {
	_this call TWC_Insurgency_Actions_fnc_removeTaskDispute;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Actions_taskCashRemove", {
	_this call TWC_Insurgency_Actions_fnc_removeTaskCash;
}] call CBA_fnc_addEventHandler;

//Eventhandlers for updating supply.
["TWC_Insurgency_Actions_getSupply", {
	TWC_Insurgency_supplyBLUFOR = _this;
}] call CBA_fnc_addEventHandler;

//Eventhandler for adding patrol base creation action.
["TWC_Insurgency_Actions_addPatrolBase", {
	_this call TWC_Insurgency_Actions_fnc_addPatrolBase;
}] call CBA_fnc_addEventHandler;

//Eventhandler for ammobox spawning to make them carryable/draggable by everyone.
["TWC_Insurgency_Actions_addDragging", {
	params ["_box"];
	[_box, true] call ace_dragging_fnc_setDraggable;
	[_box, true] call ace_dragging_fnc_setCarryable;
}] call CBA_fnc_addEventHandler;

DEBUG_LOG("Actions Init Complete");
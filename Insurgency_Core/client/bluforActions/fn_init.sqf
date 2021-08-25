#include "..\..\includes\script_component.hpp"

if (isDedicated) exitWith {DEBUG_LOG("BLUFOR Client Actions do not need to be called on server.")};

//Action to check BLUFOR Supply.
private _action = [
	"TWC_Insurgency_Actions_getSupply",
	"Check Supply",
	"",
	{_this call TWC_Insurgency_bluforActions_fnc_getSupply},
	{true}
] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//Action to recover objects to base.
TWC_Insurgency_Actions_recover = [
	"TWC_Insurgency_Actions_recover",
	"Hand over to Base",
	"",
	{_this call TWC_Insurgency_bluforActions_fnc_recover},
	{alive _target && (_target distance getMarkerPos "BASE") < 100}
] call ace_interact_menu_fnc_createAction;

//Action to delete boxes and vehicles in base.
TWC_Insurgency_Actions_delete = [
	"TWC_Insurgency_Actions_delete",
	"Return to Base",
	"",
	{deleteVehicle _target},
	{alive _target && (_target distance TWC_Insurgency_SpawnSign2) < 50}
] call ace_interact_menu_fnc_createAction;

//Create category actions to group vehicle actions under.
private _action = [
	"TWC_Insurgency_Actions_spawnVehicleUnarmed",
	"Spawn Light Vehicle (Unarmed)",
	"",
	{true},
	{},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"TWC_Insurgency_Actions_spawnVehicleArmed",
	"Spawn Light Vehicle (Armed)",
	"",
	{true},
	{},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"TWC_Insurgency_Actions_spawnMRAP",
	"Spawn MRAP",
	"",
	{true},
	{},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"TWC_Insurgency_Actions_spawnTrucks",
	"Spawn Truck",
	"",
	{true},
	{},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"TWC_Insurgency_Actions_spawnHeliTransport",
	"Spawn Transport Helicopter",
	"",
	{true},
	{_player getVariable ["TWC_Insurgency_isHeli", false]},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"TWC_Insurgency_Actions_spawnHeliAttack",
	"Spawn Attack Helicopter",
	"",
	{true},
	{_player getVariable ["TWC_Insurgency_isHeli", false]},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"TWC_Insurgency_Actions_spawnArmour",
	"Spawn Armour",
	"",
	{true},
	{_player getVariable ["TWC_Insurgency_isArmour", false]},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"TWC_Insurgency_Actions_spawnPlane",
	"Spawn Plane",
	"",
	{true},
	{_player getVariable ["TWC_Insurgency_isPlane", false]},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//Create subactions for vehicle spawning, everyone can spawn light vehicles and trucks.
private _carsUnarmed = "true" configClasses (missionConfigFile >> "CfgTransport" >> "Cars_Unarmed");
{
	private _vehicle = configName _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnVehicle_" + _vehicle,
		getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName"),
		"",
		{_this call TWC_Insurgency_bluforActions_fnc_spawnVehicle},
		{_this call TWC_Insurgency_bluforActions_fnc_canSpawnVehicle},
		{},
		[_vehicle, "Cars_Unarmed"]
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnVehicleUnarmed"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _carsUnarmed;

private _carsArmed = "true" configClasses (missionConfigFile >> "CfgTransport" >> "Cars_Armed");
{
	private _vehicle = configName _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnVehicle_" + _vehicle,
		getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName"),
		"",
		{_this call TWC_Insurgency_bluforActions_fnc_spawnVehicle},
		{_this call TWC_Insurgency_bluforActions_fnc_canSpawnVehicle},
		{},
		[_vehicle, "Cars_Armed"]
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnVehicleArmed"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _carsArmed;

private _MRAP = "true" configClasses (missionConfigFile >> "CfgTransport" >> "MRAP");
{
	private _vehicle = configName _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnVehicle_" + _vehicle,
		getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName"),
		"",
		{_this call TWC_Insurgency_bluforActions_fnc_spawnVehicle},
		{_this call TWC_Insurgency_bluforActions_fnc_canSpawnVehicle},
		{},
		[_vehicle, "MRAP"]
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnMRAP"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _MRAP;

private _trucks = "true" configClasses (missionConfigFile >> "CfgTransport" >> "Trucks");
{
	private _vehicle = configName _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnTruck_" + _vehicle,
		getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName"),
		"",
		{_this call TWC_Insurgency_bluforActions_fnc_spawnVehicle},
		{_this call TWC_Insurgency_bluforActions_fnc_canSpawnVehicle},
		{},
		[_vehicle, "Trucks"]
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnTrucks"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _trucks;

//Add helicopter spawn actions, but only heli crew will see it
private _helicoptersTransport = "true" configClasses (missionConfigFile >> "CfgTransport" >> "Helicopters_Transport");
{
	private _helicopter = configName _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnVehicle_" + _helicopter,
		getText (configFile >> "CfgVehicles" >> _helicopter >> "displayName"),
		"",
		{_this call TWC_Insurgency_bluforActions_fnc_spawnVehicle},
		{_this call TWC_Insurgency_bluforActions_fnc_canSpawnVehicle},
		{},
		[_helicopter, "Helicopters_Transport"]
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnHeliTransport"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _helicoptersTransport;

private _helicoptersAttack = "true" configClasses (missionConfigFile >> "CfgTransport" >> "Helicopters_Transport");
{
	private _helicopter = configName _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnVehicle_" + _helicopter,
		getText (configFile >> "CfgVehicles" >> _helicopter >> "displayName"),
		"",
		{_this call TWC_Insurgency_bluforActions_fnc_spawnVehicle},
		{_this call TWC_Insurgency_bluforActions_fnc_canSpawnVehicle},
		{},
		[_helicopter, "Helicopters_Attack"]
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnHeliAttack"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _helicoptersAttack;

//Add armour spawn actions, but only armour crew will see it
private _armours = "true" configClasses (missionConfigFile >> "CfgTransport" >> "Armour");
{
	private _armour = configName _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnVehicle_" + _armour,
		getText (configFile >> "CfgVehicles" >> _armour >> "displayName"),
		"",
		{_this call TWC_Insurgency_bluforActions_fnc_spawnVehicle},
		{_this call TWC_Insurgency_bluforActions_fnc_canSpawnVehicle},
		{},
		[_armour, "Armour"]
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnArmour"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _armours;

//Add jet spawn actions, but only jet pilots will see it
private _jets = "true" configClasses (missionConfigFile >> "CfgTransport" >> "Planes");
{
	private _plane = configName _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnVehicle_" + _plane,
		getText (configFile >> "CfgVehicles" >> _plane >> "displayName"),
		"",
		{_this call TWC_Insurgency_bluforActions_fnc_spawnVehicle},
		{_this call TWC_Insurgency_bluforActions_fnc_canSpawnVehicle},
		{},
		[_plane, "Planes"]
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign1, 0, ["ACE_MainActions", "TWC_Insurgency_Actions_spawnPlane"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _armours;

//Create actions for box spawning.
private _boxes = "true" configClasses (missionConfigFile >> "CfgAmmoboxes");
{
	private _box = configName _x;
	private _action = [
		"TWC_Insurgency_Actions_spawnAmmo_" + _box,
		getText (missionConfigFile >> "CfgAmmoboxes" >> _box >> "displayName"),
		"",
		{_this call TWC_Insurgency_bluforActions_fnc_spawnAmmo},
		{_this call TWC_Insurgency_bluforActions_fnc_canSpawnAmmo},
		{},
		_box
	] call ace_interact_menu_fnc_createAction;
	[TWC_Insurgency_SpawnSign2, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _boxes;

//Create actions for patrol base objects.
private _action = [
	"TWC_Insurgency_Actions_spawnPatrolBase",
	"Patrol Base Gear (100)",
	"",
	{_this call TWC_Insurgency_bluforActions_fnc_spawnPatrolBase},
	{_this call TWC_Insurgency_bluforActions_fnc_canSpawnPatrolBase},
	{}
] call ace_interact_menu_fnc_createAction;
[TWC_Insurgency_SpawnSign2, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

TWC_Insurgency_Actions_createPatrolBase = [
	"TWC_Insurgency_Actions_createPatrolBase",
	"Create Patrol Base",
	"",
	{_this call TWC_Insurgency_bluforActions_fnc_createPatrolBase},
	{_this call TWC_Insurgency_bluforActions_fnc_canCreatePatrolBase},
	{}
] call ace_interact_menu_fnc_createAction;
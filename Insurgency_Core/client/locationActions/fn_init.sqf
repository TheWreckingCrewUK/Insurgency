#include "..\..\includes\script_component.hpp"

if (isDedicated) exitWith {DEBUG_LOG("Location Client Actions do not need to be called on server.")};

//Civilian/town interactions created upon init, added when towns are spawned in.
TWC_Insurgency_Actions_getElder = [
	"TWC_Insurgency_Actions_getElder",
	"Find Elder",
	"",
	{_this call TWC_Insurgency_locationActions_fnc_getElder},
	{alive _target}
] call ace_interact_menu_fnc_createAction;

TWC_Insurgency_Actions_questionElder = [
	"TWC_Insurgency_Actions_questionElder",
	"Question Elder",
	"",
	{_this call TWC_Insurgency_locationActions_fnc_questionElder},
	{alive _target}
] call ace_interact_menu_fnc_createAction;

TWC_Insurgency_Actions_getElderTask = [
	"TWC_Insurgency_Actions_getElderTask",
	"Offer Help",
	"",
	{_this call TWC_Insurgency_locationActions_fnc_getElderTask},
	{alive _target}
] call ace_interact_menu_fnc_createAction;

TWC_Insurgency_Actions_taskDispute = [
	"TWC_Insurgency_Actions_taskDispute",
	"Resolve Dispute",
	"",
	{_this call TWC_Insurgency_locationActions_fnc_taskDispute},
	{alive _target}
] call ace_interact_menu_fnc_createAction;

TWC_Insurgency_Actions_taskCash = [
	"TWC_Insurgency_Actions_taskCash",
	"Give Cash",
	"",
	{_this call TWC_Insurgency_locationActions_fnc_taskCash},
	{alive _target && "CUP_item_Money" in (items _player)}
] call ace_interact_menu_fnc_createAction;

//Create action to give a crate to towns.
TWC_Insurgency_Actions_giveCrate = [
	"TWC_Insurgency_Actions_giveCrate",
	"Give Crate",
	"",
	{_this call TWC_Insurgency_locationActions_fnc_giveCrate},
	{_this call TWC_Insurgency_locationActions_fnc_canGiveCrate},
	{}
] call ace_interact_menu_fnc_createAction;

DEBUG_LOG("Actions Init Complete");
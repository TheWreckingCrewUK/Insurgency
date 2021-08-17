#include "..\..\includes\script_component.hpp"

if (isDedicated) exitWith {DEBUG_LOG("Location Client Handlers do not need to be called on server.")};

//Eventhandlers for adding in actions on civs/towns when spawned in.
["TWC_Insurgency_Actions_civSpawn", {
	_this call TWC_Insurgency_locationActions_fnc_addCiv;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Actions_elderSpawn", {
	_this call TWC_Insurgency_locationActions_fnc_addElder;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Actions_taskDispute", {
	_this call TWC_Insurgency_locationActions_fnc_addTaskDispute;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Actions_taskCash", {
	_this call TWC_Insurgency_locationActions_fnc_addTaskCash;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Actions_taskAid", {
	_this call TWC_Insurgency_locationActions_fnc_addGiveCrate;
}] call CBA_fnc_addEventHandler;

//Remove Action Handlers
["TWC_Insurgency_Actions_taskDisputeRemove", {
	_this call TWC_Insurgency_locationActions_fnc_removeTaskDispute;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Actions_taskCashRemove", {
	_this call TWC_Insurgency_locationActions_fnc_removeTaskCash;
}] call CBA_fnc_addEventHandler;
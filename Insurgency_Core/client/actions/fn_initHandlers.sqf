#include "..\..\includes\script_component.hpp"

if (isDedicated) exitWith {DEBUG_LOG("Action Handlers do not need to be called on server.")};

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

//Eventhandler for vehicle/ammobox spawning that to delete them.
["TWC_Insurgency_Actions_addDelete", {
	_this call TWC_Insurgency_Actions_fnc_addDelete;
}] call CBA_fnc_addEventHandler;
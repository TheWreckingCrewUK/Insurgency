#include "..\..\includes\script_component.hpp"

if (isDedicated) exitWith {DEBUG_LOG("BLUFOR Client Handlers do not need to be called on server.")};

//Handler to add the recovery actions (HVTs, vehicle recovery).
["TWC_Insurgency_Actions_recover", {
	_this call TWC_Insurgency_bluforActions_fnc_addRecover;
}] call CBA_fnc_addEventHandler;

//Eventhandler for vehicle/ammobox spawning that to delete them.
["TWC_Insurgency_Actions_addDelete", {
	_this call TWC_Insurgency_bluforActions_fnc_addDelete;
}] call CBA_fnc_addEventHandler;

//Eventhandlers for updating supply.
["TWC_Insurgency_Actions_getSupply", {
	TWC_Insurgency_supplyBLUFOR = _this;
}] call CBA_fnc_addEventHandler;

//Eventhandler for adding patrol base creation action.
["TWC_Insurgency_Actions_addPatrolBase", {
	_this call TWC_Insurgency_bluforActions_fnc_addPatrolBase;
}] call CBA_fnc_addEventHandler;

//Eventhandler for ammobox spawning to make them carryable/draggable by everyone.
["TWC_Insurgency_Actions_addDragging", {
	params ["_box"];
	[_box, true] call ace_dragging_fnc_setDraggable;
	[_box, true] call ace_dragging_fnc_setCarryable;
}] call CBA_fnc_addEventHandler;

DEBUG_LOG("BLUFOR Client Handlers Initialised.");
#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Initialise OPFOR handlers.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_OPFOR_fnc_initHandlers;
*/

if (!isServer) exitWith {DEBUG_LOG("OPFOR Handlers not executed on client.")};

//Eventhandlers for towns and stronghold activation/deactivation
["TWC_Insurgency_OPFOR_activateStronghold", {
	_this call TWC_Insurgency_OPFOR_fnc_activateStronghold;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_OPFOR_deactivateStronghold", {
	_this call TWC_Insurgency_OPFOR_fnc_deactivateStronghold;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_OPFOR_activateLocation", {
	_this call TWC_Insurgency_OPFOR_fnc_activateLocation;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_OPFOR_deactivateLocation", {
	_this call TWC_Insurgency_OPFOR_fnc_deactivateLocation;
}] call CBA_fnc_addEventHandler;

//Eventhandler to deploy troops at tasks.
["TWC_Insurgency_OPFOR_spawnTask", {
	_this call TWC_Insurgency_OPFOR_fnc_spawnTask;
}] call CBA_fnc_addEventHandler;
#include "..\..\includes\script_component.hpp"

if (!isServer) exitWith {DEBUG_LOG("OPFOR Init not executed on client.")};

TWC_Insurgency_supplyOPFOR = getNumber (missionConfigFile >> "TWC_Insurgency" >> "supplyOPFOR");
TWC_Insurgency_manpowerOPFOR = getNumber (missionConfigFile >> "TWC_Insurgency" >> "manpowerOPFOR");

//OPFOR Camps Spread throughout the map.
TWC_Insurgency_OPFOR_Camps = [];

//Array of cached OPFOR troops, entries of format [position, troops].
TWC_Insurgency_troopsOPFOR = [];

[{call TWC_Insurgency_OPFOR_fnc_resourceLoop}, [], 600] call CBA_fnc_waitAndExecute;

[{_this execFSM "Insurgency_Core\server\OPFOR\commanderAI\commanderAI.fsm"}, [], 10] call CBA_fnc_waitAndExecute;

//Start the map with IEDs
call TWC_Insurgency_OPFOR_fnc_initIEDs;

//Initialize the strongholds with some massive defences
[{call TWC_Insurgency_OPFOR_fnc_initStrongholds}, [], 10] call CBA_fnc_waitAndExecute;

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
#include "..\..\includes\script_component.hpp"

if (isDedicated) exitWith {DEBUG_LOG("Debug Client Handlers do not need to be called on server.")};

//Eventhandler returning location info.
["TWC_Insurgency_debugActions_sendInfo", {
	params ["_message"];
	hintSilent _message;
}] call CBA_fnc_addEventHandler;
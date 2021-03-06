#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Adds Handlers so server-side functions can be triggered from client.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Debug_fnc_initHandlers;
*/

if (!isServer) exitWith {DEBUG_LOG("Debug Init not executed on client.")};

//Eventhandlers for adding the actions to Zeus.
["TWC_Insurgency_Debug_markCachedUnits", {
	_this call TWC_Insurgency_Debug_fnc_markCachedUnits;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Debug_markCaches", {
	_this call TWC_Insurgency_Debug_fnc_markCaches;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Debug_markCamps", {
	_this call TWC_Insurgency_Debug_fnc_markCamps;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Debug_markIEDs", {
	_this call TWC_Insurgency_Debug_fnc_markIEDs;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Debug_markStrongholds", {
	_this call TWC_Insurgency_Debug_fnc_markStrongholds;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Debug_sendInfo", {
	_this call TWC_Insurgency_Debug_fnc_sendInfo;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Debug_unmarkCachedUnits", {
	_this call TWC_Insurgency_Debug_fnc_unmarkCachedUnits;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Debug_unmarkIEDs", {
	_this call TWC_Insurgency_Debug_fnc_unmarkIEDs;
}] call CBA_fnc_addEventHandler;
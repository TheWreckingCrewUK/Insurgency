#include "..\..\includes\script_component.hpp"

if (isDedicated) exitWith {DEBUG_LOG("Debug actions do not need to be called on server.")};

private _actions = [
	["TWC_Insurgency_Debug_markCachedUnits", "Mark Cached Units"],
	["TWC_Insurgency_Debug_markCaches", "Mark Caches"],
	["TWC_Insurgency_Debug_markCamps", "Mark Camps"],
	["TWC_Insurgency_Debug_markIEDs", "Mark IEDs"],
	["TWC_Insurgency_Debug_markStrongholds", "Mark Strongholds"],
	["TWC_Insurgency_Debug_sendInfo", "Send Info"],
	["TWC_Insurgency_Debug_unmarkCachedUnits", "Unmark Cached Units"],
	["TWC_Insurgency_Debug_unmarkIEDs", "Unmark IEDs"]
];

private _action = [
	"TWC_Insurgency_Debug_Zeus",
	"Insurgency Debug",
	"",
	{},
	{true}
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

{
	_x params ["_type", "_name"];
	
	private _action = [
		_type,
		_name,
		"",
		{[_this select 2, [player]] call CBA_fnc_serverEvent},
		{true},
		{},
		_type
	] call ace_interact_menu_fnc_createAction;
	[["ACE_ZeusActions", "TWC_Insurgency_Debug_Zeus"], _action] call ace_interact_menu_fnc_addActionToZeus;
} forEach _actions;
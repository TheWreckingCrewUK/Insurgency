#include "..\..\includes\script_component.hpp"

params ["_civilianGroup"];

if (isNull _civilianGroup) exitWith {DEBUG_LOG("Group not found")};

{
	[_x, 0, ["ACE_MainActions"], TWC_Insurgency_Actions_getElder] call ace_interact_menu_fnc_addActionToObject;
} forEach units _civilianGroup;

DEBUG_LOG("Added Actions to Civs");
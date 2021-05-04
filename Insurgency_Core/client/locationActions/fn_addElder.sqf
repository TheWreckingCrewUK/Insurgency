#include "..\..\includes\script_component.hpp"

params ["_elderGroup"];

if (isNull _elderGroup) exitWith {DEBUG_LOG("Group not found")};

private _elder = leader _elderGroup;

[_elder, 0, ["ACE_MainActions"], TWC_Insurgency_Actions_questionElder] call ace_interact_menu_fnc_addActionToObject;
[_elder, 0, ["ACE_MainActions"], TWC_Insurgency_Actions_getElderTask] call ace_interact_menu_fnc_addActionToObject;

DEBUG_LOG("Added Actions to Elder")
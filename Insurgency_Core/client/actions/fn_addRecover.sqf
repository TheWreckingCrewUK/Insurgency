#include "..\..\includes\script_component.hpp"

params ["_target"];

if (isNull _target) exitWith {DEBUG_LOG("Target not found")};

[_target, 0, ["ACE_MainActions"], TWC_Insurgency_Actions_recover] call ace_interact_menu_fnc_addActionToObject;

DEBUG_LOG("Added Hand In to Target")
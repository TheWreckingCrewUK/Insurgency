#include "..\..\includes\script_component.hpp"

params ["_crate"];

if (isNull _crate) exitWith {DEBUG_LOG("Crate not found")};

[_crate, 0, ["ACE_MainActions"], TWC_Insurgency_Actions_giveCrate] call ace_interact_menu_fnc_addActionToObject;

DEBUG_LOG("Added Give to Crate");
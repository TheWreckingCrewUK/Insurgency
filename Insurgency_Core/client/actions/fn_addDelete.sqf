#include "..\..\includes\script_component.hpp"

params ["_vehicle"];

if (isNull _vehicle) exitWith {DEBUG_LOG("Crate/Vehicle not found")};

[_vehicle, 0, ["ACE_MainActions"], TWC_Insurgency_Actions_delete] call ace_interact_menu_fnc_addActionToObject;

DEBUG_LOG("Added Delete to Crate/Vehicle");
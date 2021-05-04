#include "..\..\includes\script_component.hpp"

params ["_box", "_table", "_generator"];

if (isNull _box) exitWith {DEBUG_LOG("Box not found")};
if (isNull _table) exitWith {DEBUG_LOG("Table not found")};
if (isNull _generator) exitWith {DEBUG_LOG("Generator not found")};

[_box, 0, ["ACE_MainActions"], TWC_Insurgency_Actions_createPatrolBase] call ace_interact_menu_fnc_addActionToObject;

_box setVariable ["TWC_Insurgency_Generator", _generator];
_box setVariable ["TWC_Insurgency_Table", _table];

DEBUG_LOG("Added Patrol Base Creation to Box");
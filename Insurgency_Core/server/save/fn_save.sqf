#include "..\..\includes\script_component.hpp"

saveGame;

[{call TWC_Insurgency_Save_fnc_save}, [], 300] call CBA_fnc_waitAndExecute;

DEBUG_LOG("Mission Saved");
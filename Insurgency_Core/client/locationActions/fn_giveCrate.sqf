#include "..\..\includes\script_component.hpp"

params ["_crate", "_player"];

["TWC_Insurgency_Locations_giveCrate", [_crate]] call CBA_fnc_serverEvent;

DEBUG_LOG("Giving Crate to Elder");
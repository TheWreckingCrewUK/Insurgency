#include "..\..\includes\script_component.hpp"

params ["_location"];

private _isStronghold = _location getVariable ["TWC_Insurgency_Locations_isStronghold", false];
_location setVariable ["TWC_Insurgency_Locations_isStronghold", !_isStronghold];

["TWC_Insurgency_Save_checkVictory", []] call CBA_fnc_serverEvent;

DEBUG_LOG("Modified Stronghold in location" + text _location);
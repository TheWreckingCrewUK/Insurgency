#include "..\..\includes\script_component.hpp"

params ["_cache", "_killer", "_instigator", "_useEffects"];

private _location = nearestLocation [_cache, ""];
[_location, 20] call TWC_Insurgency_Location_fnc_modifyAllegiance;
[_location] call TWC_Insurgency_Location_fnc_modifyCache;

[-100] call TWC_Insurgency_OPFOR_fnc_updateSupply;

DEBUG_LOG("Cache Destroyed");
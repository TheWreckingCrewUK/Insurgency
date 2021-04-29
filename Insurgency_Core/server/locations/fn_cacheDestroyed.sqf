#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Handle cache destruction from event.
*
* Arguments:
* 0: Cache <OBJECT>
* 1: Killer <OBJECT>
* 2: Instigator <OBJECT>
* 3: Effects <BOOLEAN>
*
* Return Value:
* NONE
*
* Example:
* [_cache, _killer, _instigator, _useEffects] call TWC_Insurgency_Locations_fnc_cacheDestroyed;
*/

params ["_cache", "_killer", "_instigator", "_useEffects"];

private _location = nearestLocation [_cache, ""];
[_location, 20] call TWC_Insurgency_Location_fnc_modifyAllegiance;
[_location] call TWC_Insurgency_Location_fnc_modifyCache;

[-100] call TWC_Insurgency_OPFOR_fnc_updateSupply;

DEBUG_LOG("Cache Destroyed");
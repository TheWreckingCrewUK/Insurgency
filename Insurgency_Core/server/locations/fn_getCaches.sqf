#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Returns all caches.
*
* Arguments:
* NONE
*
* Return Value:
* Caches <ARRAY>
*
* Example:
* call TWC_Insurgency_Locations_fnc_getCaches;
*/

private _allLocations = TWC_Insurgency_Locations;

private _caches = [];
{
	private _hasCache = _x getVariable ["TWC_Insurgency_Locations_hasCache", false];
	if (_hasCache) then {_caches pushBack _x};
} forEach _allLocations;

_caches
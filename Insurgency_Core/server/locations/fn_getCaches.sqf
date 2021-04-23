#include "..\..\includes\script_component.hpp"

private _allLocations = TWC_Insurgency_Locations;

private _caches = [];
{
	private _hasCache = _x getVariable ["TWC_Insurgency_Locations_hasCache", false];
	if (_hasCache) then {_caches pushBack _x};
} forEach _allLocations;

_caches
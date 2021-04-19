#include "..\..\includes\script_component.hpp"

private _allLocations = TWC_Insurgency_Locations;

private _caches = [];
{
	_x getVariable ["TWC_Insurgency_Locations_hasCache", false];
	_caches pushBack _x;
} forEach _allLocations;

_caches
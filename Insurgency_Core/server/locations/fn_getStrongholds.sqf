#include "..\..\includes\script_component.hpp"

private _allLocations = TWC_Insurgency_Locations;

private _strongholds = [];
{
	_x getVariable ["TWC_Insurgency_Locations_isStronghold", false];
	_strongholds pushBack _x;
} forEach _allLocations;

_strongholds
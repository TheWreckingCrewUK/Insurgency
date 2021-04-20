#include "..\..\includes\script_component.hpp"

private _allLocations = TWC_Insurgency_Locations;

private _strongholds = [];
{
	private _isStronghold = _x getVariable ["TWC_Insurgency_Locations_isStronghold", false];
	if (_isStronghold) then {_strongholds pushBack _x};
} forEach _allLocations;

_strongholds
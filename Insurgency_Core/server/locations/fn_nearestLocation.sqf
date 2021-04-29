#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Returns the nearest mission location.
*
* Arguments:
* 0: Position <ARRAY>
*
* Return Value:
* Location <LOCATION>
*
* Example:
* [_pos] call TWC_Insurgency_Locations_fnc_nearestLocation;
*/

params ["_pos"];

private _allLocations = TWC_Insurgency_Locations;
private _distance = INFINITE_DISTANCE;
private _location = locationNull;

{
	private _locationPos = locationPosition _x;
	private _checkDistance = _locationPos distance2d _pos;
	if (_checkDistance < _distance) then {
		_location = _x;
		_distance = _checkDistance;
	};
} forEach TWC_Insurgency_Locations;

_location
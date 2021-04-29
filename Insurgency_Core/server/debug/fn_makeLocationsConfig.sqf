#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Makes Locations from Config. Used to set-up CfgLocations.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Debug_fnc_makeLocationsConfig;
*/

_goodApples = [];

private _allLocations = nearestLocations [[worldSize / 2, worldSize / 2, 0], ["NameLocal", "NameVillage", "NameCity", "NameCityCapital"], worldSize / sqrt(2)];
{
	private _pos = locationPosition _x;
	private _type = type _x;
	private _marker = createMarker [str _forEachIndex, _pos];
	_marker setMarkerType "hd_dot";
	_marker setMarkerText _type;
	
	private _newLocation = [text _x, _type, _pos, size _x];
	_goodApples pushBack _newLocation;
} forEach _allLocations;

copyToClipboard str _goodApples;
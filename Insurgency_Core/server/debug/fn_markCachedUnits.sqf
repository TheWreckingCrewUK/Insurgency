#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Marks Cached Units on Map.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Debug_fnc_markCachedUnits;
*/

private _cachedUnits = TWC_Insurgency_troopsOPFOR;

{
	_x params ["_pos", "_units"];
	
	private _amount = count _units;
	private _text = format ["OPFOR Units: %1", _amount];
	
	private _marker = createMarkerLocal ["debug_unit_" + str _forEachIndex, _pos];
	_marker setMarkerColorLocal "colorOPFOR";
	_marker setMarkerTypeLocal "hd_dot";
	_marker setMarkerText _text;
} forEach _cachedUnits;
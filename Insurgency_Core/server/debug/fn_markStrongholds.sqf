#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Marks Strongholds on Map.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Debug_fnc_markStrongholds;
*/

private _strongholds = call TWC_Insurgency_Locations_fnc_getStrongholds;

{
	private _pos = locationPosition _x;
	
	private _marker = createMarkerLocal ["debug_stronghold_" + str _forEachIndex, _pos];
	_marker setMarkerColorLocal "colorOPFOR";
	_marker setMarkerTypeLocal "hd_objective";
	_marker setMarkerText "Stronghold";
} forEach _strongholds;
#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Unmarks Cached Units from Map.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Debug_fnc_unmarkCachedUnits;
*/

private _allMarkers = allMapMarkers;
private _unitMarkers = _allMarkers select {"unit" in _x};
{deleteMarker _x} forEach _unitMarkers;
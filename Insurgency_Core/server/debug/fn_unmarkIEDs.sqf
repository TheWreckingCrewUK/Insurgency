#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Unmarks IEDs from Map.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Debug_fnc_unmarkIEDs;
*/

private _allMarkers = allMapMarkers;
private _mineMarkers = _allMarkers select {"mine" in _x};
{deleteMarker _x} forEach _mineMarkers;
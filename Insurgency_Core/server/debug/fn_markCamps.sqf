#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Marks Camps on Map.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Debug_fnc_markCamps;
*/

private _allCamps = TWC_Insurgency_OPFOR_Camps;

{
	_marker setMarkerAlpha 1;
} forEach _allCamps;
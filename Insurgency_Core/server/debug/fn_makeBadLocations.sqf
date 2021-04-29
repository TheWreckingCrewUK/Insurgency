#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Makes Locations Bad Manually. Deprecated.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Debug_fnc_makeBadLocations;
*/

openMap true;

badApples = [];
onMapSingleClick {
	private _location = nearestLocation [_pos, ""];
	_badApples append [text _location];
	copyToClipboard str badApples;
};
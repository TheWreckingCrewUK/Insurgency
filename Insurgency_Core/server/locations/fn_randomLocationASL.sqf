#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Returns a random position ASL in a random location.
*
* Arguments:
* 0: Radius <NUMBER>
*
* Return Value:
* Position <ARRAY>
*
* Example:
* [_radius] call TWC_Insurgency_Locations_fnc_randomLocationASL;
*/

params ["_radius"];

//When using this, make sure you use setPosASL instead of setPos!
private _location = selectRandom TWC_Insurgency_Locations;
private _locationPos = locationPosition _location;
private _pos = [[[_locationPos, _radius]]] call BIS_fnc_randomPos;
_pos set [2, getTerrainHeightASL _pos];
_pos
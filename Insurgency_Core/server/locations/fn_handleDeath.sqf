#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Handles civilian death event.
*
* Arguments:
* 0: Civilian <OBJECT>
* 1: Killer <OBJECT>
* 2: Instigator <OBJECT>
* 3: Effects <BOOLEAN>
*
* Return Value:
* NONE
*
* Example:
* [_civ, _killer, _instigator, _useEffect] call TWC_Insurgency_Locations_fnc_handleDeath;
*/

params ["_unit", "_killer", "_instigator", "_useEffects"];

private _playerside = getNumber (missionConfigFile >> "TWC_Insurgency" >> "playerSide");
_playerside = _playerside call BIS_fnc_sideType;

private _instigator = _unit getVariable ["ace_medical_lastDamageSource", _instigator];
if (side _instigator != _playerside) exitWith {DEBUG_LOG(str _unit + " killed by non-players.")};

private _nearestLocation = (group _unit) getVariable ["TWC_Insurgency_Location", nearestLocation [_unit, ""]];

private _change = [-5, -20] select (leader _unit == _unit);

[_nearestLocation, _change] call TWC_Insurgency_Locations_fnc_modifyAllegiance;

DEBUG_LOG(str _unit + " civ killed by " + str _instigator);
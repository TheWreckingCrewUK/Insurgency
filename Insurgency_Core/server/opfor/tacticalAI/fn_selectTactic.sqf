#include "..\..\..\includes\script_component.hpp"

params ["_groups", "_BLUFOR", ["_location", locationNull]];

//Start completely unwilling to fight
private _aggression = 0;

//Get a ratio of OPFOR to BLUFOR troops so we get an idea of how aggressive we can be
private _unitsOPFOR = 0;
{
	_unitsOPFOR = _unitsOPFOR + (count units _x);
} forEach _groups;

private _unitsBLUFOR = count _BLUFOR;

private _unitsRatio = _unitsOPFOR / _unitsBLUFOR;
_aggression = _unitsRatio;

//Check if the AI needs to care extra much about a possible location it is defending
if !(isNull _location) then {
	private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
	_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task"];
	if (_hasCache) then {
		_aggression = _aggression + 1;
	};
	if (_isStronghold) then {
		_aggression = _aggression + 2;
	};
};

//Possible tactical postures in format [defending, skirmishing, attacking, flanking]
private _retreating = [0, 0, 0, 0];
private _defensive = [3, 2, 0, 0];
private _balanced = [1, 1, 2, 1];
private _ambushing = [1, 2, 0, 2];
private _aggressive = [0, 0, 3, 2];
private _wave = [0, 0, 5, 0];

private _tactics = [_defensive, _balanced, _ambushing, _aggressive, _wave];

//Select Tactic
private _tactic = _tactics select (_aggression min 4);

//Adjust the tactical posture for the amount of groups we're actually controlling.
private _groupCount = count _groups;
private _ratio = _groupCount / 5;
{
	_tactic set [_forEachIndex, round(_x * _ratio)];
} forEach _tactic;

DEBUG_LOG("Tactic selected: " + str _tactic + " at " + text _location);

_tactic
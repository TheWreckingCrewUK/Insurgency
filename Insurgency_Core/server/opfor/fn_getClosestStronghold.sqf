#include "..\..\includes\script_component.hpp"

params ["_pos", ["_returnActive", false]];

private _strongholds = call TWC_Insurgency_Locations_fnc_getStrongholds;

if (count _strongholds isEqualTo 0) exitWith {[locationNull, -1]};

private _stronghold = locationNull;
private _strongholdDistance = INFINITE_DISTANCE;
{
	private _location = _x;
	private _isActive = _location getVariable ["TWC_Insurgency_Locations_isActive", false];
	if (!_isActive || (_returnActive && _isActive)) then {
		private _strongholdPos = locationPosition _location;
		private _distance = _strongholdPos distance2d _pos;
		if (_distance < _strongholdDistance) then {
			_strongholdDistance = _distance;
			_stronghold = _location;
		};
	};
} forEach _strongholds;

[_stronghold, _strongholdDistance]
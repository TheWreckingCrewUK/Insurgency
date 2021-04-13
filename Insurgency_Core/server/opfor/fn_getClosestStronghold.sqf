#include "..\..\includes\script_component.hpp"

params ["_pos"];

private _strongholds = TWC_Insurgency_Locations select {_x select 1};

if (count _strongholds == 0) exitWith {[locationNull, 0]};

private _stronghold = locationNull;
private _strongholdDistance = INFINITE_DISTANCE;
{
	private _location = _x select 0;
	private _strongholdPos = locationPosition _location;
	private _distance = _strongholdPos distance2d _pos;
	if (_distance < _strongholdDistance) then {
		_strongholdDistance = _distance;
		_stronghold = _location;
	};
} forEach _strongholds;

[_stronghold, _strongholdDistance]
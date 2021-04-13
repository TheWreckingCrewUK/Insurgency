#include "..\..\..\includes\script_component.hpp"

params ["_groups", "_location"];

if (isNull _location) exitWith {DEBUG_LOG(str _groups + " are not defending a location.");};

{
	private _group = _x;
	if !(vehicle leader _group isKindOf "StaticWeapon") then {
		private _locationPos = locationPosition _location;
		
		private _size = count units _group;
		private _radius = random (_size * 50);
		
		[_group, _locationPos, _radius, 8, "MOVE", "AWARE", "YELLOW", "NORMAL", "COLUMN"] call CBA_fnc_taskPatrol;
	};
} forEach _groups;

DEBUG_LOG(text _location + " has defences deployed.");
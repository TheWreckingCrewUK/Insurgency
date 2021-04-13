#include "..\..\..\includes\script_component.hpp"

params ["_group", "_BLUFOR", ["_location", locationNull]];

private _groupPos = getPos leader _group;

private _defendPos = if (isNull _location) then {
	_groupPos;
} else {
	_location;
};

[_group, _defendPos, 300, 3, false, true] call CBA_fnc_taskDefend;

DEBUG_LOG(str _group + " received order defend.");
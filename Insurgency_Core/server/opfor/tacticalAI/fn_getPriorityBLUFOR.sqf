#include "..\..\..\includes\script_component.hpp"

params ["_BLUFOR"];

//Find out the highest cost target, these are the most dangerous according to Arma AI and they're never wrong
private _priorityTarget = [];
private _priority = 0;
{
	if (_x select 2 > _priority) then {
		_priorityTarget = _x;
		_priority = _x select 2;
	};
} forEach _BLUFOR;

_priorityTarget
#include "..\..\includes\script_component.hpp"

private _parentTask = "civTasks";
private _currentTasks = _parentTask call BIS_fnc_taskChildren;
private _highestTask = 0;
{
	private _taskID = parseNumber _x;
	if (_taskID < _highestTask) then {
		_highestTask = _taskID;
	};
} forEach _currentTasks;

[str (_highestTask - 1), _parentTask]
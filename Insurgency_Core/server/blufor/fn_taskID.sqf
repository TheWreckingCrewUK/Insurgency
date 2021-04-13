#include "..\..\includes\script_component.hpp"

params ["_oldID"];

private _parentTask = _oldID call BIS_fnc_taskParent;
private _currentTasks = _parentTask call BIS_fnc_taskChildren;
private _highestTask = 0;
{
	private _taskID = parseNumber _x;
	if (_taskID > _highestTask) then {
		_highestTask = _taskID;
	};
} forEach _currentTasks;

[_parentTask, str (_highestTask + 1)]
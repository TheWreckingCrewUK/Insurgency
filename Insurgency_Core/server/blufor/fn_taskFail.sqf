#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Fails an active task.
*
* Arguments:
* 0: Task ID <STRING>
*
* Return Value:
* NOTHING
*
* Example:
* ["1"] call TWC_Insurgency_BLUFOR_fnc_taskFail;
*/

params ["_task"];

[_task, "FAILED", false] call BIS_fnc_taskSetState;

private _newID = [_task] call TWC_Insurgency_BLUFOR_fnc_taskID;
[{
	_this call TWC_Insurgency_BLUFOR_fnc_taskCreate;
}, _newID, 5] call CBA_fnc_waitAndExecute;

DEBUG_LOG("BLUFOR Task Failed");
#include "..\..\includes\script_component.hpp"

params ["_taskNumber"];

[_taskNumber, "CANCELED", false] call BIS_fnc_taskSetState;

private _newID = [_taskNumber] call TWC_Insurgency_BLUFOR_fnc_taskID;
[{
	_this call TWC_Insurgency_BLUFOR_fnc_taskCreate;
}, _newID, 5] call CBA_fnc_waitAndExecute;

DEBUG_LOG("BLUFOR Task Canceled");
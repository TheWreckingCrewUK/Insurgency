#include "..\..\includes\script_component.hpp"

params ["_target"];

private _task = _target getVariable ["TWC_Insurgency_BLUFOR_Task", ""];

deleteVehicle _target;

[_task] call TWC_Insurgency_BLUFOR_fnc_taskSucceed;
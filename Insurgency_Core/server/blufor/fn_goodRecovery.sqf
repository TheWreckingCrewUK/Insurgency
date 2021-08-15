#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Recovers a vehicle or person to base and succeeds any associated tasks with it.
*
* Arguments:
* 0: Vehicle or Man <OBJECT>
*
* Return Value:
* NONE
*
* Example:
* [_vehicle] call TWC_Insurgency_BLUFOR_fnc_goodRecovery;
*/

params ["_target"];

private _task = _target getVariable ["TWC_Insurgency_BLUFOR_Task", ""];

[_task] call TWC_Insurgency_BLUFOR_fnc_taskSucceed;

deleteVehicle _target;
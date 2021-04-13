#include "..\..\includes\script_component.hpp"

params ["_box", "_player"];

private _generator = _box getVariable ["TWC_Insurgency_Generator", objNull];
private _table = _box getVariable ["TWC_Insurgency_Table", objNull];

["TWC_Insurgency_BLUFOR_createPatrolBase", [_box, _generator, _table]] call CBA_fnc_serverEvent;

DEBUG_LOG("Patrol Base Deployed");
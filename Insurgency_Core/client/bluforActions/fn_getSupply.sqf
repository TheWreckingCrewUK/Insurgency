#include "..\..\includes\script_component.hpp"

params ["_target", "_player"];

private _supply = TWC_Insurgency_supplyBLUFOR;

private _message = format ["We currently have %1 supply.", _supply];

["Command", _message] spawn BIS_fnc_showSubtitle;
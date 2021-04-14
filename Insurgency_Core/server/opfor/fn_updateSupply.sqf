#include "..\..\includes\script_component.hpp"

params ["_change"];

TWC_Insurgency_supplyOPFOR = (TWC_Insurgency_supplyOPFOR + _change) max 0;

["TWC_Insurgency_Save_checkVictory", []] call CBA_fnc_serverEvent;
params ["_change"];

TWC_Insurgency_supplyBLUFOR = (TWC_Insurgency_supplyBLUFOR + _change) max 0;

["TWC_Insurgency_Actions_getSupply", TWC_Insurgency_supplyBLUFOR] call CBA_fnc_globalEvent;
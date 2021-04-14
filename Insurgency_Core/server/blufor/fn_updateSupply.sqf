params ["_change"];

private _supply = TWC_Insurgency_supplyBLUFOR;
_supply = _supply + _change;

if (_supply < 0) then {
	"Defeat" call BIS_fnc_endMissionServer;
};

TWC_Insurgency_supplyBLUFOR = _supply max 0;

["TWC_Insurgency_Actions_getSupply", _supply] call CBA_fnc_globalEvent;
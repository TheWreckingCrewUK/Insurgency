private _cachedUnits = TWC_Insurgency_troopsOPFOR;

{
	_x params ["_pos", "_units"];
	
	private _amount = count _units;
	private _text = format ["OPFOR Units: %1", _amount];
	
	private _marker = createMarkerLocal ["debug_unit_" + str _forEachIndex, _pos];
	_marker setMarkerColorLocal "colorOPFOR";
	_marker setMarkerTypeLocal "hd_dot";
	_marker setMarkerText _text;
} forEach _cachedUnits;
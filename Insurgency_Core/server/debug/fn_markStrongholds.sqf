private _locations = call TWC_Insurgency_Locations;
_locations = _locations select {_x select 1};

{
	private _pos = locationPosition _x;
	
	private _marker = createMarkerLocal ["debug_stronghold_" + str _forEachIndex, _pos];
	_marker setMarkerColorLocal "colorOPFOR";
	_marker setMarkerTypeLocal "hd_objective";
	_marker setMarkerText "Stronghold";
} forEach _locations;
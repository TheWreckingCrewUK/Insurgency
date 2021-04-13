private _allMines = allMines;

{
	private _mine = _x;
	private _pos = getPos _mine;
	private _marker = createMarkerLocal ["debug_mine_" + str _forEachIndex, _pos];
	_marker setMarkerTypeLocal "hd_dot";
	_marker setMarkerColorLocal "ColorBrown";
	_marker setMarkerText (typeOf _mine);
} forEach _allMines;
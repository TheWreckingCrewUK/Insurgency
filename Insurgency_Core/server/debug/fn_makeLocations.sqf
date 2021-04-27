openMap true;

goodApples = [];
lastPos = [0,0,0];
index = 0;

onMapSingleClick {
	if (_shift) then {
		if (_lastPos isEqualTo [0,0,0]) exitWith {hint "Click a position first"};
		
		private _size = ceil (lastPos distance2d _pos);
		_size = (round _size / 10) * 10;
		hint str _size;
		
		private _lastElement = count goodApples - 1;
		private _locationInfo = goodApples select _lastElement;
		_locationInfo set [3, _size];
		goodApples set [_lastElement, _locationInfo];
		
		private _marker = createMarker [str index, lastPos];
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [_size, _size];
		index = index + 1;
		
		lastPos = [0,0,0];
	} else {
		lastPos = _pos;
		private _location = nearestLocation [_pos, ""];
		private _type = type _location;
		private _newLocation = [text _location, _type, _pos, 0];
		hint "Shift-Click to set Size";
		goodApples pushBack _newLocation;
	};
	copyToClipboard str goodApples;
};
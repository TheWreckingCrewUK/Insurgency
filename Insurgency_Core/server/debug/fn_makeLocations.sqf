openMap true;

goodApples = [];
lastPos = [0,0,0];
index = 0;

onMapSingleClick {
	if (_shift) then {
		private _size = ceil (lastPos distance2d _pos);
		hint str _size;
		
		private _lastElement = count goodApples - 1;
		private _locationInfo = goodApples select _lastElement;
		_locationInfo set [3, _size];
		goodApples set [_lastElement, _locationInfo];
		
		private _marker = createMarker [str index, lastPos];
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [_size, _size];
		index = index + 1;
	} else {
		lastPos = _pos;
		private _location = nearestLocation [_pos, ""];
		private _type = type _location;
		private _newLocation = [text _location, _pos, _type, 0];
		hint str _newLocation;
		goodApples pushBack _newLocation;
	};
	copyToClipboard str goodApples;
};
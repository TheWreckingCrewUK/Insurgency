private _allMarkers = allMapMarkers;
private _unitMarkers = _allMarkers select {"unit" in _x};
{deleteMarker _x} forEach _unitMarkers;
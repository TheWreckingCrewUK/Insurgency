private _allMarkers = allMapMarkers;
private _mineMarkers = _allMarkers select {"mine" in _x};
{deleteMarker _x} forEach _mineMarkers;
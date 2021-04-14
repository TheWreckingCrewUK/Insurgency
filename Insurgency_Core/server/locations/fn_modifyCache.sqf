params ["_location"];

private _locationArray = [_location] call TWC_Insurgency_Location_fnc_getInfo;
_locationArray params ["_locationInfo", "_locationIndex"];
_locationInfo params ["_location", "_isStronghold", "_hasCache", "_allegiance"];

TWC_Insurgency_Locations set [_locationIndex, [_location, _isStronghold, !_hasCache, _allegiance]];

["TWC_Insurgency_Save_checkVictory", []] call CBA_fnc_serverEvent;
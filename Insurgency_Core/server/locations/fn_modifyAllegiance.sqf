params ["_location", "_change"];

private _locationArray = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationArray params ["_locationInfo", "_locationIndex"];
_locationInfo params ["_location", "_isStronghold", "_hasCache", "_allegiance"];

//Calculate new allegiance and store it back in the master array
private _allegiance = ((_allegiance + _change) min 100) max 0;
TWC_Insurgency_Locations set [_locationIndex, [_location, _isStronghold, _hasCache, _allegiance]];

//Set the area marker colour
private _marker = "TWC_Marker_" + text _location;
if (_allegiance < 30) then {
	_marker setMarkerColor "colorOPFOR";
} else {
	if (_allegiance < 70) then {
		_marker setMarkerColor "ColorUNKNOWN";
	} else {
		_marker setMarkerColor "colorIndependent";
		
		//If there is a pacify task we have to let it know if a location is pacified.
		["TWC_Insurgency_BLUFOR_pacifyRegion", [_location]] call CBA_fnc_serverEvent;
	};
};



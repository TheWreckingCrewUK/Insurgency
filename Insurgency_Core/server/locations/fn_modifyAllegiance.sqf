#include "..\..\includes\script_component.hpp"

params ["_location", "_change"];

private _allegiance = _location getVariable ["TWC_Insurgency_Locations_allegiance", 0];
_allegiance = ((_allegiance + _change) min 100) max 0;
_location setVariable ["TWC_Insurgency_Locations_allegiance", _allegiance];

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

DEBUG_LOG("Modified Allegiance in location" + text _location + " by " + str _change);
params ["_location"];

private _locationIndex = TWC_Insurgency_Locations findIf {
	(_x select 0) isEqualTo _location
};
private _locationInfo = TWC_Insurgency_Locations select _locationIndex;
[_locationInfo, _locationIndex]
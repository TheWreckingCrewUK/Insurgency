params ["_previousObject", "_newObject", "_isRuin"];

if (_isRuin) then {
	private _location = [getPos _newObject] call TWC_Insurgency_Locations_fnc_nearestLocation;
	[_location, -5] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
};
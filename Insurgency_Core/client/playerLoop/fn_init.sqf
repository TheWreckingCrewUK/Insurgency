private _allLocations = call TWC_Insurgency_playerLoop_fnc_locations;

[{_this call TWC_Insurgency_playerLoop_fnc_playerLoop;}, [_allLocations], 5] call CBA_fnc_waitAndExecute;
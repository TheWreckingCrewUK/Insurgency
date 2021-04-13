private _allLocations = nearestLocations [[worldSize / 2, worldSize / 2, 0], ["NameCity","NameCityCapital","NameVillage","NameLocal"], worldSize / sqrt(2)];
private _badLocations = getArray (missionConfigFile >> "TWC_Insurgency" >> "invalidTowns");
_allLocations = _allLocations select {
	!(text _x in _badLocations)
};

_allLocations
#include "..\..\includes\script_component.hpp"

//Create locations from config.
_allLocations = [];
private _locationConfigs = "true" configClasses (missionConfigFile >> "CfgLocations");
{
	private _config = _x;
	private _name = getText (_config >> "name");
	private _type = getText (_config >> "type");
	private _pos = getArray (_config >> "position");
	private _size = getNumber (_config >> "size");
	
	private _location = createLocation [_type, _pos, _size, _size];
	_location setText _name;
	_allLocations pushBack _location;

	//Create Zone Markers for all Locations.
	//private _marker = "TWC_Marker_" + configName _x;
	private _markerName = "TWC_Marker_" + _name;
	private _marker = createMarker [_markerName, _pos];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerColor "colorOPFOR";
	_marker setMarkerSize [_size, _size];
} forEach _locationConfigs;

//Find Base Position from map marker
private _basePos = getMarkerPos "BASE";

//Decide which locations are strongholds.
private _strongholds = [];
private _possibleStrongholds = _allLocations select {
	private _testLocation = _x;
	private _correctType = type _testLocation in ["NameCity","NameCityCapital"];
	
	private _pos = locationPosition _testLocation;
	private _awayFromBase = (_pos distance2d _basePos) > 4000;
	
	private _awayFromStronghold = count (_strongholds select {_x distance2d _testLocation > 3000}) < 1;
	
	_correctType && _awayFromBase && _awayFromStronghold
};

for "_i" from 1 to getNumber (missionConfigFile >> "TWC_Insurgency" >> "strongholdCount") do {
	private _newStronghold = selectRandom _possibleStrongholds;
	_strongholds pushBack _newStronghold;
	_possibleStrongholds = _possibleStrongholds - [_newStronghold];
};

//Decide where to put caches
private _caches = [];
private _possibleCaches = _allLocations select {
	private _notStronghold = !(_x in _strongholds);
	
	private _pos = locationPosition _x;
	private _awayFromBase = (_pos distance2d _basePos) > 1000;
	
	_notStronghold && _awayFromBase
};

for "_i" from 1 to getNumber (missionConfigFile >> "TWC_Insurgency" >> "cacheCount") do {
	private _newCache = selectRandom _possibleCaches;
	_caches pushBack _newCache;
	_possibleCaches = _possibleCaches - [_newCache];
	[_newCache] call TWC_Insurgency_Locations_fnc_spawnCache;
};

//Declare what locations there are, whether they are a stronghold, contain a cache, and their allegiance.
{
	private _distance = (getPos _x) distance2D _basePos;
	private _allegiance = if (_distance < 3000) then {
		("TWC_Marker_" + text _x) setMarkerColor "colorUnknown";
		30
	} else {
		0
	};
	
	_x setVariable ["TWC_Insurgency_Locations_isStronghold", _x in _strongholds];
	_x setVariable ["TWC_Insurgency_Locations_hasCache", _x in _caches];
	_x setVariable ["TWC_Insurgency_Locations_allegiance", _allegiance];
	_x setVariable ["TWC_Insurgency_Locations_isActive", false];
	_x setVariable ["TWC_Insurgency_Locations_elderGroup", grpNull];
	_x setVariable ["TWC_Insurgency_Locations_civGroup", grpNull];
} forEach _allLocations;

TWC_Insurgency_Locations = _allLocations;

//Add an eventHandler for location activation/deactivation.
["TWC_Insurgency_Locations_Activate", {
	_this spawn TWC_Insurgency_Locations_fnc_townActivate;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Locations_Deactivate", {
	_this spawn TWC_Insurgency_Locations_fnc_townDeactivate;
}] call CBA_fnc_addEventHandler;

//Handlers for elder interactions.
["TWC_Insurgency_Locations_questionElder", {
	_this call TWC_Insurgency_Locations_fnc_questionElder;
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Locations_getElderTask", {
	_this call TWC_Insurgency_Locations_fnc_getElderTask;
}] call CBA_fnc_addEventHandler;

//Handler for building destruction
addMissionEventHandler ["BuildingChanged", {
	_this spawn TWC_Insurgency_Locations_fnc_handleDestruction;
}];

//Civilian tasks main task, all civilian tasks are subtasks of this one, doesn't complete or fail.
private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
[_playerside, "civTasks", "civTasks", objNull, "CREATED", -1, false, "meet", false] call BIS_fnc_taskCreate;

DEBUG_LOG("Locations Init Complete");
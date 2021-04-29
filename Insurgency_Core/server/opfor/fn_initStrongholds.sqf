#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Initialise cached units/statics at stronghold and deduct the necessary supplies/manpower.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_OPFOR_fnc_initStrongholds;
*/

//Get strongholds from the locations array
private _strongholds = call TWC_Insurgency_Locations_fnc_getStrongholds;
private _strongholdCount = count _strongholds;

//We'll use half of our supply and manpower in building strongholds
private _manpower = TWC_Insurgency_manpowerOPFOR;
private _supply = TWC_Insurgency_supplyOPFOR;

_supply = _supply / 4;
_manpower = _manpower / 2;

//Of this manpower/supply we want to use an equal amount on all strongholds
_supply = _supply / _strongholdCount;
_manpower = _manpower / _strongholdCount;

//Read the enemies from config
private _section = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_section");
private _sectionAT = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_sectionAT");
private _sectionAA = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_sectionAA");
private _sectionMG = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_sectionMG");
private _sniper = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_sniper");

private _staticMG = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_staticMG");
private _staticAA = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_staticAA");
private _staticAT = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_staticAT");
private _staticMortar = getArray (missionConfigFile >> "TWC_Insurgency" >> "opfor_staticMortar");

private _statics = [];
{
	_statics append _x;
} forEach [_staticMG, _staticAA, _staticAT];

//Mortars together strong, reserve some supplies for statics
private _mortarCount = count _staticMortar;
private _usedSupply = _supply * 0.2;
private _staticCount = _usedSupply / 3;
private _usedManpower = _staticCount;

//Spawn two AA teams
private _AACount = 2;
_usedManpower = _usedManpower + _AACount * (count _sectionAA);
_usedSupply = _usedSupply + _AACount * (count _sectionAA);

//Spawn in as many sections as we can with the remaining manpower/supplies
private _sectionCount = (_manpower - _usedManpower) / (count _section);
_usedManpower = _usedManpower + _sectionCount * (count _section);
_usedSupply = _usedSupply + _sectionCount * (count _section);

//Update the global manpower/supply variables
[-1 * _usedManpower] call TWC_Insurgency_OPFOR_fnc_updateManpower;
[-1 * _usedSupply] call TWC_Insurgency_OPFOR_fnc_updateSupply;

DEBUG_LOG("Reserved " + str _usedManpower + " manpower and " + str _usedSupply + " supply per stronghold.");

//Loop through the strongholds to build them, not actually spawning them but adding them with positions to the global enemies array
{
	private _location = _x;
	private _locationPos = locationPosition _location;
	private _marker = "TWC_Marker_" + text _location;
	
	//Mortars often fall through the ground and spawn on uneven terrain.
	//_mortarPos = _locationPos findEmptyPosition [0, 100, selectRandom _staticMortar];
	private _mortarPos = ((selectBestPlaces [_locationPos, 100, "houses", 50, 1]) select 0) select 0;
	private _mortarHeight = getTerrainHeightASL _mortarPos;
	_mortarPos set [2, _mortarHeight];
	TWC_Insurgency_troopsOPFOR pushBack [_mortarPos, _staticMortar];
	
	for "_i" from 1 to _sectionCount do {
		private _pos = [[_marker]] call BIS_fnc_randomPos;
		TWC_Insurgency_troopsOPFOR pushBack [_pos, _section];
	};
	for "_i" from 1 to _AACount do {
		private _pos = [[_marker]] call BIS_fnc_randomPos;
		TWC_Insurgency_troopsOPFOR pushBack [_pos, _sectionAA];
	};
	
	//Spawning the statics, it's a PITA. They often spawn on walls with doors, or ruins.
	private _occupiedPositions = [];
	for "_i" from 1 to _staticCount do {
		private _pos = [[_marker], _occupiedPositions] call BIS_fnc_randomPos;
		
		private _buildings = [_pos, 3] call TWC_Insurgency_OPFOR_fnc_findBuildings;
		
		private _building = if (count _buildings == 0) then {
			private _buildingInfo = _pos call CBA_fnc_getNearestBuilding;
			_buildingInfo select 0
		} else {
			selectRandom _buildings;
		};
		
		private _pos = getPos _building;
		private _posRel = (boundingBoxReal _building) select 0;
		private _height = abs (_posRel select 2) * 2;
		private _ASL = (getPosASL _building) select 2;
		_pos set [2, _ASL + _height];
		
		_occupiedPositions pushBack [_pos, 100];
		
		TWC_Insurgency_troopsOPFOR pushBack [_pos, [selectRandom _statics]];
	};
	
	DEBUG_LOG("Initialized " + text _location);
} forEach _strongholds;
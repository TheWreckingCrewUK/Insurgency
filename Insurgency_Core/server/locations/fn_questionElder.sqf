#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Checks what intel is available and selects a random nugget to give to the player with allegiance-dependent quality.
*
* Arguments:
* 0: Player <OBJECT>
* 1: Location <LOCATION>
*
* Return Value:
* NONE
*
* Example:
* [_player, _location] call TWC_Insurgency_Locations_fnc_questionElder;
*/

params ["_player", "_location"];

private _groups = missionNameSpace getVariable [text _location, []];
private _elderGroup = (_groups select 0) select 0;
private _elder = leader _elderGroup;

private _lastQuestioned = _elder getVariable ["TWC_Insurgency_Locations_questionDelay", -600];
if (_lastQuestioned + 600 > CBA_missionTime) exitWith {
	["TWC_Insurgency_Actions_questionElder", ["failure"], _player] call CBA_fnc_targetEvent;
	DEBUG_LOG(text _location + " elder was questioned less than 10 minutes ago");
};

_elder setVariable ["TWC_Insurgency_Locations_questionDelay", CBA_missionTime];

private _locationInfo = _location call TWC_Insurgency_Locations_fnc_getInfo;
_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup", "_task"];

private _chance = switch (true) do {
	case (_allegiance < 20): {0};
	case (_allegiance < 40): {0.3};
	case (_allegiance < 60): {0.4};
	case (_allegiance < 80): {0.5};
	default {0.6};
};

if (random 1 < _chance) then {
	DEBUG_LOG("Succesful roll for info");
	
	_allLocations = TWC_Insurgency_Locations;
	
	//Build arrays of what possible intel there is.
	private _caches = call TWC_Insurgency_Locations_fnc_getCaches;
	private _strongholds = call TWC_Insurgency_Locations_fnc_getStrongholds;
	
	//Manpower
	private _manpower = TWC_Insurgency_manpowerOPFOR;
	private _manpowerStrength = [_manpower, _manpower, _manpower];
	
	//Supplies
	private _supply = TWC_Insurgency_supplyOPFOR;
	private _supplyStrength = [_supply, _supply, _supply];
	
	private _total = [];
	{
		_total append _x;
	} forEach [_caches, _strongholds, _supplyStrength, _manpowerStrength]; //ADD NEW INTEL TYPES HERE TOO
	
	private _intelLocation = selectRandom _total;
	_intelQuality = switch (true) do {
		case (_allegiance < 30): {1000};
		case (_allegiance < 40): {800};
		case (_allegiance < 50): {600};
		case (_allegiance < 60): {400};
		case (_allegiance < 70): {200};
		case (_allegiance < 80): {100};
		case (_allegiance < 90): {75};
		case (_allegiance < 100): {50};
		default {25};
	};
	private _intelType = switch (true) do {
		case (_intelLocation in _caches): {"cache"};
		case (_intelLocation in _strongholds): {"stronghold"};
		case (_intelLocation in _supplyStrength): {"supply"};
		case (_intelLocation in _manpowerStrength): {"manpower"};
		default {DEBUG_LOG(text _location + " elder could not give intel")};
	};
	
	if (_intelType in ["cache", "stronghold"]) then {
		private _markerType = switch (_intelType) do {
			case ("cache"): {"hd_destroy"};
			case ("stronghold"): {"hd_objective"};
		};
		private _markerPos = [[[locationPosition _intelLocation, _intelQuality]]] call BIS_fnc_randomPos;
		private _marker = createMarkerLocal [text _intelLocation + _intelType + str _intelQuality, _markerPos];
		_marker setMarkerTypeLocal _markerType;
		_marker setMarkerTextLocal format ["<%1m", _intelQuality];
		_marker setMarkerColor "ColorOrange";
	};
	
	["TWC_Insurgency_Actions_questionElder", [_intelType, _intelLocation, _intelQuality], _player] call CBA_fnc_targetEvent;
} else {
	DEBUG_LOG("Unsuccesful roll for info");
	["TWC_Insurgency_Actions_questionElder", ["failure"], _player] call CBA_fnc_targetEvent;
};
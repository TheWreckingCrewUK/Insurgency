#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Initializes the save loop and handles victory/defeat/relations.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Save_fnc_init;
*/

if (!isServer) exitWith {DEBUG_LOG("Save Init not executed on client.")};

private _saveInfo = profileNamespace getVariable [missionName, []];

if (count _saveInfo > 0) then {
	[{
		_this params ["_supplyBLUFOR", "_supplyOPFOR", "_manpowerOPFOR", "_troopsOPFOR", "_oldLocations"];
		
		TWC_Insurgency_supplyBLUFOR = _supplyBLUFOR;
		TWC_Insurgency_supplyOPFOR = _supplyOPFOR;
		TWC_Insurgency_manpowerOPFOR = _manpowerOPFOR;
		
		{
			_x params ["_location", "_oldAllegiance"];
			
			private _newAllegiance = _location getVariable ["TWC_Insurgency_Locations_allegiance", 0];
			[_location, _oldAllegiance - _newAllegiance] call TWC_Insurgency_Locations_fnc_modifyAllegiance;
		} forEach _oldLocations;
	}, _saveInfo, 5] call CBA_fnc_waitAndExecute;
};

//Handle saving
["TWC_Insurgency_Save_save", {
	[] spawn TWC_Insurgency_Save_fnc_save;
}] call CBA_fnc_addEventHandler;

//Saves when someones disconnects, and if no more players, it shuts down the mission.
addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	
	saveGame;
	private _playerCount = count (call BIS_fnc_listPlayers);
	if (_playerCount isEqualTo 0) then {
		"Paused" call BIS_fnc_endMissionServer;
	};
}];

//Decide if we have won on event.
["TWC_Insurgency_Save_checkVictory", {
	call TWC_Insurgency_Save_fnc_checkVictory;
}] call CBA_fnc_addEventHandler;

private _playerSide = call TWC_Insurgency_BLUFOR_fnc_playerSide;
private _friendlySide = call TWC_Insurgency_GREENFOR_fnc_friendlySide;
private _enemySide = call TWC_Insurgency_OPFOR_fnc_enemySide;

//Players will be friendly to civs, GREENFOR, hostile to enemies.
_playerSide setFriend [_friendlySide, 1];
_playerSide setFriend [civilian, 1];
_playerSide setFriend [_enemySide, 0];

//Enemies will be friendly to civs, hostile to players and GREENFOR.
_enemySide setFriend [_friendlySide, 0];
_enemySide setFriend [_playerSide, 0];
_enemySide setFriend [civilian, 1];

//Friendlies will be friendly to civs, players, hostile to enemies
_friendlySide setFriend [_enemySide, 0];
_friendlySide setFriend [_playerSide, 1];
_friendlySide setFriend [civilian, 1];

//Civs will be friendly to players, GREENFOR, enemies.
civilian setFriend [_enemySide, 1];
civilian setFriend [_playerSide, 1];
civilian setFriend [_friendlySide, 1];
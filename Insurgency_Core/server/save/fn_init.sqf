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

//A loop to save the game in case of crashing.
[{call TWC_Insurgency_Save_fnc_save}, [], 300] call CBA_fnc_waitAndExecute;

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
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
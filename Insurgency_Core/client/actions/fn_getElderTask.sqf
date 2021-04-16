#include "..\..\includes\script_component.hpp"

params ["_elder", "_player"];

private _nearestLocation = (group _elder) getVariable ["TWC_Insurgency_Location", nearestLocation [_elder, ""]];

private _id = ["TWC_Insurgency_Actions_getElderTask", {
	_this params ["_message"];
	_thisArgs params ["_player"];
	
	_player setVariable ["TWC_Insurgency_Actions_elderTask", _message];
	DEBUG_LOG("Retrieved civilian task");
}, [_player]] call CBA_fnc_addEventHandlerArgs;

["TWC_Insurgency_Locations_getElderTask", [_player, _nearestLocation]] call CBA_fnc_serverEvent;

[5, [_elder, _player, _id], {
	DEBUG_LOG("Got civilian task");
	
	(_this select 0) params ["_elder", "_player", "_id"];
	
	private _message = _player getVariable ["TWC_Insurgency_Actions_elderTask", "My people do not need your help at this moment."];
	
	[name _elder, _message] spawn BIS_fnc_showSubtitle;
	
	//Eventhandler and variable clean-up.
	_player setVariable ["TWC_Insurgency_Actions_Questioning", nil];
	_player setVariable ["TWC_Insurgency_Actions_elderTask", nil];
	["TWC_Insurgency_Actions_getElderTask", _id] call CBA_fnc_removeEventHandler;
}, {}, "Offering Help"] call ace_common_fnc_progressBar;
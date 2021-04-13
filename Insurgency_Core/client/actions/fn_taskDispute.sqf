#include "..\..\includes\script_component.hpp"

params ["_elder", "_player"];

private _nearestLocation = (group _elder) getVariable ["TWC_Insurgency_Location", nearestLocation [_elder, ""]];

private _id = ["TWC_Insurgency_Locations_taskDisputeResult", {
	params ["_message"];
	_player setVariable ["TWC_Insurgency_Actions_taskDispute", _message];
	DEBUG_LOG("Retrieved dispute task result");
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_Locations_taskDispute", [_nearestLocation, _player, _elder]] call CBA_fnc_serverEvent;

[5, [_elder, _player, _id], {
	(_this select 0) params ["_elder", "_player", "_id"];
	
	private _message = _player getVariable ["TWC_Insurgency_Actions_taskDispute", "I am not sure about this right now."];
	
	[name _elder, _message] spawn BIS_fnc_showSubtitle;
	
	//Eventhandler and variable clean-up.
	["TWC_Insurgency_Locations_taskDisputeResult", _id] call CBA_fnc_removeEventHandler;
	_player setVariable ["TWC_Insurgency_Actions_taskDispute", nil];
}, {}, "Conducting Tribal Diplomacy"] call ace_common_fnc_progressBar;
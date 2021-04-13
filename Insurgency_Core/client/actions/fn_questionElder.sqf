#include "..\..\includes\script_component.hpp"

params ["_elder", "_player"];

private _nearestLocation = (group _elder) getVariable ["TWC_Insurgency_Location", nearestLocation [_elder, ""]];

private _id = ["TWC_Insurgency_Actions_questionElder", {
	_this params ["_intelType", ["_intelLocation", ""], ["_intelQuality", 0]];
	_thisArgs params ["_player"];
	
	_player setVariable ["TWC_Insurgency_Actions_Questioning", [_intelType, _intelLocation, _intelQuality]];
	DEBUG_LOG("Retrieved intel information");
}, [_player]] call CBA_fnc_addEventHandlerArgs;

["TWC_Insurgency_Locations_questionElder", [_player, _nearestLocation]] call CBA_fnc_serverEvent;

[5, [_elder, _player, _id], {
	(_this select 0) params ["_elder", "_player", "_id"];
	
	private _intelInfo = _player getVariable ["TWC_Insurgency_Actions_Questioning", []];
	_intelInfo params ["_intelType", "_intelLocation", "_intelQuality"];
	
	private _message = switch (_intelType) do {
		case "failure": {"I have nothing to say to you."};
		case "cache": {format ["I have heard about a rumour about enemy equipment stored at %1, within %2 meters.", text _intelLocation, _intelQuality]};
		case "stronghold": {format ["The people of my village have seen a large amount of fighters at %1.", text _intelLocation]};
		case "supply": {format ["There are rumours that the enemy currently has %1 supplies.", _intelLocation]};
		case "manpower": {format ["There are rumours that the enemy currently has %1 fighters.", _intelLocation]};
	};
	[name _elder, _message] spawn BIS_fnc_showSubtitle;
	
	//Clean-up.
	_player setVariable ["TWC_Insurgency_Actions_Questioning", nil];
	["TWC_Insurgency_Actions_questionElder", _id] call CBA_fnc_removeEventHandler;
	
	DEBUG_LOG("Got Info");
}, {}, "Questioning the Elder"] call ace_common_fnc_progressBar;
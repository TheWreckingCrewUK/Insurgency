#include "..\..\includes\script_component.hpp"

params ["_elder", "_player"];

private _nearestLocation = (group _elder) getVariable ["TWC_Insurgency_Location", nearestLocation [_elder, ""]];

[5, [_elder, _player, _nearestLocation], {
	(_this select 0) params ["_elder", "_player", "_nearestLocation"];
	
	["TWC_Insurgency_Locations_taskCash", [_nearestLocation, _player, _elder]] call CBA_fnc_serverEvent;
	
	private _message = "Thank you for your generous donation!";
	
	[name _elder, _message] spawn BIS_fnc_showSubtitle;
}, {}, "Bribing Elder"] call ace_common_fnc_progressBar;
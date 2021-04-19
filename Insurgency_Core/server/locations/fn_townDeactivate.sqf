#include "..\..\includes\script_component.hpp"

params ["_location"];

private _locationInfo = [_location] call TWC_Insurgency_Locations_fnc_getInfo;
_locationInfo params ["_isStronghold", "_hasCache", "_allegiance", "_isActive", "_elderGroup", "_civGroup"];

if (_isStronghold) exitWith {
	["TWC_Insurgency_OPFOR_deactivateStronghold", [_location]] call CBA_fnc_serverEvent;
};

private _locationDetails = missionNameSpace getVariable [text _location, []];

if (count _locationDetails == 0) exitWith {DEBUG_LOG(text _location + " is already inactive")};

(_locationDetails select 0) params ["_elderGroup", "_civilianGroup"];
private _activationTime = _locationDetails select 1;

if (CBA_missionTime < _activationTime + 30) exitWith {DEBUG_LOG(text _location + " told to be active < 30 seconds ago")};

{
	deleteVehicle _x;
} forEach units _elderGroup;
deleteGroup _elderGroup;

{
	deleteVehicle _x;
} forEach units _civilianGroup;
deleteGroup _civilianGroup;

missionNameSpace setVariable [text _location, nil];

DEBUG_LOG(text _location + " deactivated");
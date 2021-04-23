#include "..\..\includes\script_component.hpp"

params ["_location"];

private _isStronghold = _location getVariable ["TWC_Insurgency_Locations_isStronghold", false];
private _hasCache = _location getVariable ["TWC_Insurgency_Locations_hasCache", false];
private _allegiance = _location getVariable ["TWC_Insurgency_Locations_allegiance", 0];
private _isActive = _location getVariable ["TWC_Insurgency_Locations_isActive", false];
private _elderGroup = _location getVariable ["TWC_Insurgency_Locations_elderGroup", grpNull];
private _civGroup = _location getVariable ["TWC_Insurgency_Locations_civGroup", grpNull];
private _task = _location getVariable ["TWC_Insurgency_Locations_task", ""];

[_isStronghold, _hasCache, _allegiance, _isActive, _elderGroup, _civGroup, _task]
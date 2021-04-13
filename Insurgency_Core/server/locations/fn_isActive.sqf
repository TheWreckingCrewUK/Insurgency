#include "..\..\includes\script_component.hpp"

params ["_location"];

private _locationActiveDetails = missionNameSpace getVariable [text _location, []];
if (count _locationActiveDetails > 0) exitWith {true};

false
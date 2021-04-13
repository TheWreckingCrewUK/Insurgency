#include "..\..\..\includes\script_component.hpp"

params ["_group"];

private _vehicle = vehicle leader _group;

if (count waypoints _group > 1) exitWith {false};
if (_vehicle isKindOf "StaticMortar") exitWith {false};
if (_vehicle isKindOf "StaticWeapon") exitWith {true};

false
#include "..\..\..\includes\script_component.hpp"

params ["_group", "_tactic"];

if (count waypoints _group > 1) exitWith {false};
if (_tactic select 1 < 1) exitWith {false};

true
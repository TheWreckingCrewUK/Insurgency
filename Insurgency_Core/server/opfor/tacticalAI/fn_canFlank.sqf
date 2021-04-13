#include "..\..\..\includes\script_component.hpp"

params ["_group", "_tactic"];

if (behaviour leader _group == "COMBAT") exitWith {false};
if (count waypoints _group > 1) exitWith {false};
if (_tactic select 3 < 1) exitWith {false};

true
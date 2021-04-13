#include "..\..\..\includes\script_component.hpp"

params ["_tactic", "_index", "_change"];

private _initial = _tactic select _index;
_tactic set [_index, _initial + _change];

_tactic
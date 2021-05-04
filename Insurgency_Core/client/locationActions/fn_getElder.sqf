#include "..\..\includes\script_component.hpp"

params ["_target", "_player"];

private _nearestCivs = (getPos _target) nearEntities [getArray (missionConfigFile >> "TWC_Insurgency" >> "civilians"), 200];

private _leaders = _nearestCivs select {leader _x == _x};
private _elders = _leaders select {count (units _x) < 4};
private _elder = _elders select 0;

private _dir = _target getDir _elder;
private _distance = _target distance2D _elder;

private _message = format ["Our village elder is %2 meters to a direction of %1.", round _dir, round _distance];
_target doWatch _player;

if (count _elders isEqualTo 0) then {
	_message = "I cannot help you.";
};

[5, [_target, _elder, _message], {
	(_this select 0) params ["_target", "_elder", "_message"];
	[name _target, _message] spawn BIS_fnc_showSubtitle;
	[_target, "GestureGo"] call ace_common_fnc_doGesture;
}, {}, "Asking the Civilian"] call ace_common_fnc_progressBar;
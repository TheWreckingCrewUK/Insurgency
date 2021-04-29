#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Makes a unit put an IED at a given position.
*
* Arguments:
* 0: Bomber group <GROUP>
* 1: IED Position <ARRAY>
*
* Return Value:
* NONE
*
* Example:
* [_group, _pos] call TWC_Insurgency_OPFOR_fnc_plantIED;
*/

params ["_group", "_pos"];

private _bomber = leader _group;

_bomber doMove _pos;

_bomber playActionNow "PutDown";

private _typeIEDs = getArray (missionConfigFile >> "TWC_Insurgency" >> "typeIEDs");
private _type = selectRandom _typeIEDs;

private _IED = createMine [_type, [0,0,0], [], 0];
_IED setPos _pos;

private _side = call TWC_Insurgency_OPFOR_fnc_enemySide;
_side revealMine _IED;

//Example code how to possibly make the AI put down an IED instead.
/*_bomber selectWeapon "DirectionalMineRemoteMuzzle";
_bomber fire [
	"DirectionalMineRemoteMuzzle",
	"DirectionalMineRemoteMuzzle",
	"ClaymoreDirectionalMine_Remote_Mag"
];*/
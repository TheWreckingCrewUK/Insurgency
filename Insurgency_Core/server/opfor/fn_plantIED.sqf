#include "..\..\includes\script_component.hpp"

params ["_group", "_pos", "_target"];

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
#include "..\..\includes\script_component.hpp"

private _initIEDs = getNumber (missionConfigFile >> "TWC_Insurgency" >> "initIEDs");
private _typeIEDs = getArray (missionConfigFile >> "TWC_Insurgency" >> "typeIEDs");

private _side = call TWC_Insurgency_OPFOR_fnc_enemySide;

private _basePos = getMarkerPos "base";
_basePos set [2, 0];

private _center = [worldSize / 2, worldsize / 2, 0];
private _radius = sqrt 2 / 2 * worldSize;

for "_i" from 1 to _initIEDs do {
	private _type = selectRandom _typeIEDs;
	private _pos = [[[_center, _radius]], [[_basePos, 500], "water"], {isOnRoad _this}] call BIS_fnc_randomPos;
	if (count _pos > 2) then {
		_pos set [2, 0];
		private _IED = createMine [_type, [0,0,0], [], 3];
		_IED setPos _pos;
		_side revealMine _IED;
		civilian revealMine _IED;
	};
};

DEBUG_LOG("Starting IEDs placed");
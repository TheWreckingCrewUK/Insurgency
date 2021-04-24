#include "..\..\includes\script_component.hpp"

//The mission sets what and how many IEDs can spawn.
private _initIEDs = getNumber (missionConfigFile >> "TWC_Insurgency" >> "initIEDs");
private _typeIEDs = getArray (missionConfigFile >> "TWC_Insurgency" >> "typeIEDs");

//We want the enemy to know about the IEDs they placed, because surely they won't drive over them then, right???
private _side = call TWC_Insurgency_OPFOR_fnc_enemySide;

//No IEDs near base.
private _basePos = getMarkerPos "base";
_basePos set [2, 0];

//The world is my oyster and its pearl is explosives.
private _center = [worldSize / 2, worldsize / 2, 0];
private _radius = sqrt 2 / 2 * worldSize;

for "_i" from 1 to _initIEDs do {
	private _type = selectRandom _typeIEDs;
	
	//Don't spawn IEDs in water or near base, and it would be nice if they were on roads.
	private _pos = [[[_center, _radius]], [[_basePos, 500], "water"], {isOnRoad _this}] call BIS_fnc_randomPos;
	if (count _pos > 2) then {
		//Ensure IEDs are spawned above ground, because there is a limit to the PTSD one should induce.
		_pos set [2, 0];
		private _IED = createMine [_type, _pos, [], 3];
		
		//Both civs and hostiles should avoid IEDs.
		_side revealMine _IED;
		civilian revealMine _IED;
	};
};

DEBUG_LOG("Starting IEDs placed");
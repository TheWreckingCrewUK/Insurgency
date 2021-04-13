#include "..\..\includes\script_component.hpp"

params ["_allLocations"];

//In an effort to keep the load light players moving around quickly in choppers are excluded from triggering towns
if !((vehicle player isKindOf "Helicopter") && (speed vehicle player > 120)) then {
	//Find out what towns the players is keeping active
	private _activatedTowns = player getVariable ["TWC_Insurgency_Towns", []];
	
	//Loop through all possible towns to determine whether the player is close enough, does not seem performant but I have not found another option, nearestLocation(s) is terrible BI shit
	{
		private _location = _x;
		private _distance = (getPos player) distance _location;
		
		//We send a message to the server if we're out of range of a town, but we previously had it activated
		if ((_x in _activatedTowns) && (_distance > 1200)) then {
			[{
				["TWC_Insurgency_Locations_Deactivate", _this] call CBA_fnc_serverEvent;
			}, [_location], 30] call CBA_fnc_waitAndExecute;
			player setVariable ["TWC_Insurgency_Towns", _activatedTowns - [_x]];
		} else {
			//We also send a message if we're close enough to a town and we don't have it activated
			if ((_distance < 1200) && !(_x in _activatedTowns)) then {
				["TWC_Insurgency_Locations_Activate", [_location]] call CBA_fnc_serverEvent;
				_activatedTowns pushBack _location;
				player setVariable ["TWC_Insurgency_Towns", _activatedTowns];
			};
		};
	} forEach _allLocations;
};

[{_this call TWC_Insurgency_playerLoop_fnc_playerLoop}, [_allLocations], 10] call CBA_fnc_waitAndExecute;
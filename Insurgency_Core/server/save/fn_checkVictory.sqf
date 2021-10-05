#include "..\..\includes\script_component.hpp"
/*
* Author: [TWC] Rik
* Checks whether the conditions for victory are met.
*
* Arguments:
* NONE
*
* Return Value:
* NONE
*
* Example:
* call TWC_Insurgency_Save_fnc_checkVictory;
*/

_allLocations = TWC_Insurgency_Locations;

private _supply = TWC_Insurgency_supplyOPFOR;
private _manpower = TWC_Insurgency_manpowerOPFOR;

private _strongholds = call TWC_Insurgency_Locations_fnc_getStrongholds;
private _caches = call TWC_Insurgency_Locations_fnc_getCaches;

private _strongholdCount = count _strongholds;
private _cacheCount = count _caches;

if ((_strongholdCount isEqualTo 0) && (_cacheCount isEqualTo 0) && (_supply isEqualTo 0) && (_manpower isEqualTo 0)) then {
	profileNamespace setVariable ["TWC_Insurgency_SaveInfo", nil];
	saveProfileNamespace;
	"Victory" call BIS_fnc_endMissionServer;
};
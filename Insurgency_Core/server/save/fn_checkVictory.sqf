#include "..\..\includes\script_component.hpp"

_allLocations = TWC_Insurgency_Locations;

private _supply = TWC_Insurgency_supplyOPFOR;
private _manpower = TWC_Insurgency_manpowerOPFOR;

private _strongholds = call TWC_Insurgency_Locations_fnc_getStrongholds;
private _caches = call TWC_Insurgency_Locations_fnc_getCaches;

private _strongholdCount = count _strongholds;
private _cacheCount = count _caches;

if ((_strongholdCount isEqualTo 0) && (_cacheCount isEqualTo 0) && (_supply isEqualTo 0) && (_manpower isEqualTo 0)) then {
	"Victory" call BIS_fnc_endMissionServer;
};
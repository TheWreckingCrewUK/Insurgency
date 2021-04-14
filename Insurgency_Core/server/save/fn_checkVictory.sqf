#include "..\..\includes\script_component.hpp"

private _supply = TWC_Insurgency_supplyOPFOR;
private _manpower = TWC_Insurgency_manpowerOPFOR;

private _strongholds = TWC_Insurgency_Locations select {_x select 1};
private _strongholdCount = count _strongholds;

private _caches = TWC_Insurgency_Locations select {_x select 2};
private _cacheCount = count _caches;

if ((_strongholdCount isEqualTo 0) && (_cacheCount isEqualTo 0) && (_supply isEqualTo 0) && (_manpower isEqualTo 0)) then {
	"Victory" call BIS_fnc_endMissionServer;
};
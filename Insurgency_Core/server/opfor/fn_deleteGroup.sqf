#include "..\..\includes\script_component.hpp"

params ["_group"];

{
	deleteVehicle _x;
} forEach units _group;

deleteGroup _group;
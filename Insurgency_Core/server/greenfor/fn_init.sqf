#include "..\..\includes\script_component.hpp"

if (!isServer) exitWith {DEBUG_LOG("GREENFOR Init not executed on client.")};

TWC_Insurgency_GREENFOR_Checkpoints = [];
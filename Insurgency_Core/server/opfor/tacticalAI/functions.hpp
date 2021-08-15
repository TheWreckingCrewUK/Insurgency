#undef FUNCTION
#define FUNCTION(NAME) class NAME {file = Insurgency_Core\server\opfor\tacticalAI\fn_##NAME##.sqf;}

FUNCTION(getPriorityBLUFOR);
FUNCTION(initialDefence);
FUNCTION(knownBLUFOR);
FUNCTION(modifyTactic);
FUNCTION(selectTactic);

//Check possible section moves
FUNCTION(canAttack);
FUNCTION(canDefend);
FUNCTION(canFlank);
FUNCTION(canMortar);
FUNCTION(canSkirmish);
FUNCTION(isStatic);

//Execute section moves
FUNCTION(doAttack);
FUNCTION(doDefend);
FUNCTION(doFlank);
FUNCTION(doMortar);
FUNCTION(doSkirmish);
FUNCTION(turnStatic);
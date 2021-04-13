params ["_enemyGroups"];

//Only bother looking at enemies that are in combat
private _enemyGroups = _enemyGroups select {behaviour (leader _x) == "COMBAT"};

private _enemies = [];
{
	//Detect nearby targets and strip away non-player stuff
	private _playerside = call TWC_Insurgency_BLUFOR_fnc_playerSide;
	
	//We don't care about anything that's too far away or isn't of our side
	private _targets = (leader _x) nearTargets 1200;
	_targets = _targets select {_x select 2 == _playerside};
	
	{
		_enemies pushBackUnique [_x select 4, _x select 0, _x select 3];
	} forEach _targets;
} forEach _enemyGroups;

//Returns enemies in format [[unit, perceived position, cost]...]
_enemies
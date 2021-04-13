private _index = selectRandom ["1", "2", "3", "4"];

private _composition = switch _index do {
	case "1": {call TWC_Insurgency_Compositions_fnc_checkpoint_1};
	case "2": {call TWC_Insurgency_Compositions_fnc_checkpoint_2};
	case "3": {call TWC_Insurgency_Compositions_fnc_checkpoint_3};
	case "4": {call TWC_Insurgency_Compositions_fnc_checkpoint_4};
};

_composition
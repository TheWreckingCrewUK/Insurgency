private _index = selectRandom ["1", "2", "3"];

private _composition = switch _index do {
	case "1": {call TWC_Insurgency_Compositions_fnc_camp_1};
	case "2": {call TWC_Insurgency_Compositions_fnc_camp_2};
	case "3": {call TWC_Insurgency_Compositions_fnc_camp_3};
};

_composition
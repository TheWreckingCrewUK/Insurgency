class TWC_Insurgency_Compositions {
	class Compositions {
		tag = "Compositions";
		#define BLUFOR_COMPOSITION(NAME) class NAME {file = Insurgency_Core\includes\compositions\BLUFOR\fn_##NAME##.sqf;}
		#define GREENFOR_COMPOSITION(NAME) class NAME {file = Insurgency_Core\includes\compositions\GREENFOR\fn_##NAME##.sqf;}
		#define OPFOR_COMPOSITION(NAME) class NAME {file = Insurgency_Core\includes\compositions\OPFOR\fn_##NAME##.sqf;}
		
		//BLUFOR
		
		//GREENFOR
		GREENFOR_COMPOSITION(getCheckpoint);
		GREENFOR_COMPOSITION(checkpoint_1);
		GREENFOR_COMPOSITION(checkpoint_2);
		GREENFOR_COMPOSITION(checkpoint_3);
		GREENFOR_COMPOSITION(checkpoint_4);
		
		//OPFOR
		OPFOR_COMPOSITION(getCamp);
		OPFOR_COMPOSITION(camp_1);
		OPFOR_COMPOSITION(camp_2);
		OPFOR_COMPOSITION(camp_3);
	};
};
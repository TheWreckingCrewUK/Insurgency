class CfgAmmoboxes {
	#define ADD(a,b) class a {type = a; count = b;}
	
	#include "..\generic_ammoboxes.hpp"
	
	class Squad_Supply {
		displayName = "Squad Resupply (5)";
		type = "CUP_BOX_RU_Ammo_F";
		size = 1;
		cost = 5;
		class Weapons {};
		class Magazines {
			ADD(CUP_30Rnd_545x39_AK_M, 35);
			ADD(CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M, 10);
			ADD(CUP_1Rnd_HE_GP25_M, 6);
			
			ADD(CUP_HandGrenade_RGD5, 6);
			ADD(SmokeShell, 6);
		};
		class Items {
			ADD(ACE_fieldDressing, 12);
			ADD(ACE_elasticBandage, 12);
			ADD(ACE_quikclot, 12);
			ADD(ACE_packingBandage, 12);
			
			ADD(ACE_morphine, 12);
			ADD(ACE_epinephrine, 12);
			ADD(ACE_tourniquet, 6);
		};
	};
	class RPG7_Resupply {
		displayName = "RPG-7 Resupply (10)";
		type = "CUP_BOX_RU_Ammo_F";
		size = 1;
		cost = 10;
		class Weapons {};
		class Magazines {
			ADD(CUP_PG7V_M,4);
			ADD(CUP_OG7_M,4);
		};
		class Items {};
	};
	class RPG18_Resupply {
		displayName = "RPG-18 Resupply (5)";
		type = "CUP_BOX_RU_WpsLaunch_F";
		size = 1;
		cost = 5;
		class Weapons {
			ADD(CUP_launch_RPG18,4);
		};
		class Magazines {};
		class Items {};
	};
};
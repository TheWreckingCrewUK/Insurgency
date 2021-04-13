class CfgAmmoboxes {
	#define ADD(a,b) class a {type = a; count = b;}
	
	#include "..\generic_ammoboxes.hpp"
	
	class Squad_Supply {
		displayName = "Squad Resupply";
		type = "CUP_BOX_US_ARMY_Ammo_F";
		size = 1;
		cost = 5;
		class Weapons {};
		class Magazines {
			ADD(CUP_30Rnd_556x45_Stanag, 35);
			ADD(CUP_200Rnd_TE4_Red_Tracer_556x45_M249, 8);
			ADD(CUP_1Rnd_HE_M203, 6);
			
			ADD(CUP_HandGrenade_M67, 6);
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
	class M136_Resupply {
		displayName = "M136 Resupply";
		type = "CUP_BOX_US_ARMY_WpsLaunch_F";
		size = 1;
		cost = 10;
		class Weapons {
			ADD(CUP_launch_M136,4);
		};
		class Magazines {};
		class Items {};
	};
};
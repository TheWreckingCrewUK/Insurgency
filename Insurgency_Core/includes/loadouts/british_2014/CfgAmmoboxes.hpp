class CfgAmmoboxes {
	#define ADD(a,b) class a {type = a; count = b;}
	
	#include "..\generic_ammoboxes.hpp"
	
	class Section_Resupply {
		displayName = "Section Resupply (5)";
		type = "Box_NATO_Ammo_F";
		size = 1;
		cost = 5;
		class Weapons {};
		class Magazines {
			ADD(UK3CB_BAF_556_30Rnd, 20);
			ADD(UK3CB_BAF_556_30Rnd_T, 8);
			
			ADD(UK3CB_BAF_556_200Rnd_T, 12);
			
			ADD(UK3CB_BAF_762_L42A1_20Rnd, 6);
			ADD(UK3CB_BAF_762_L42A1_20Rnd_T, 3);
			
			ADD(CUP_8Rnd_B_Beneli_74Slug, 6);
			ADD(CUP_8Rnd_B_Beneli_74Pellets, 6);
			
			ADD(UK3CB_BAF_762_100Rnd_T, 5);
			
			ADD(UK3CB_BAF_1Rnd_HE_Grenade_Shell, 8),
			ADD(1Rnd_Smoke_Grenade_shell, 4),
			ADD(1Rnd_SmokeGreen_Grenade_shell, 2),
			ADD(1Rnd_SmokeRed_Grenade_shell, 2),
			ADD(1Rnd_SmokeBlue_Grenade_shell, 2),
			
			ADD(CUP_HandGrenade_L109A2_HE, 6);
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
	class NLAW_Resupply {
		displayName = "NLAW Resupply (10)";
		type = "Box_NATO_WpsLaunch_F";
		size = 1;
		cost = 10;
		class Weapons {
			ADD(launch_NLAW_F, 4);
		};
		class Magazines {};
		class Items {};
	};
	class M72_Resupply {
		displayName = "M72 Resupply (5)";
		type = "Box_NATO_WpsLaunch_F";
		size = 1;
		cost = 5;
		class Weapons {
			ADD(CUP_launch_M72A6, 4);
		};
		class Magazines {};
		class Items {};
	};
};
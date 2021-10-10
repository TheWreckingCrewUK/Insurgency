class CfgAmmoboxes {
	#define ADD(a,b) class a {type = a; count = b;}
	
	#include "..\generic_ammoboxes.hpp"
	
	class Squad_Supply {
		displayName = "Squad Resupply";
		type = "vn_b_ammobox_02";
		subcategory = "TWC_Insurgency_Actions_spawnInfantryAmmo";
		size = 1;
		cost = 5;
		class Weapons {};
		class Magazines {
			ADD(vn_m16_20_t_mag, 40);
			ADD(vn_m1897_buck_mag, 8);
			ADD(vn_m1897_fl_mag, 8);
			ADD(vn_m1a1_30_t_mag, 8);
			
			ADD(vn_m60_100_mag, 16);
			ADD(vn_m63a_30_t_mag, 12);
			
			ADD(vn_40mm_m381_he_mag, 10);
			ADD(vn_40mm_m576_buck_mag, 4);
			ADD(vn_40mm_m682_smoke_r_mag, 4);
			ADD(vn_40mm_m651_cs_mag, 2);
			
			ADD(vn_m14_t_mag, 2);
			
			ADD(vn_m1911_mag, 6);
			
			ADD(vn_m61_grenade_mag, 6);
			ADD(vn_m18_white_mag, 6);
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
	class M72_Resupply {
		displayName = "M72 Resupply";
		type = "vn_b_ammobox_03";
		subcategory = "TWC_Insurgency_Actions_spawnInfantryAmmo";
		size = 1;
		cost = 5;
		class Weapons {
			ADD(vn_m72_mag,4);
		};
		class Magazines {};
		class Items {};
	};
};
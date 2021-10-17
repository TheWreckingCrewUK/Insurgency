class CfgRespawnInventory {
	//Section
	class Rifleman {
		displayName = "Rifleman (M16)";
		icon = "";
		role = "Rifleman";
		rank = "PRIVATE";
		uniformClass = "vn_b_uniform_macv_04_01";
		backpack = "vn_b_pack_lw_01_m16_pl";
		linkedItems[] = {
			"vn_b_vest_usarmy_02",
			"vn_b_helmet_m1_07_01",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		items[] = {
			MEDICAL_LOADOUT,
			"ACE_EntrenchingTool"
		};
		weapons[] = {
			"vn_m16"
		};
		magazines[] = {
			MAG_13("vn_m16_20_t_mag"),
			MAG_2("vn_m61_grenade_mag"),
			MAG_2("vn_m18_white_mag")
		};
	};
	class Rifleman_LAW: Rifleman {
		displayName = "Rifleman (M72)";
		uniformClass = "vn_b_uniform_macv_05_01";
		backpack = "vn_b_pack_trp_03_02_m16_pl";
		weapons[] = {
			"vn_m16",
			"vn_m72_mag"
		};
	};
	class Pointman: Rifleman {
		displayName = "Pointman";
		linkedItems[] = {
			"vn_b_vest_usarmy_04",
			"vn_b_helmet_m1_07_01",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"vn_m1897"
		};
		magazines[] = {
			MAG_8("vn_m1897_buck_mag"),
			MAG_8("vn_m1897_fl_mag"),
			MAG_2("vn_m61_grenade_mag"),
			MAG_2("vn_m18_white_mag")
		};
	};
	class Submachinegunner: Rifleman {
		displayName = "Submachinegunner";
		uniformClass = "vn_b_uniform_macv_06_01";
		linkedItems[] = {
			"vn_b_vest_usarmy_02",
			"vn_b_helmet_m1_05_01",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"vn_m1a1_tommy"
		};
		magazines[] = {
			MAG_8("vn_m1a1_30_t_mag"),
			MAG_2("vn_m61_grenade_mag"),
			MAG_2("vn_m18_white_mag")
		};
	};
	class Machinegunner: Rifleman {
		displayName = "Machinegunner";
		role = "Machinegunner";
		uniformClass = "vn_b_uniform_macv_05_01";
		backpack = "vn_b_pack_lw_02_m60_pl";
		linkedItems[] = {
			"vn_b_vest_usarmy_06",
			"vn_b_helmet_m1_08_01",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"vn_m60",
			"vn_m1911"
		};
		magazines[] = {
			MAG_4("vn_m60_100_mag"),
			MAG_2("vn_m1911_mag")
		};
	};
	class Autorifleman: Machinegunner {
		displayName = "Autorifleman";
		uniformClass = "vn_b_uniform_macv_06_01";
		backpack = "vn_b_pack_trp_01_02_m60_pl";
		weapons[] = {
			"vn_m63a",
			"vn_m1911"
		};
		magazines[] = {
			MAG_12("vn_m63a_30_t_mag"),
			MAG_2("vn_m1911_mag")
		};
	};
	class Grenadier: Rifleman {
		displayName = "Grenadier";
		role = "Specialist";
		uniformClass = "vn_b_uniform_macv_02_01";
		backpack = "vn_b_pack_lw_01_m79_pl";
		linkedItems[] = {
			"vn_b_vest_usarmy_05",
			"vn_b_helmet_m1_04_01",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"vn_m79",
			"vn_m1911"
		};
		magazines[] = {
			MAG_10("vn_40mm_m381_he_mag"),
			MAG_4("vn_40mm_m576_buck_mag"),
			MAG_2("vn_40mm_m682_smoke_r_mag"),
			MAG_2("vn_40mm_m651_cs_mag"),
			MAG_5("vn_m1911_mag")
		};
	};
	class Marksman: Grenadier {
		displayName = "Marksman";
		role = "Specialist";
		uniformClass = "vn_b_uniform_macv_01_01";
		backpack = "vn_b_pack_lw_01_m21_pl";
		linkedItems[] = {
			"vn_b_vest_usarmy_06",
			"vn_b_helmet_m1_08_01",
			"vn_o_9x_m14",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"vn_m14",
			"vn_m1911"
		};
		magazines[] = {
			MAG_12("vn_m14_t_mag"),
			MAG_2("vn_m1911_mag")
		};
	};
	class Team_Leader: Rifleman {
		displayName = "Team Leader";
		role = "Team_Leader";
		rank = "CORPORAL";
		uniformClass = "vn_b_uniform_macv_05_01";
		backpack = "vn_b_pack_lw_01_m16_pl";
		linkedItems[] = {
			"vn_b_vest_usarmy_03",
			"vn_b_helmet_m1_09_01",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		items[] = {
			MEDICAL_LOADOUT,
			"ACE_MapTools",
			"ACRE_PRC77",
			"ACE_EntrenchingTool"
		};
		weapons[] = {
			"vn_m16",
			"vn_m19_binocs_grey",
			"vn_m1911"
		};
		magazines[] = {
			MAG_13("vn_m16_20_t_mag"),
			MAG_2("vn_m1911_mag"),
			MAG_2("vn_m18_yellow_mag"),
			MAG_2("vn_m18_purple_mag")
		};
	};
	class Squad_Leader: Team_Leader {
		displayName = "Squad Leader";
		role = "Squad_Leader";
		rank = "SERGEANT";
		uniformClass = "vn_b_uniform_macv_02_01";
		backpack = "vn_b_pack_lw_06_m16_pl";
		linkedItems[] = {
			"vn_b_vest_usarmy_02",
			"vn_b_helmet_m1_03_01",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
	};
	
	class Medic: Rifleman {
		displayName = "Medic";
		role = "Medic";
		medic = 1;
		uniformClass = "vn_b_uniform_macv_03_01";
		backpack = "vn_b_pack_m5_01_medic_m16_pl";
		linkedItems[] = {
			"vn_b_vest_usarmy_07",
			"vn_b_helmet_m1_04_01",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		items[] = {
			MEDICAL_LOADOUT,
			MAG_20(ACE_fieldDressing),
			MAG_20(ACE_quikclot),
			MAG_20(ACE_packingBandage),
			MAG_20(ACE_elasticBandage),
			MAG_10(ACE_morphine),
			MAG_10(ACE_epinephrine),
			MAG_6(ACE_salineIV_500),
			MAG_4(ACE_adenosine),
			MAG_4(ACE_atropine),
			MAG_4(ACE_tourniquet),
			"ACE_personalAidKit",
			"TWC_Item_Medical_SutureKit_25",
			"ACE_EntrenchingTool"
		};
		weapons[] = {
			"vn_m16"
		};
		magazines[] = {
			MAG_13("vn_m16_20_t_mag")
		};
	};
	
	//Rotary-Wing Pilot
	class Helicopter_Pilot: Rifleman {
		displayName = "Helicopter Pilot";
		role = "Helicopter_Pilot";
		rank = "CAPTAIN";
		heli = 1;
		uniformClass = "vn_b_uniform_k2b_02_02";
		backpack = "";
		linkedItems[] = {
			"vn_b_vest_aircrew_05",
			"vn_b_helmet_svh4_01_04",
			"ItemMap",
			"ItemcTab",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"vn_m10"
		};
		magazines[] = {
			MAG_3("vn_m10_mag"),
			MAG_2("vn_m18_yellow_mag"),
			MAG_2("vn_m18_purple_mag")
		};
	};
	
	//Jet Team
	class FAC_M16: Rifleman {
		displayName = "Forward Air Controller (M16)";
		role = "FAC";
		rank = "CAPTAIN";
		uniformClass = "vn_b_uniform_macv_04_01";
		backpack = "vn_b_pack_trp_04_02_m16_pl";
		linkedItems[] = {
			"vn_b_uniform_macv_05_01",
			"vn_b_helmet_m1_09_01",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		items[] = {
			MEDICAL_LOADOUT,
			"ACE_MapTools",
			"ACRE_PRC77",
			"ACE_EntrenchingTool"
		};
		weapons[] = {
			"vn_m16",
			"vn_m19_binocs_grey"
		};
		magazines[] = {
			MAG_9("vn_m16_20_t_mag"),
			MAG_4("vn_m18_white_mag"),
			MAG_4("vn_m18_purple_mag"),
			MAG_4("vn_m18_red_mag"),
			MAG_4("vn_m18_yellow_mag"),
			MAG_4("vn_m18_green_mag")
		};
	};
	class FAC_M79: FAC_M16 {
		displayName = "Forward Air Controller (M79)";
		weapons[] = {
			"vn_m79",
			"vn_m1911",
			"vn_m19_binocs_grey"
		};
		magazines[] = {
			MAG_6("vn_40mm_m381_he_mag"),
			MAG_4("vn_40mm_m682_smoke_r_mag"),
			MAG_4("vn_40mm_m680_smoke_w_mag"),
			MAG_4("vn_40mm_m715_smoke_g_mag"),
			MAG_4("vn_40mm_m716_smoke_y_mag"),
			MAG_4("vn_40mm_m717_smoke_p_mag"),
			MAG_5("vn_m1911_mag"),
			MAG_2("vn_m18_white_mag"),
			MAG_2("vn_m18_purple_mag"),
			MAG_2("vn_m18_red_mag"),
			MAG_2("vn_m18_yellow_mag"),
			MAG_2("vn_m18_green_mag")
		};
	};
	class Jet_Pilot: Helicopter_Pilot {
		displayName = "Jet Pilot";
		role = "Jet_Pilot";
		plane = 1;
		uniformClass = "vn_b_uniform_k2b_01_01";
		backpack = "B_Parachute";
		linkedItems[] = {
			"vn_b_vest_aircrew_06",
			"vn_b_helmet_aph6_01_01",
			"ItemMap",
			"ItemcTab",
			"ItemCompass",
			"ItemWatch"
		};
	};
	
	//Armour Crew
	class Armour_Commander: Rifleman {
		displayName = "Armour Commander";
		role = "Armour_Commander";
		rank = "SERGEANT";
		armour = 1;
		backpack = "";
		linkedItems[] = {
			"vn_b_vest_usarmy_12",
			"vn_b_helmet_m1_08_02",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"vn_m3a1",
			"vn_m19_binocs_grey"
		};
		magazines[] = {
			MAG_5("vn_m3a1_t_mag")
		};
	};
	class Armour_Crew: Armour_Commander {
		displayName = "Armour Crew";
		role = "Armour_Crew";
		rank = "PRIVATE";
		weapons[] = {
			"vn_m3a1"
		};
	};
};
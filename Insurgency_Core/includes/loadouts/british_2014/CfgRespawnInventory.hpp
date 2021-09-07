class CfgRespawnInventory {
	//Section
	class Rifleman_AT {
		displayName = "Rifleman (AT)";
		icon = "";
		role = "Rifleman";
		rank = "PRIVATE";
		uniformClass = "UK3CB_BAF_U_CombatUniform_MTP";
		backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C";
		linkedItems[] = {
			"UK3CB_BAF_V_Osprey_Rifleman_F",
			"UK3CB_BAF_H_Mk7_Scrim_F",
			"RKSL_optic_LDS",
			"UK3CB_BAF_LLM_Flashlight_Black",
			"UK3CB_BAF_HMNVS",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		items[] = {
			MEDICAL_LOADOUT,
			"ACE_EntrenchingTool",
			"ACRE_PRC343"
		};
		weapons[] = {
			"UK3CB_BAF_L85A2_RIS",
			"UK3CB_BAF_L131A1",
			"launch_NLAW_F"
		};
		magazines[] = {
			MAG_8("UK3CB_BAF_556_30Rnd"),
			MAG_5("UK3CB_BAF_556_30Rnd_T"),
			MAG_2("UK3CB_BAF_9_17Rnd"),
			MAG_2("CUP_HandGrenade_L109A2_HE"),
			MAG_2("SmokeShell")
		};
	};
	class Pointman: Rifleman_AT {
		displayName = "Pointman";
		backpack = "UK3CB_BAF_B_Bergen_MTP_PointMan_L_A";
		items[] = {
			MEDICAL_LOADOUT,
			"ACE_EntrenchingTool",
			"ACRE_PRC343",
			"CUP_sgun_M1014_vfg",
			"UK3CB_BAF_Eotech"
		};
		weapons[] = {
			"UK3CB_BAF_L85A2_RIS",
			"UK3CB_BAF_L131A1",
			"CUP_launch_M72A6"
		};
		magazines[] = {
			MAG_13("UK3CB_BAF_556_30Rnd"),
			MAG_8("CUP_8Rnd_B_Beneli_74Slug"),
			MAG_8("CUP_8Rnd_B_Beneli_74Pellets"),
			MAG_2("UK3CB_BAF_9_17Rnd"),
			MAG_2("CUP_HandGrenade_L109A2_HE"),
			MAG_2("SmokeShell")
		};
	};
	class Grenadier: Rifleman_AT {
		displayName = "Grenadier";
		role = "Grenadier";
		linkedItems[] = {
			"UK3CB_BAF_V_Osprey_Grenadier_B",
			"UK3CB_BAF_H_Mk7_Scrim_F",
			"RKSL_optic_LDS",
			"UK3CB_BAF_LLM_Flashlight_Black",
			"UK3CB_BAF_HMNVS",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"UK3CB_BAF_L85A2_UGL",
			"UK3CB_BAF_L131A1",
			"CUP_launch_M72A6",
			"ACE_Vector"
		};
		magazines[] = {
			MAG_13("UK3CB_BAF_556_30Rnd"),
			MAG_14("UK3CB_BAF_1Rnd_HE_Grenade_Shell"),
			MAG_6("1Rnd_Smoke_Grenade_shell"),
			MAG_2("1Rnd_SmokeGreen_Grenade_shell"),
			MAG_2("1Rnd_SmokeRed_Grenade_shell"),
			MAG_2("1Rnd_SmokeBlue_Grenade_shell"),
			MAG_2("UK3CB_BAF_9_17Rnd"),
			MAG_2("CUP_HandGrenade_L109A2_HE"),
			MAG_2("SmokeShell")
		};
	};
	class Autorifleman: Rifleman_AT {
		displayName = "Autorifleman";
		role = "Autorifleman";
		linkedItems[] = {
			"UK3CB_BAF_V_Osprey_MG_A",
			"UK3CB_BAF_H_Mk7_Scrim_F",
			"RKSL_optic_LDS",
			"UK3CB_BAF_LLM_Flashlight_Black",
			"UK3CB_BAF_HMNVS",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"UK3CB_BAF_L110A2RIS",
			"UK3CB_BAF_L131A1"
		};
		magazines[] = {
			MAG_6("UK3CB_BAF_556_200Rnd_T"),
			MAG_2("UK3CB_BAF_9_17Rnd"),
			MAG_2("SmokeShell")
		};
	};
	class Machinegunner: Rifleman_AT {
		displayName = "Machinegunner";
		role = "Machinegunner";
		linkedItems[] = {
			"UK3CB_BAF_V_Osprey_MG_A",
			"UK3CB_BAF_H_Mk7_Scrim_F",
			"UK3CB_BAF_HMNVS",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"UK3CB_BAF_L7A2",
			"UK3CB_BAF_L131A1"
		};
		magazines[] = {
			MAG_3("UK3CB_BAF_762_100Rnd_T"),
			MAG_2("UK3CB_BAF_9_17Rnd"),
			MAG_2("SmokeShell")
		};
	};
	class Marksman_NLAW: Rifleman_AT {
		displayName = "Marksman (NLAW)";
		role = "Marksman";
		linkedItems[] = {
			"UK3CB_BAF_V_Osprey_Marksman_A",
			"UK3CB_BAF_H_Mk7_Scrim_F",
			"UK3CB_BAF_TA648_308",
			"UK3CB_BAF_LLM_Flashlight_Black",
			"UK3CB_underbarrel_acc_fgrip_bipod",
			"UK3CB_BAF_HMNVS",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"UK3CB_BAF_L129A1_Grippod",
			"UK3CB_BAF_L131A1",
			"launch_NLAW_F",
			"ACE_Vector"
		};
		magazines[] = {
			MAG_6("UK3CB_BAF_762_L42A1_20Rnd"),
			MAG_4("UK3CB_BAF_762_L42A1_20Rnd_T"),
			MAG_2("UK3CB_BAF_762_100Rnd_T"),
			MAG_2("UK3CB_BAF_9_17Rnd"),
			MAG_2("SmokeShell")
		};
	};
	class Marksman_LAW: Marksman_NLAW {
		displayName = "Marksman (LAW)";
		weapons[] = {
			"UK3CB_BAF_L129A1_Grippod",
			"UK3CB_BAF_L131A1",
			"CUP_launch_M72A6",
			"ACE_Vector"
		};
	};
	class 2iC: Rifleman_AT {
		displayName = "2iC";
		role = "2iC";
		rank = "CORPORAL";
		backpack = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D";
		weapons[] = {
			"UK3CB_BAF_L85A2_RIS",
			"UK3CB_BAF_L131A1",
			"ACE_Vector"
		};
		magazines[] = {
			MAG_13("UK3CB_BAF_556_30Rnd"),
			MAG_2("UK3CB_BAF_762_100Rnd_T"),
			MAG_2("CUP_HandGrenade_L109A2_HE"),
			MAG_2("UK3CB_BAF_9_17Rnd"),
			MAG_2("SmokeShell")
		};
	};
	class Section_Commander: Rifleman_AT {
		displayName = "Section Commander";
		role = "Section_Commander";
		rank = "SERGEANT";
		backpack = "UK3CB_BAF_B_Bergen_MTP_SL_L_A";
		linkedItems[] = {
			"UK3CB_BAF_V_Osprey_SL_B",
			"UK3CB_BAF_H_Mk7_Scrim_F",
			"RKSL_optic_LDS",
			"UK3CB_BAF_LLM_Flashlight_Black",
			"UK3CB_BAF_HMNVS",
			"ItemMap",
			"ItemcTab",
			"ItemCompass",
			"ItemWatch"
		};
		items[] = {
			MEDICAL_LOADOUT,
			"ACE_EntrenchingTool",
			"ACRE_PRC117F",
			"ACRE_PRC343"
		};
		weapons[] = {
			"UK3CB_BAF_L85A2_RIS",
			"UK3CB_BAF_L131A1",
			"ACE_Vector"
		};
	};
	
	class Medic: Rifleman_AT {
		displayName = "Medic";
		role = "Medic";
		medic = 1;
		backpack = "UK3CB_BAF_B_Bergen_MTP_Medic_L_A";
		weapons[] = {
			"UK3CB_BAF_L85A2_RIS",
			"UK3CB_BAF_L131A1"
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
			"ACE_EntrenchingTool",
			"ACRE_PRC343"
		};
	};
	
	//Rotary-Wing Pilot
	class Helicopter_Pilot: Rifleman_AT {
		displayName = "Helicopter Pilot";
		role = "Helicopter_Pilot";
		rank = "CAPTAIN";
		heli = 1;
		backpack = "";
		linkedItems[] = {
			"UK3CB_BAF_V_Pilot_A",
			"UK3CB_BAF_H_PilotHelmetHeli_A",
			"CUP_NVG_PVS7",
			"ItemMap",
			"ItemcTab",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"UK3CB_BAF_L22A2"
		};
		magazines[] = {
			MAG_3("UK3CB_BAF_556_30Rnd"),
			MAG_2("SmokeShell"),
			MAG_2("SmokeShellGreen")
		};
	};
	
	//Armour Crew
	class Armour_Commander: Rifleman_AT {
		displayName = "Armour Commander";
		role = "Armour_Commander";
		rank = "SERGEANT";
		armour = 1;
		backpack = "";
		linkedItems[] = {
			"UK3CB_BAF_V_Osprey",
			"UK3CB_BAF_H_CrewHelmet_A",
			"ItemMap",
			"ItemcTab",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"UK3CB_BAF_L22A2",
			"UK3CB_BAF_L131A1",
			"ACE_Vector"
		};
		magazines[] = {
			MAG_5("UK3CB_BAF_556_30Rnd"),
			MAG_2("UK3CB_BAF_9_17Rnd"),
			MAG_2("SmokeShell"),
			MAG_2("SmokeShellGreen")
		};
	};
	class Armour_Crew: Armour_Commander {
		displayName = "Armour Crew";
		role = "Armour_Crew";
		rank = "PRIVATE";
		weapons[] = {
			"UK3CB_BAF_L22A2",
			"UK3CB_BAF_L131A1"
		};
		linkedItems[] = {
			"UK3CB_BAF_V_Osprey",
			"UK3CB_BAF_H_CrewHelmet_A",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
	};
};
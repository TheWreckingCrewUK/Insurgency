class CfgRespawnInventory {
	//Section
	class Rifleman_6B3 {
		displayName = "Rifleman (6B3)";
		icon = "";
		role = "Rifleman";
		rank = "PRIVATE";
		uniformClass = "CUP_U_O_RUS_M88_MSV_rolled_up";
		backpack = "CUP_B_AlicePack_Khaki";
		linkedItems[] = {
			"CUP_V_O_SLA_Flak_Vest03",
			"CUP_H_RUS_SSH68_olive",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
		};
		items[] = {
			MEDICAL_LOADOUT,
			"ACE_EntrenchingTool",
		};
		weapons[] = {
			"CUP_arifle_AK74_Early"
		};
		magazines[] = {
			MAG_13("CUP_30Rnd_545x39_AK_M"),
			MAG_2("CUP_HandGrenade_RGD5"),
			MAG_2("SmokeShell")
		};
	};
	class Rifleman_Smersh: Rifleman_6B3 {
		displayName = "Rifleman (Smersh)";
		linkedItems[] = {
			"CUP_V_RUS_Smersh_1",
			"CUP_H_RUS_SSH68_olive",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
		};
	};
	class Autorifleman_6B3: Rifleman_6B3 {
		displayName = "Autorifleman (6B3)";
		role = "Autorifleman";
		weapons[] = {
			"CUP_arifle_RPK74_45"
		};
		magazines[] = {
			MAG_8("CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"),
			MAG_2("SmokeShell")
		};
	};
	class Autorifleman_Smersh: Autorifleman_6B3 {
		displayName = "Autorifleman (Smersh)";
		linkedItems[] = {
			"CUP_V_O_Ins_Carrier_Rig_MG",
			"CUP_H_RUS_SSH68_olive",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
		};
	};
	class Grenadier_6B3: Rifleman_6B3 {
		displayName = "Grenadier (6B3)";
		role = "Grenadier";
		backpack = "CUP_B_RPGPack_Khaki";
		weapons[] = {
			"CUP_arifle_AK74_Early",
			"CUP_launch_RPG7V"
		};
		magazines[] = {
			MAG_13("CUP_30Rnd_545x39_AK_M"),
			MAG_2("CUP_PG7V_M"),
			MAG_3("CUP_OG7_M"),
			MAG_2("SmokeShell")
		};
	};
	class Grenadier_Smersh: Grenadier_6B3 {
		displayName = "Grenadier (Smersh)";
		linkedItems[] = {
			"CUP_V_RUS_Smersh_1",
			"CUP_H_RUS_SSH68_olive",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
		};
	};
	class Assistant_Grenadier_6B3: Rifleman_6B3 {
		displayName = "Assistant Grenadier (6B3)";
		role = "Assistant_Grenadier";
		backpack = "CUP_B_RPGPack_Khaki";
		magazines[] = {
			MAG_13("CUP_30Rnd_545x39_AK_M"),
			MAG_2("CUP_HandGrenade_RGD5"),
			MAG_2("CUP_PG7V_M"),
			MAG_2("CUP_OG7_M"),
			MAG_2("SmokeShell")
		};
	};
	class Assistant_Grenadier_Smersh: Assistant_Grenadier_6B3 {
		displayName = "Assistant Grenadier (Smersh)";
		linkedItems[] = {
			"CUP_V_RUS_Smersh_1",
			"CUP_H_RUS_SSH68_olive",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
		};
	};
	class Senior_Rifleman_6B3: Rifleman_6B3 {
		displayName = "Senior Rifleman (6B3)";
		role = "Senior_Rifleman";
		rank = "CORPORAL";
		weapons[] = {
			"CUP_arifle_AK74_Early",
			"CUP_launch_RPG18"
		};
	};
	class Senior_Rifleman_Smersh: Senior_Rifleman_6B3 {
		displayName = "Senior Rifleman (Smersh)";
		linkedItems[] = {
			"CUP_V_RUS_Smersh_1",
			"CUP_H_RUS_SSH68_olive",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
		};
	};
	class Squad_Commander_6B3: Rifleman_6B3 {
		displayName = "Squad Commander";
		role = "Squad_Commander";
		rank = "SERGEANT";
		linkedItems[] = {
			"CUP_V_O_SLA_Flak_Vest02",
			"CUP_H_RUS_SSH68_olive",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
		};
		weapons[] = {
			"CUP_arifle_AK74_GL_Early"
		};
		magazines[] = {
			MAG_13("CUP_30Rnd_545x39_AK_M"),
			MAG_10("CUP_1Rnd_HE_GP25_M"),
			MAG_6("CUP_1Rnd_SMOKE_GP25_M"),
			MAG_3("CUP_1Rnd_SmokeRed_GP25_M"),
			MAG_3("CUP_1Rnd_SmokeGreen_GP25_M"),
			MAG_3("CUP_1Rnd_SmokeYellow_GP25_M"),
			MAG_2("SmokeShell")
		};
	};
	class Squad_Commander_Smersh: Squad_Commander_6B3 {
		displayName = "Squad Commander (Smersh)";
		linkedItems[] = {
			"CUP_V_RUS_Smersh_2",
			"CUP_H_RUS_SSH68_olive",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
		};
	};
	
	class Medic: Rifleman_Smersh {
		displayName = "Medic";
		role = "Medic";
		medic = 1;
		backpack = "CUP_B_SLA_Medicbag";
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
	};
	
	//Rotary-Wing Pilot
	class Helicopter_Pilot: Rifleman_6B3 {
		displayName = "Helicopter Pilot";
		role = "Helicopter_Pilot";
		rank = "CAPTAIN";
		heli = 1;
		backpack = "";
		linkedItems[] = {
			"CUP_V_RUS_Smersh_1",
			"CUP_H_RUS_ZSH_Shield_Up",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"CUP_arifle_AKS74U"
		};
		magazines[] = {
			MAG_3("CUP_30Rnd_545x39_AK_M"),
			MAG_2("SmokeShell"),
			MAG_2("SmokeShellGreen")
		};
	};
	
	//Armour Crew
	class Armour_Commander: Rifleman_6B3 {
		displayName = "Armour Commander";
		role = "Armour_Commander";
		rank = "SERGEANT";
		armour = 1;
		backpack = "";
		linkedItems[] = {
			"CUP_V_RUS_Smersh_1",
			"CUP_H_RUS_TSH_4_Brown",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"CUP_arifle_AKS74U"
		};
		magazines[] = {
			MAG_5("CUP_30Rnd_545x39_AK_M"),
			MAG_2("SmokeShell"),
			MAG_2("SmokeShellGreen")
		};
	};
	class Armour_Crew: Armour_Commander {
		displayName = "Armour Crew";
		role = "Armour_Crew";
		rank = "PRIVATE";
	};
};
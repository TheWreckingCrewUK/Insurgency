class CfgRespawnInventory {
	//Section
	class Rifleman_AT_M136 {
		displayName = "Rifleman (M136)";
		icon = "";
		role = "Rifleman_AT";
		rank = "PRIVATE";
		uniformClass = "CUP_U_B_BDUv2_roll2_DCU_US";
		backpack = "CUP_B_USMC_MOLLE_WDL";
		linkedItems[] = {
			"CUP_V_B_Interceptor_Rifleman_M81",
			"CUP_H_PASGTv2_DCU",
			"CUP_optic_CompM2_low",
			"CUP_acc_ANPEQ_2_Black_Top",
			"CUP_NVG_PVS14",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
		};
		items[] = {
			MEDICAL_LOADOUT,
			"ACE_EntrenchingTool",
			"ACRE_PRC148"
		};
		weapons[] = {
			"CUP_arifle_M4A1",
			"CUP_launch_M136"
		};
		magazines[] = {
			MAG_13("CUP_30Rnd_556x45_Stanag"),
			MAG_2("CUP_HandGrenade_M67"),
			MAG_2("SmokeShell")
		};
	};
	class Rifleman_AT_M72A6: Rifleman_AT_M136 {
		displayName = "Rifleman (M72A6)";
		weapons[] = {
			"CUP_arifle_M4A1",
			"CUP_launch_M72A6"
		};
	};
	class Autorifleman: Rifleman_AT_M136 {
		displayName = "Autorifleman";
		role = "Autorifleman";
		linkedItems[] = {
			"CUP_V_B_Interceptor_Rifleman_M81",
			"CUP_H_PASGTv2_DCU",
			"CUP_optic_ElcanM145",
			"CUP_NVG_PVS14",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"CUP_lmg_m249_pip2"
		};
		magazines[] = {
			MAG_6("CUP_200Rnd_TE4_Red_Tracer_556x45_M249"),
			MAG_2("SmokeShell")
		};
	};
	class Assistant_Autorifleman: Rifleman_AT_M136 {
		displayName = "Assistant Autorifleman";
		role = "Assistant_Autorifleman";
		weapons[] = {
			"CUP_arifle_M4A1"
		};
		magazines[] = {
			MAG_13("CUP_30Rnd_556x45_Stanag"),
			MAG_4("CUP_200Rnd_TE4_Red_Tracer_556x45_M249"),
			MAG_2("CUP_HandGrenade_M67"),
			MAG_2("SmokeShell")
		};
	};
	class Team_Leader: Rifleman_AT_M136 {
		displayName = "Team Leader";
		role = "Team_Leader";
		rank = "CORPORAL";
		weapons[] = {
			"CUP_arifle_M4A1_BUIS_GL",
			"ACE_VectorDay"
		};
		magazines[] = {
			MAG_13("CUP_30Rnd_556x45_Stanag"),
			MAG_8("CUP_1Rnd_HE_M203"),
			MAG_2("CUP_HandGrenade_M67"),
			MAG_2("SmokeShell")
		};
	};
	class Squad_Leader: Rifleman_AT_M136 {
		displayName = "Squad Leader";
		role = "Squad_Leader";
		rank = "SERGEANT";
		linkedItems[] = {
			"CUP_V_B_Interceptor_Rifleman_M81",
			"CUP_H_PASGTv2_DCU",
			"CUP_optic_CompM2_low",
			"CUP_acc_ANPEQ_2_Black_Top",
			"CUP_NVG_PVS14",
			"ItemMap",
			"ItemcTab",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"CUP_arifle_M4A1_BUIS_GL",
			"ACE_VectorDay"
		};
		magazines[] = {
			MAG_13("CUP_30Rnd_556x45_Stanag"),
			MAG_8("CUP_1Rnd_HE_M203"),
			MAG_2("CUP_HandGrenade_M67"),
			MAG_2("SmokeShell")
		};
	};
	
	class Medic: Rifleman_AT_M136 {
		displayName = "Medic";
		role = "Medic";
		medic = 1;
		weapons[] = {
			"CUP_arifle_M4A1"
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
			"ACRE_PRC148"
		};
	};
	
	//Rotary-Wing Pilot
	class Helicopter_Pilot: Rifleman_AT_M136 {
		displayName = "Helicopter Pilot";
		role = "Helicopter_Pilot";
		rank = "CAPTAIN";
		heli = 1;
		uniformClass = "CUP_U_B_USMC_PilotOverall";
		backpack = "";
		linkedItems[] = {
			"CUP_V_B_PilotVest",
			"CUP_H_SPH4",
			"CUP_NVG_PVS7",
			"ItemMap",
			"ItemcTab",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"CUP_arifle_M4A1"
		};
		magazines[] = {
			MAG_3("CUP_30Rnd_556x45_Stanag"),
			MAG_2("SmokeShell"),
			MAG_2("SmokeShellGreen")
		};
	};
	
	//Armour Crew
	class Armour_Commander: Rifleman_AT_M136 {
		displayName = "Armour Commander";
		role = "Armour_Commander";
		rank = "SERGEANT";
		armour = 1;
		backpack = "";
		linkedItems[] = {
			"CUP_V_B_Interceptor_Base_Olive",
			"CUP_H_CVC",
			"ItemMap",
			"ItemcTab",
			"ItemCompass",
			"ItemWatch"
		};
		weapons[] = {
			"CUP_arifle_M4A1"
		};
		magazines[] = {
			MAG_5("CUP_30Rnd_556x45_Stanag"),
			MAG_2("SmokeShell"),
			MAG_2("SmokeShellGreen")
		};
	};
	class Armour_Crew: Armour_Commander {
		displayName = "Armour Crew";
		role = "Armour_Crew";
		rank = "PRIVATE";
		linkedItems[] = {
			"CUP_V_B_Interceptor_Base_Olive",
			"CUP_H_CVC",
			"ItemMap",
			"ItemCompass",
			"ItemWatch"
		};
	};
};
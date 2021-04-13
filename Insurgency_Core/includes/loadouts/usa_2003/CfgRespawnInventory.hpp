class CfgRespawnInventory {
	//Section
	class Rifleman_AT_M136 {
		displayName = "Rifleman (M136)";
		icon = "";
		role = "Rifleman_AT";
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
			"ItemRadio"
		};
		items[] = {
			MEDICAL_LOADOUT,
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
			"ItemWatch",
			"ItemRadio"
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
		weapons[] = {
			"CUP_arifle_M4A1_GL_carryhandle",
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
		weapons[] = {
			"CUP_arifle_M4A1_GL_carryhandle",
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
			"ACRE_PRC148"
		};
	};
};
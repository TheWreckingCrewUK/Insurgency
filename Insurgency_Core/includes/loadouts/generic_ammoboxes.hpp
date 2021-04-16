class Medical_Supply {
	displayName = "Medical Resupply";
	type = "ACE_medicalSupplyCrate";
	size = 1;
	cost = 5;
	class Weapons {};
	class Magazines {};
	class Items {
		ADD(ACE_fieldDressing, 12);
		ADD(ACE_elasticBandage, 12);
		ADD(ACE_quikclot, 12);
		ADD(ACE_packingBandage, 12);
		
		ADD(ACE_morphine, 12);
		ADD(ACE_epinephrine, 12);
		ADD(ACE_atropine, 2);
		ADD(ACE_adenosine, 2);
		
		ADD(ACE_salineIV_500, 12);
		ADD(ACE_salineIV_250, 2);
		ADD(ACE_tourniquet, 4);
		ADD(ACE_bodyBag, 6);
		ADD(TWC_Item_Medical_SutureKit_25, 1);
	};
};

class EOD {
	displayName = "EOD Equipment";
	type = "Box_NATO_Equip_F";
	size = 1;
	cost = 2;
	class Weapons {
		ADD(ACE_VMM3, 5);
	};
	class Magazines {};
	class Items {
		ADD(ACE_DefusalKit, 5);
	};
};

//Tasks
class Humanitarian_Aid {
	displayName = "Humanitarian Aid";
	type = "CargoNet_01_box_F";
	size = 5;
	cost = 5;
	script = "_this call TWC_Insurgency_Actions_fnc_addGiveCrate";
	class Weapons {};
	class Magazines {};
	class Items {
		ADD(ACE_Humanitarian_Ration, 500);
		ADD(ACE_WaterBottle, 500);
		ADD(ACE_Banana, 500);
	};
};
class Money {
	displayName = "Cash";
	type = "Box_NATO_Equip_F";
	size = 1;
	cost = 5;
	class Weapons {};
	class Magazines {};
	class Items {
		ADD(CUP_item_Money, 10);
	};
};

//Vehicles
class Wheel {
	displayName = "Spare Wheel";
	type = "ACE_Wheel";
	size = 1;
	cost = 1;
	class Weapons {};
	class Magazines {};
	class Items {};
};
class Vehicle_Ammo {
	displayName = "Vehicle Ammo";
	type = "CUP_BOX_US_ARMY_WpsSpecial_F";
	size = 3;
	cost = 5;
	vehicleSupply = 100;
	class Weapons {};
	class Magazines {};
	class Items {
		ADD(ToolKit, 1);
	};
};
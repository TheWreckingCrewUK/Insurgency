class TWC_Insurgency_bluforActions {
	class bluforActions {
		file = "Insurgency_Core\client\bluforActions";
		tag = "bluforActions";
		class init {
			postInit = 1;
		};
		class initHandlers {
			preInit = 1;
		};
		
		//Recovery of prisoners/vehicles
		class addRecover			{};
		class recover				{};
		
		//Vehicle/Ammo Spawning
		class getSupply				{};
		class addDelete				{};
		
		class getAmmoCost			{};
		class canSpawnAmmo			{};
		class spawnAmmo				{};
		
		class canSpawnVehicle		{};
		class spawnVehicle			{};
		
		class canSpawnPatrolBase	{};
		class spawnPatrolBase		{};
		
		//Patrol Base Deployments
		class addPatrolBase			{};
		class canCreatePatrolBase	{};
		class createPatrolBase		{};
	};
};
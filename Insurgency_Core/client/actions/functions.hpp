class TWC_Insurgency_Actions {
	class actions {
		file = "Insurgency_Core\client\actions";
		tag = "Actions";
		class init					{};
		
		//Town/Civs
		class addCiv				{};
		class addElder				{};
		class getElder				{};
		class getElderTask			{};
		class questionElder			{};
		
		//Aid Task
		class addGiveCrate			{};
		class canGiveCrate			{};
		class giveCrate				{};
		
		//Dispute Task
		class addTaskDispute		{};
		class taskDispute			{};
		class removeTaskDispute		{};
		
		//Cash Task
		class addTaskCash			{};
		class taskCash				{};
		class removeTaskCash		{};
		
		//Recovery of prisoners/vehicles
		class addRecover			{};
		class recover				{};
		
		//Vehicle/Ammo Spawning
		class getSupply				{};
		
		class getAmmoCost			{};
		class canSpawnAmmo			{};
		class spawnAmmo				{};
		
		class getVehicleCost		{};
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
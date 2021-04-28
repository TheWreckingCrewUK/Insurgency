class TWC_Insurgency_Locations {
	class Locations {
		file = "Insurgency_Core\server\locations";
		tag = "Locations";
		
		//Init
		class init {
			postInit = 1;
		};
		
		//Location Activation
		class activationLoop		{};
		class townActivate			{};
		class townDeactivate		{};
		
		//Utility
		class spawnCache			{};
		class cacheDestroyed		{};
		class getCaches				{};
		class getInfo				{};
		class getStrongholds		{};
		class questionElder			{};
		class handleDeath			{};
		class handleDestruction		{};
		class randomLocationASL		{};
		class nearestLocation		{};
		
		//Location Modification
		class modifyAllegiance		{};
		class modifyCache			{};
		class modifyStronghold		{};
		
		//Tasks
		class getElderTask			{};
		class taskID				{};
		class taskReward			{};
		
		class taskAid				{};
		class taskCamp				{};
		class taskCash				{};
		class taskDispute			{};
		class taskHVT				{};
		class taskIED				{};
	};
};
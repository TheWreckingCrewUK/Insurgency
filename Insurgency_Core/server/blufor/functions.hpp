class TWC_Insurgency_BLUFOR {
	class BLUFOR {
		file = "Insurgency_Core\server\blufor";
		tag = "BLUFOR";
		class init {
			postInit = 1;
		};
		class taskCreate			{};
		class taskFail				{};
		class taskSucceed			{};
		class taskCanceled			{};
		class taskID				{};
		class updateSupply			{};
		class goodRecovery			{};
		class playerSide			{};
		class createPatrolBase		{};
		
		//Tasks
		class taskPacifyRegion		{};
		class taskRecoverVehicle	{};
		class taskRescueJournalist	{};
		class taskRescuePilot		{};
		class taskEliminateHVT		{};
		class taskAA				{};
	};
};
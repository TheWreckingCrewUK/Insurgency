class TWC_Insurgency_Debug {
	class Debug {
		file = "Insurgency_Core\server\debug";
		tag = "Debug";
		//Init
		class initHandlers {
			postInit = 1;
		};
		//Mission Prep
		class makeBadLocations		{};
		class makeLocations			{};
		
		//Zeus
		class getAllegiance			{};
		class markCachedUnits		{};
		class markCaches			{};
		class markCamps				{};
		class markIEDs				{};
		class markStrongholds		{};
		class unmarkCachedUnits		{};
		class unmarkIEDs			{};
	};
};
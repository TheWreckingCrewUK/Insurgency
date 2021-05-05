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
		class makeLocationsConfig	{};
		
		//Zeus
		class markCachedUnits		{};
		class markCaches			{};
		class markCamps				{};
		class markIEDs				{};
		class markStrongholds		{};
		class sendInfo				{};
		class unmarkCachedUnits		{};
		class unmarkIEDs			{};
	};
};
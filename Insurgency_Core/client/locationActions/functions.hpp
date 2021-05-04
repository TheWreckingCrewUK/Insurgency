class TWC_Insurgency_locationActions {
	class locationActions {
		file = "Insurgency_Core\client\locationActions";
		tag = "locationActions";
		class init {
			postInit = 1;
		};
		class initHandlers {
			preInit = 1;
		};
		
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
	};
};
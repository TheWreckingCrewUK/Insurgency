class TWC_Insurgency_OPFOR {
	class OPFOR {
		file = "Insurgency_Core\server\opfor";
		tag = "OPFOR";
		//Init
		class init						{};
		class initIEDs					{};
		class initStrongholds			{};
		class resourceLoop				{};
		
		//Utility
		class cacheGroup				{};
		class deleteGroup				{};
		class enemySide					{};
		class getClosestStronghold		{};
		class nearbyEnemies				{};
		class removeFromCache			{};
		class updateSupply				{};
		class updateManpower			{};
		class findBuildings				{};
		class plantIED					{};
		class nearestIED				{};
		class nearestCamp				{};
		
		//Tasks
		class spawnTask					{};

		//Activation
		class activateStronghold		{};
		class activateLocation			{};
		class deactivateStronghold		{};
		class deactivateLocation		{};
		
		#include "commanderAI\functions.hpp"
		#include "tacticalAI\functions.hpp"
	};
};
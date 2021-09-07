#include "..\..\includes\script_component.hpp"

if (isDedicated) exitWith {DEBUG_LOG("Loadouts do not need to be called on server.")};

//Set faction rank depending on playerside
private _ranks = getArray (missionConfigFile >> "TWC_Insurgency_playerRanks");
private _faction = switch (getNumber (missionConfigFile >> "TWC_Insurgency" >> "playerSide")) do {
	case 0: {"NATO_F"};
	case 1: {"OPF_F"};
	case 2: {"IND_F"};
	default {};
};
[_faction, _ranks] call ace_nametags_fnc_setFactionRankIcons;

//Adds the loadouts for the players to select.
private _type = roleDescription player;
if (_type isNotEqualTo "") then {
	_type = (_type splitString "@") select 0;
	
	{
		private _config = configName _x;
		private _role = getText (missionConfigFile >> "CfgRespawnInventory" >> _config >> "role");
		private _name = getText (missionConfigFile >> "CfgRoles" >> _role >> "displayName");
		
		if (_name isEqualTo _type) then {
			[player, _config] call BIS_fnc_addRespawnInventory;
			
			//Set rank according to config.
			private _rank = getText (missionConfigFile >> "CfgRespawnInventory" >> _config >> "rank");
			player setRank _rank;
			
			//Also set special roles if they are
			private _isMedic = getNumber (missionConfigFile >> "CfgRespawnInventory" >> _config >> "medic");
			if (_isMedic isEqualTo 1) then {
				player setUnitTrait ["medic", true];
			};
			
			private _isArmour = getNumber (missionConfigFile >> "CfgRespawnInventory" >> _config >> "armour");
			if (_isArmour isEqualTo 1) then {
				player setVariable ["TWC_Insurgency_isArmour", true];
			};
			
			private _isHeli = getNumber (missionConfigFile >> "CfgRespawnInventory" >> _config >> "heli");
			if (_isHeli isEqualTo 1) then {
				player setVariable ["TWC_Insurgency_isHeli", true];
			};
			
			private _isPlane = getNumber (missionConfigFile >> "CfgRespawnInventory" >> _config >> "plane");
			if (_isPlane isEqualTo 1) then {
				player setVariable ["TWC_Insurgency_isPlane", true];
			};
		};
	} forEach ("true" configClasses (missionConfigFile >> "CfgRespawnInventory"));
} else {
	DEBUG_LOG("Cannot initialise loadout/variables in SP")
};

//Adds the possible spawn locations.
[player, "base", markerText "base"] call BIS_fnc_addRespawnPosition;

//Create Briefing Entries.
player createDiarySubject ["Insurgency", "Insurgency"];

player createDiaryRecord ["Insurgency", ["Strongholds", "The insurgents have several strongholds in the area. These are typically devoid of civilians but have a large insurgent presence. Heavy weapons may often be deployed here. Should they be cleared by our forces, the civilian populace will likely return and be very grateful towards us. These strongholds will often serve as a command hub for hostiles as well."]];
player createDiaryRecord ["Insurgency", ["IEDs", "Insurgent forces are known to make heavy use of Improvised Explosive Devices (IEDs). Often placed on roads by what appear to be civilians at the times, these concealed explosives are a high threat to our forces and the civilian populace."]];
player createDiaryRecord ["Insurgency", ["Towns", "The local cities, towns, and villages have all been absorbed into the insurgent network. An elder representing the local populace is often around. Working with him may increase the opinion the local populace has of you. Better relations with these locals may in turn lead to better intel on the insurgents."]];
player createDiaryRecord ["Insurgency", ["Supply", "Ammunition and vehicles are gotten from our main base. To get these, supply has to be expended. Supply is limited so make smart choices. More is gained by doing tasks gotten from command."]];
player createDiaryRecord ["Insurgency", ["Local Forces", "Local forces need to be established, trained, and supplied in order to provide security to the region in the long term. While they are not capable of direct action against the insurgents, they are good enough to set up checkpoints and defenses at towns or bases."]];
player createDiaryRecord ["Insurgency", ["Patrol Bases", "Patrol Bases can be established wherever you want. These function as forward reinforcement points, but are juicy targets for the insurgent forces."]];
player createDiaryRecord ["Insurgency", ["Victory", "Victory is achieved by pacifying the local populace, building a good security force, and destroying the insurgent ability to fight."]];
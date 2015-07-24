sand_param_startingBalance = 100000;
sand_param_deathCost = 25000;
sand_param_playerInvestment = 2500;
{publicVariable _x} forEach ["sand_param_startingBalance","sand_param_deathCost","sand_param_playerInvestment"];

// ==========================================
// PRE-INIT CALLS
{_x disableTIequipment true;} forEach (allMissionObjects "All");
enableEngineArtillery false;
enableSaving [false,false];
// ==========================================
// GLOBAL EXECUTION

[] execVM "sand_scripts\zlt_fieldrepair.sqf";
[] execVM "sand_scripts\sand_radioInit.sqf";
[] execVM "sand_scripts\sand_loadoutCreator.sqf";
[] execVM "sand_scripts\sand_pTagInit.sqf";

[] execVM "sand_scripts\greek_gear\IndiGear.sqf";
[] execVM "VCOMAI\init.sqf";



// ==========================================
// 
waitUntil {time > 1};
if (isServer) then {
	// SERVERSIDE EXECUTION
	[] execVM "sand_scripts\sand_econInit.sqf";
};


waitUntil {!isNil "GV_Sand_Balance"};
waitUntil {time > 1};
if !((getPlayerUID player) in GV_Sand_ConnectedIDs) then {
	
	GV_Sand_ConnectedIDs = GV_Sand_ConnectedIDs + [getPlayerUID player]; //add the player uid to the list of uids
	
	GV_Sand_Balance = GV_Sand_Balance + sand_param_playerInvestment; //add the player investment
	
};




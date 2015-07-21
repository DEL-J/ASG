// ==========================================
// PRE-INIT CALLS
enablesentences false;
disableTIequipment true;
enableEngineArtillery false;
enableSaving [false,false];
// ==========================================
// GLOBAL EXECUTION
[] execvm "sand_scripts\zlt_fieldrepair.sqf";
[] execvm "sand_scripts\sand_radioInit.sqf";
[] execvm "sand_scripts\sand_loadoutCreator.sqf";
[] execvm "sand_scripts\sand_pTagInit.sqf";

[] execvm "sand_scripts\greek_gear\IndiGear.sqf";
[] execvm "VCOMAI\init.sqf";

// ==========================================
// 

if (isServer) then {
	// SERVERSIDE EXECUTION
	[] execVM "sand_scripts\sand_econInit.sqf";
};
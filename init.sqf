// ==========================================
// PRE-INIT CALLS
{_x disableTIequipment true;} forEach (allMissionObjects "All");
enableEngineArtillery false;
enableSaving [false,false];
// ==========================================
// GLOBAL EXECUTION

if (isServer) then {
	// SERVERSIDE EXECUTION
	_wait = [] execVM "sand_scripts\sand_econInit.sqf";
};
waitUntil {time > 1;};
[] execVM "sand_scripts\zlt_fieldrepair.sqf";
[] execVM "sand_scripts\sand_radioInit.sqf";
[] execVM "sand_scripts\sand_loadoutCreator.sqf";
[] execVM "sand_scripts\sand_pTagInit.sqf";

[] execVM "sand_scripts\greek_gear\IndiGear.sqf";
[] execVM "VCOMAI\init.sqf";

// ==========================================
// 

if (isServer) then {
	// SERVERSIDE EXECUTION
	[] execVM "sand_scripts\sand_econInit.sqf";
};
waitUntil {time > 1};
[player] execVM "sand_scripts\sand_pLoadoutCreator.sqf";
[player] execVM "sand_scripts\sand_briefing.sqf";
//[player] execVM "sand_scripts\sand_radioInit.sqf";
[player] execVM "sand_scripts\sand_lockBoxes.sqf";
[player] execVM "sand_scripts\sand_civInteract.sqf";


if !((str (getPlayerUID player)) in GV_Sand_ConnectedIDs) then {

	GV_Sand_ConnectedIDs = GV_Sand_ConnectedIDs + [str (getPlayerUID player)];
	publicVariable "GV_Sand_ConnectedIDs";
	
	GV_Sand_Balance = GV_Sand_Balance + sand_param_playerInvestment;
	publicVariable "GV_Sand_Balance";
};




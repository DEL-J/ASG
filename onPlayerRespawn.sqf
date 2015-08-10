waitUntil {time > 1};
[player] execVM "sand_scripts\sand_pLoadoutCreator.sqf";
[player] execVM "sand_scripts\sand_radioInit.sqf";
[player] execVM "sand_scripts\sand_lockBoxes.sqf";

GV_Sand_Balance = GV_Sand_Balance - sand_param_deathCost;
publicVariable "GV_Sand_Balance";
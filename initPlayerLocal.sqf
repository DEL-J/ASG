waitUntil {time > 1};
[player] execVM "sand_scripts\sand_pLoadoutCreator.sqf";
[player] execVM "sand_scripts\sand_briefing.sqf";
[player] execVM "sand_scripts\sand_lockBoxes.sqf";
[player] execVM "sand_scripts\sand_AUSMD_earPlugs.sqf";


player addAction["Question", { 
    0 = [cursorTarget] spawn AUSMD_fnc_interrogate
}, nil, 1.5, false, true, "", " 
    cursorTarget isKindOf ""Man"" && alive cursorTarget && side cursorTarget == civilian && player distance cursorTarget < 3
"];
player addAction["Interrogate", { 
    0 = [cursorTarget] spawn AUSMD_fnc_interrogateEnemy; 
}, nil, 1.5, false, true, "", "
    cursorTarget isKindOf ""Man"" && !(player getVariable ""AUSMD_interact_transporting"") && !(cursorTarget getVariable ""AUSMD_interact_beingInterrogated"") && cursorTarget getVariable ""AUSMD_interact_arrested"" && alive cursorTarget && side cursorTarget == enemySide && !(cursorTarget getVariable ""AUSMD_interact_moving"") && player distance cursorTarget < 3
"];

player addAction ["Move Captive",{[] spawn AUSMD_fnc_moveCaptive;},nil,1,False,True,"",' player distance cursorTarget < 5 && cursorTarget getVariable "AUSMD_interact_arrested" && !(cursorTarget getVariable["AUSMD_interact_moving",false]) && alive cursorTarget '];

player addAction ["Restrain Enemy",{ [cursorTarget] spawn AUSMD_fnc_arrested;},nil,1,False,True,"",' cursorTarget isKindOf "Man" && side cursorTarget == enemySide && !(player getVariable "AUSMD_interact_transporting") && cursorTarget getVariable "AUSMD_interact_surrendered" && !(cursorTarget getVariable "AUSMD_interact_arrested") && alive cursorTarget && player distance cursorTarget < 3 '];
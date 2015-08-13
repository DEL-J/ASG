waitUntil {time > 1};
[player] execVM "sand_scripts\sand_pLoadoutCreator.sqf";
[player] execVM "sand_scripts\sand_briefing.sqf";
[player] execVM "sand_scripts\sand_lockBoxes.sqf";
[player] execVM "sand_scripts\sand_civInteract.sqf";

0 spawn {
    waitUntil {alive player && !isNil {uiNamespace getVariable "BIS_revive_keyDownEH"}};
    uiSleep 1;
    findDisplay 46 displayRemoveEventHandler ["KeyDown",uiNamespace getVariable "BIS_revive_keyDownEH"];
    _eh = findDisplay 46 displayAddEventHandler ["KeyDown",{
        private ["_key"];
        _key = _this select 1;
        if (_key == 57) then {
            if (BIS_revive_keyActive == "DISABLED") then {
                // Make sure key is released first
                BIS_revive_keyPressed = true;
            } else {
                if (!(BIS_revive_keyPressed)) then {
                    // Make sure the key HAS to be released
                    BIS_revive_keyPressed = true;
                    
                    switch (BIS_revive_keyActive) do {
                        case "REVIVE_START": {
                            // Select highlighted unit
                            if !("Medikit" in items player) exitWith {
                                BIS_revive_target = objNull;
                                cutText ["you must have a Medkit to revive","PLAIN DOWN",2];
                            };
                            BIS_revive_target = BIS_revive_selected;
                        };
                        
                        case "RESPAWN_START": {
                            // Player is forcing respawn
                            player setVariable ["BIS_revive_forceRespawn", true, true];
                        };
                    };
                    true
                };
            };
        } else {
            if (!(isDedicated) && {player getVariable ["BIS_revive_incapacitated", false]}) then {
                // Disable grenade throwing while incapacitated
                private ["_keys"];
                _keys = actionKeys "Throw";
                if (_key in _keys) then {true};
            };
        };
    }];
    uiNamespace setVariable ["BIS_revive_keyDownEH",_eh];
};
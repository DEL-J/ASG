action_Hello = player addAction["Greet", {systemChat "Hello."
}, nil, 1.5, false, true, "", " 
    (cursorTarget isKindOf ""Man"" && alive cursorTarget && side cursorTarget == civilian && {player distance cursorTarget < 3})
"];

action_Hello = player addAction["Close", {systemChat "Goodbye."
}, nil, 1.5, false, true, "", " 
    (cursorTarget isKindOf ""Man"" && alive cursorTarget && side cursorTarget == civilian && {player distance cursorTarget < 3})
"];

action_interrogate = player addAction["Question", { 
    0 = cursorTarget spawn interrogate
}, nil, 1.5, false, true, "", " 
    (cursorTarget isKindOf ""Man"" && alive cursorTarget && side cursorTarget == civilian && {player distance cursorTarget < 3})
"];

directionText = {
    if ((_this > 22.5) && (_this <= 67.5)) exitWith {"NORTHEAST"};
    if ((_this > 67.5) && (_this <= 112.5)) exitWith {"EAST"};
    if ((_this > 112.5) && (_this <= 157.5)) exitWith {"SOUTHEAST"};
    if ((_this > 157.5) && (_this <= 202.5)) exitWith {"SOUTH"};
    if ((_this > 202.5) && (_this <= 247.5)) exitWith {"SOUTHWEST"};
    if ((_this > 247.5) && (_this <= 295.5)) exitWith {"WEST"};
    if ((_this > 295.5) && (_this <= 337.5)) exitWith {"NORTHWEST"};
    "NORTH"
};

interrogate = {
    if (random 100 > 15) exitWith {systemChat "I don't want to talk about that."};

    private "_enemy";
    _enemy = { if (side _x == east || side _x == independent) exitWith {_x}; objNull } forEach (_this nearEntities [["Man", "Air", "Car", "Motorcycle", "Tank"],1000] - [player]);
    if (isNull _enemy) exitWith {systemChat "I haven't seen any bad guys."};

    systemChat format["There is a %1 enemy group to the %2 of here.",
        call {
            private "_n";
            _n = count units group _enemy;
            switch true do {
                case (_n > 9): {"large"};
                case (_n > 5): {"medium sized"};
                case (_n > 0): {"small"};
                default "";
            }
        },
        ([_this,_enemy] call BIS_fnc_dirTo) call directionText
    ];
};
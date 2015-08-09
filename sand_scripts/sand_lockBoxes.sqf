approvedList6 = [HQ6,HQ5,HQ4,OPS,RO6,CM6,HP1,HP2,HP3];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Headquarters Only";};};
closeInventoryEHidx = CHQ addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList6) then {call fnc_closeInventory;};}];

approvedList5 = [WSL, ASL, WS1, WS2, WS3, WS4, HQ6,HQ5,HQ4,OPS,RO6,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Weapons Squad Only";};};
closeInventoryEHidx = CWB addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList5) then {call fnc_closeInventory;};}];

approvedList1 = [PL1,PS1,RO1,CM1,HQ6,HQ5,HQ4,OPS];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "1st Platoon HQ Only";};};
closeInventoryEHidx = PHQ1 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList1) then {call fnc_closeInventory;};}];

approvedList2 = [PL2,PS2,RO2,CM2,HQ6,HQ5,HQ4,OPS];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "2nd Platoon HQ Only";};};
closeInventoryEHidx = PHQ2 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList2) then {call fnc_closeInventory;};}];

approvedList3 = [PL3,PS3,RO3,CM3,HQ6,HQ5,HQ4,OPS];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "3rd Platoon HQ Only";};};
closeInventoryEHidx = PHQ3 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList3) then {call fnc_closeInventory;};}];

approvedList4 = [PL1,PS1,RO1,CM1,A11,A12,A13,HQ6,HQ5,HQ4,OPS];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "1st Platoon Squad Leaders Only";};};
closeInventoryEHidx = RSE1 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList4) then {call fnc_closeInventory;};}];

approvedList7 = [PL2,PS2,RO2,CM2,A21,A22,A23,HQ6,HQ5,HQ4,OPS];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "2nd Platoon Squad Leaders Only";};};
closeInventoryEHidx = RSE2 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList7) then {call fnc_closeInventory;};}];

approvedList8 = [PL3,PS3,RO3,CM3,A31,A32,A33,HQ6,HQ5,HQ4,OPS];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "3rd Platoon Squad Leaders Only";};};
closeInventoryEHidx = RSE3 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList8) then {call fnc_closeInventory;};}];

approvedList9 = [PL1,PS1,RO1,CM1,A11,A12,A13,HQ6,HQ5,HQ4,OPS];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "1st Platoon Squad Leaders Only";};};
closeInventoryEHidx = RSL1 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList9) then {call fnc_closeInventory;};}];

approvedList10= [PL2,PS2,RO2,CM2,A21,A22,A23,HQ6,HQ5,HQ4,OPS];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "2nd Platoon Squad Leaders Only";};};
closeInventoryEHidx = RSL2 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList10) then {call fnc_closeInventory;};}];

approvedList11= [PL3,PS3,RO3,CM3,A31,A32,A33,HQ6,HQ5,HQ4,OPS];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "3rd Platoon Squad Leaders Only";};};
closeInventoryEHidx = RSL3 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList11) then {call fnc_closeInventory;};}];


approvedList12 = [HQ6,HQ5,HQ4,OPS,PL1,PS1,A11,A11A,A11B,A113,A114,A116,A117];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "One-One Only";};};
closeInventoryEHidx = RS1 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList12) then {call fnc_closeInventory;};}];

approvedList13 = [HQ6,HQ5,HQ4,OPS,PL1,PS1,A12,A12A,A12B,A123,A124,A126,A127];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "One-Two Only";};};
closeInventoryEHidx = RS2 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList13) then {call fnc_closeInventory;};}];

approvedList14 = [HQ6,HQ5,HQ4,OPS,PL1,PS1,A13,A13A,A13B,A133,A134,A136,A137];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "One-Three Only";};};
closeInventoryEHidx = RS3 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList14) then {call fnc_closeInventory;};}];

approvedList15 = [HQ6,HQ5,HQ4,OPS,PL2,PS2,A21,A21A,A21B,A213,A214,A216,A217];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Two-One Only";};};
closeInventoryEHidx = RS4 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList15) then {call fnc_closeInventory;};}];

approvedList16 = [HQ6,HQ5,HQ4,OPS,PL2,PS2,A22,A22A,A22B,A223,A224,A226,A227];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Two-Two Only";};};
closeInventoryEHidx = RS5 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList16) then {call fnc_closeInventory;};}];

approvedList17 = [HQ6,HQ5,HQ4,OPS,PL2,PS2,A23,A23A,A23B,A233,A234,A236,A237];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Two-Three Only";};};
closeInventoryEHidx = RS6 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList17) then {call fnc_closeInventory;};}];

approvedList18 = [HQ6,HQ5,HQ4,OPS,PL3,PS3,A31,A231A,A31B,A313,A314,A316,A317];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Three-One Only";};};
closeInventoryEHidx = RS7 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList18) then {call fnc_closeInventory;};}];

approvedList19 = [HQ6,HQ5,HQ4,OPS,PL3,PS3,A32,A232A,A32B,A323,A324,A326,A327];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Three-Two Only";};};
closeInventoryEHidx = RS8 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList19) then {call fnc_closeInventory;};}];

approvedList20 = [HQ6,HQ5,HQ4,OPS,PL3,PS3,A33,A233A,A33B,A333,A334,A336,A337];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Three-Three Only";};};
closeInventoryEHidx = RS9 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList20) then {call fnc_closeInventory;};}];

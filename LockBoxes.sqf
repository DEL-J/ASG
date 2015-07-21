approvedList6 = [HQ6,HQ5,HQ4,OPS,RO6,CM6,HP1,HP2,HP3];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = CHQ addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList6) then {call fnc_closeInventory;};}];

approvedList5 = [WSL, ASL, WS1, WS2, WS3, WS4, HQ6,HQ5,HQ4,OPS,RO6,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = CWB addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList5) then {call fnc_closeInventory;};}];

approvedList1 = [PL1,PS1,RO1,CM1,HQ6,HQ5,HQ4,OPS,RO6,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = PHQ1 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList1) then {call fnc_closeInventory;};}];

approvedList2 = [PL2,PS2,RO2,CM2,HQ6,HQ5,HQ4,OPS,RO6,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = PHQ2 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList2) then {call fnc_closeInventory;};}];

approvedList3 = [PL3,PS3,RO3,CM3,HQ6,HQ5,HQ4,OPS,RO6,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = PHQ3 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList3) then {call fnc_closeInventory;};}];

approvedList4 = [PL1,PS1,RO1,CM1,A11,A12,A13,HQ6,HQ5,HQ4,OPS,RO6,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = RSE1 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList4) then {call fnc_closeInventory;};}];

approvedList7 = [PL2,PS2,RO2,CM2,A21,A22,A23,HQ6,HQ5,HQ4,OPS,RO6,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = RSE2 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList7) then {call fnc_closeInventory;};}];

approvedList8 = [PL3,PS3,RO3,CM3,A31,A32,A33,HQ6,HQ5,HQ4,OPS,RO6,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = RSE3 addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList8) then {call fnc_closeInventory;};}];

approvedList9 = [CM1,CM2,CM3,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = Med addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList9) then {call fnc_closeInventory;};}];

approvedList10 = [HQ6,HQ5,HQ4,OPS,RO6,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = BoxYankee addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList10) then {call fnc_closeInventory;};}];

approvedList11 = [HQ6,HQ5,HQ4,OPS,RO6,CM6];
fnc_closeInventory = {null = [] spawn {waituntil {!(isNull findDisplay 602)};
closeDialog 0; hint "Access denied";};};
closeInventoryEHidx = Med addEventHandler ["ContainerOpened", {if !((_this select 1) in approvedList11) then {call fnc_closeInventory;};}];
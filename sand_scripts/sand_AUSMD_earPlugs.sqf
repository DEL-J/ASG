AUSMDPlug = player addAction ["<t color=""#ffffff"">" + "Insert Earplugs" + "</t>", {
if (soundVolume > .04) then {.1 fadeSound .04; player setUserActionText [AUSMDPlug, "<t color=""#ffffff"">" + "Remove Earplugs" + "</t>"]} else {.1 fadeSound 1; player setUserActionText [AUSMDPlug, "<t color=""#ffffff"">" + "Insert Earplugs" + "</t>"]}
}, [], 0, false, true]; 
if (soundVolume <= .04) then {player setUserActionText [AUSMDPlug, "<t color=""#ffffff"">" + "Remove Earplugs" + "</t>"]};
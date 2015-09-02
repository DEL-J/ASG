_unit = _this select 0;

if(_unit getVariable "AUSMD_interact_gaveInfo") exitWith {systemChat "I have no more information for you.";};

diag_log "Interrogate Enemy SCRIPT : starting";

_unit setVariable["AUSMD_interact_beingInterrogated",true,true];

diag_log "Interrogate Enemy SCRIPT : vars set";

willTalk = false;

_hitHandler = _unit addEventHandler
[
	"Hit",
	{
		if(random 120 < random 100) then
		{
			willTalk = true;
		}
		else
		{
			[[],"AUSMD_fnc_hostileSaying",(_this select 1),true] spawn BIS_fnc_MP;
		};
	}
];

hint "You will need to get creative getting the enemy captive to talk.... \n\n try shooting him in the foot or grazing him with a bullet.";

diag_log "Interrogate Enemy SCRIPT : actions set";

_killedHandler = _unit addEventHandler["Killed",{_unit removeEventHandler["Hit",_hitHandler];_unit removeEventHandler["Killed",_killedHandler];}];

waitUntil{!alive _unit || willTalk};

if(!alive _unit) exitWith {diag_log "Interrogate Enemy SCRIPT : Unit dead, exiting";};

diag_log "Interrogate Enemy SCRIPT : conditions met, continuing";

auslog GlobalChat "Ok Ok, please no more, I will spill everything to you.";

hint "This enemy captive has given in and will now give you information.";

_unit removeEventHandler["Hit",_hitHandler];
_unit removeEventHandler["Killed",_killedHandler];

diag_log "Interrogate Enemy SCRIPT : removed event handlers";

sleep 2;

diag_log "Interrogate Enemy SCRIPT : providing info";

_unit setVariable["AUSMD_interact_beingInterrogated",false,true];

if(random 100 > 70) then
{
	private "_enemy";
	_enemy = 
	{ 
		if (side _x == enemySide) exitWith 
		{
			_x
		};
		objNull 
	} forEach (_unit nearEntities [["Man", "Air", "Car", "Motorcycle", "Tank"],1000] - [player]);

	if (isNull _enemy) exitWith {systemChat "I haven't seen any bad guys."};

	auslog globalChat format["There is a %1 group to the %2 of here.",
		call {
			_n = count units group _enemy;
			switch true do {
				case (_n > 9): {"large"};
				case (_n > 5): {"medium sized"};
				case (_n > 0): {"small"};
				default "";
			}
		},
		[([_unit,_enemy] call BIS_fnc_dirTo)] call AUSMD_fnc_directionText
	];
}
else
{
	//provide special mission
	_mission = AUSMD_missions call BIS_fnc_selectRandom;
	switch(_mission) do
	{
		case "enemyFort": {[[_unit],"AUSMD_fnc_enemyFort",ZeusUnit,False,False] spawn BIS_fnc_MP;auslog globalChat "My base is nearby, I have marked it on the map";};
		case "powerStation": {[[_unit],"AUSMD_fnc_powerStation",ZeusUnit,False,False] spawn BIS_fnc_MP;auslog globalChat "We took over a power station nearby, I have marked it on the map.";};
		case "fuelDepot": {[[_unit],"AUSMD_fnc_fuelDepot",ZeusUnit,False,False] spawn BIS_fnc_MP;auslog globalChat "We have a fuel depot nearby, I have marked it on your map.";};
	};
};

_unit setVariable ["AUSMD_interact_gaveInfo",true,true];
diag_log "Interrogate Enemy SCRIPT : script done";

_unit = _this select 0;
_enemySide = _this select 1;
if (random 100 > 15) exitWith
{
	systemChat "I don't want to talk to you.";
};

private "_enemy";
_enemy = 
{ 
	if (side _x == east || side _x == independent) exitWith 
	{
		_x
	};
	objNull 
} forEach (_unit nearEntities [["Man", "Air", "Car", "Motorcycle", "Tank"],1000] - [player]);

if (isNull _enemy) exitWith {systemChat "I haven't seen any bad guys."};

systemChat format["There is a %1 enemy group to the %2 of here.",
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

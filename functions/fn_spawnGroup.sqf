_side = _this select 0;
_units = _this select 1;
_position = _this select 2;

_position set[2,0];
_amount = _this select 3;
_grp = createGroup _side;
diag_log format["SPAWN GROUP :: PARAMS %1 - %2 - %3 - %4 ",_side,_units,_position,_amount];
_position = [(_position select 0) + (random _amount - random _amount),(_position select 1) + (random _amount - random _amount),_position select 2];

sleep 0.1;
{

	_x createUnit [_position, _grp,"uni = this;",(0.2 + random 0.5)];
	if(side uni == east) then
	{
		uni setVariable ["AUSMD_interact_tiedUp",false,true];
		uni setVariable ["AUSMD_interact_arrested",false,true];
		uni setVariable ["AUSMD_interact_beingInterrogated",false,true];
		uni setVariable ["AUSMD_interact_gaveInfo",false,true];

		_hitHandle = uni addEventHandler
		[
			"Hit",
			{
				if(side (_this select 0) != side (_this select 1)) then 
				{
					_chance = 25;
				
					if(random 200 < _chance && !((_this select 0) getVariable "AUSMD_interact_arrested")) then
					{
						[(_this select 0)] spawn AUSMD_fnc_surrender;
					};
				};
			}
		];
		uni addEventHandler["Killed",{uni removeEventHandler["Hit",_hitHandle];}];
	};
} forEach _units;

diag_log format ["SPAWN GROUP :: Units %1 - Position %2 - Search Dist - %3",_units,_position,_amount];

_grp;
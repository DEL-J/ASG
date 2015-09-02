_curator = _this select 0;

AUSMD_missions = ["powerStation","fuelDepot","enemyFort"];

westGroups = [["B_Soldier_SL_F","B_soldier_AR_F","B_HeavyGunner_F","B_soldier_AAR_F","B_soldier_M_F","B_Sharpshooter_F","B_soldier_LAT_F","B_medic_F"],["B_Soldier_TL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F"],["B_soldier_SL_F","B_soldier_F","B_soldier_LAT_F","B_soldier_M_F","B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"],["B_recon_TL_F","B_recon_M_F","B_recon_medic_F","B_recon_LAT_F"]];
eastGroups = [["O_Soldier_SL_F","O_Soldier_AR_F","O_HeavyGunner_F","O_Soldier_AAR_F","O_soldier_M_F","O_Sharpshooter_F","O_Soldier_LAT_F","O_medic_F"],["O_Soldier_TL_F","O_Soldier_AT_F","O_Soldier_AT_F","O_Soldier_AAT_F"],["O_soldier_SL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F"],["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_F"]];
{
	if(isPlayer _x) then
	{
		_x setVariable ["AUSMD_interact_transporting",false,true];
	};
	if(side _x == enemySide && !isPlayer _x) then
	{
		_x setVariable ["AUSMD_interact_surrendered",false,true];
		_x setVariable ["AUSMD_interact_tiedUp",false,true];
		_x setVariable ["AUSMD_interact_arrested",false,true];
		_x setVariable ["AUSMD_interact_beingInterrogated",false,true];
		_x setVariable ["AUSMD_interact_gaveInfo",false,true];

		_hitHandle = _x addEventHandler["Hit",{if(side (_this select 0) != side (_this select 1)) then 	{_chance = 40;	if(random 400 < _chance && !((_this select 0) getVariable "AUSMD_interact_arrested")) then	{[[(_this select 0)],"AUSMD_fnc_surrender",(_this select 1),true] spawn BIS_fnc_MP;};};	}];
	};
} forEach allUnits;

_curator addEventHandler[
"CuratorObjectPlaced",
{
	if((_this select 1) isKindOf "Man" && side (_this select 1) == enemySide) then
	{
		_unit = _this select 0;
		_unit setVariable ["AUSMD_interact_surrendered",false,true];
		_unit setVariable ["AUSMD_interact_tiedUp",false,true];
		_unit setVariable ["AUSMD_interact_arrested",false,true];
		_unit setVariable ["AUSMD_interact_beingInterrogated",false,true];
		_unit setVariable ["AUSMD_interact_gaveInfo",false,true];
		if(side _unit == enemySide) then
		{
			_hitHandle = _unit addEventHandler
			[
				"Hit",
				{
					if(side (_this select 0) != side (_this select 1)) then 
					{
						_chance = 40;
					
						if(random 400 < _chance && !((_this select 0) getVariable "AUSMD_interact_arrested")) then
						{
							[[(_this select 0)], "AUSMD_fnc_surrender",(_this select 1),true] spawn BIS_fnc_MP;
						};
					};
				}
			];
		};
		
	};
}
];

_curator addEventHandler[
"CuratorGroupPlaced",
{
	{
		if(_x isKindOf "Man" && side _x == enemySide) then
		{
			_x setVariable ["AUSMD_interact_surrendered",false,true];
			_x setVariable ["AUSMD_interact_tiedUp",false,true];
			_x setVariable ["AUSMD_interact_arrested",false,true];
			_x setVariable ["AUSMD_interact_beingInterrogated",false,true];
			_x setVariable ["AUSMD_interact_gaveInfo",false,true];
			if(side _x == enemySide) then
			{
				_hitHandle = _x addEventHandler
				[
					"Hit",
					{
						if(side (_this select 0) != side (_this select 1)) then 
						{
							_chance = 40;
						
							if(random 400 < _chance && !((_this select 0) getVariable "AUSMD_interact_arrested")) then
							{
								[[(_this select 0)], "AUSMD_fnc_surrender",(_this select 1),true] spawn BIS_fnc_MP;
							};
						};
					}
				];
			};
		};
	} forEach units (_this select 1);
}
];


_unit = _this select 0;
//_anim = _this select 1; 

if(isPlayer _unit || _unit getVariable "AUSMD_interact_surrendered") exitWith {diag_log "SURRENDER SCRIPT : Unit is a player";};

diag_log format["SURRENDER SCRIPT:: Surrender Script Activated for unit %1",_unit];

_unit switchMove "";

_unit setUnitPos "UP";

sleep 1;

if(alive _unit) then
{
	diag_log format["SURRENDER SCRIPT:: Surrender Script for unit %1 continuing on",_unit];
	
	_mainGun = primaryWeapon _unit;
	_secondary = secondaryWeapon _unit;
	
	_holder = createVehicle ["WeaponHolderSimulated" ,[(getpos _unit select 0) + (random 0.0002 - random 0.0002),(getpos _unit select 1) + (random 0.0002 - random 0.0002),1],[],0,"CAN_COLLIDE"];
	
	_holder setDir (random 360);
	
	if(_mainGun != "") then
	{
		_holder addWeaponCargoGlobal [_mainGun,1];
	};
	if(_secondary != "") then
	{
		_holder addWeaponCargoGlobal [_secondary,1];
	};
	
	_holder setVelocity [random 6,random 6,random 6];
	
	removeAllWeapons _unit;
	
	
	if(isMultiplayer) then
	{	 
		[[_unit,"AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"],"AUSMD_fnc_animation",true,true] spawn BIS_fnc_MP;
	}
	else
	{
		_unit switchMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
	};
	sleep 0.095;
	
	diag_log "SURRENDER SCRIPT : Unit anim set";
	
	_unit setVariable ["AUSMD_interact_surrendered",true,true];
	
	diag_log "SURRENDER SCRIPT : Unit action and variable set, unit has been surrendered";
	
	
	_unit disableAI "ANIM";
	_unit disableAI "MOVE";
	
	diag_log "SURRENDER SCRIPT : disabled behaviours";
	

	waitUntil{!alive _unit || _unit getVariable "AUSMD_interact_arrested"};
	
	diag_log "SURRENDER SCRIPT : Unit action terminated, script finished or unit arrested";
};

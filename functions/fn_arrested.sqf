/*
	File: fn_arrested.sqf
	Author: austinXmedic

	Description:
	plays anim's for all clients in MP

	Parameter(s):
	_this select 0 -	OBJECT	- Unit 
		

	Returns:
	Nothing
*/

_unit = _this select 0;

if(_unit getVariable "AUSMD_interact_arrested") exitWith {diag_log "ARREST SCRIPT : Unit is already arrested";};


{
	_unit setVariable _x;
} forEach [["AUSMD_interact_arrested",true,true],["AUSMD_interact_moving",false,true]];

_unit enableAI "ANIM";
if(isMultiplayer) then
{
	[[_unit,"AmovPercMstpSnonWnonDnon_EaseIn"],"AUSMD_fnc_animation",true,true] spawn BIS_fnc_MP;
}
else
{
	_unit switchMove "AmovPercMstpSnonWnonDnon_EaseIn";
};
sleep 0.06;

if(isMultiplayer) then
{
	[[_unit,"AmovPercMstpSnonWnonDnon_Ease"],"AUSMD_fnc_animation",true,true] spawn BIS_fnc_MP;
}
else
{
	_unit switchMove "AmovPercMstpSnonWnonDnon_Ease";
};
_unit disableAI "ANIM"; 

diag_log "ARREST SCRIPT : Script Done";

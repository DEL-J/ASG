/*
	File: fn_createGroup.sqf
	Author: austinXmedic

	Description:
	selects a group set to use for spawn group function

	Parameter(s):
	_this select 0 -	SIDE	- side to select from
	_this select 1 - NUMBER - distance to randomize spawn location
	_this select 2 - ARRAY - center position
		

	Returns:
	ARRAY - Unit classnames of group units
*/

_side = _this select 0;
_distance = _this select 1;
_position = _this select 2;
diag_log format["CREATE GROUP :: PARAMS %1 %2 %3",_side,_distance,_position];
_group = [];

if(_side == west) then
{
	_group = westGroups call BIS_fnc_selectRandom;
}
else
{
	_group = eastGroups call BIS_fnc_selectRandom;
};

diag_log format["CREATE GROUP :: PICKED GROUP %1 ",_group];

_grpp = [_side,_group,_position,_distance] call AUSMD_fnc_spawnGroup;

_grpp;

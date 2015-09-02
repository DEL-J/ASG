/*
	File: fn_animation.sqf
	Author: austinXmedic

	Description:
	plays anim's for all clients in MP

	Parameter(s):
	_this select 0 -	ARRAY	- Center Position
	_this select 1 - NUMBER - Max Distance
	_this select 2 - (Optional) STRING - Classname of object to accomodate
		

	Returns:
	ARRAY
*/

_centerPos = _this select 0;
_maxDist = _this select 1;
_object = _this select 2;

scopeName "main";

if(count _this < 3) then
{
	_object = "";
};

_loop = 0;

_posNow = [];

_isFlat = [];

for "_i" from 0 to 300 do
{
	scopeName "loop";
	_loop = _loop + 1;
	_posNow = [(_centerPos select 0) + (random _maxDist - random _maxDist),(_centerPos select 1) + (random _maxDist - random _maxDist),0];
		
	if(_object isEqualTo "") then
	{
		_isFlat = _posNow isFlatEmpty 
		[
			5,	//--- Minimal distance from another object
			0,				//--- If 0, just check position. If >0, select new one
			0.7,				//--- Max gradient
			8,	//--- Gradient area
			0,				//--- 0 for restricted water, 2 for required water,
			false,				//--- True if some water can be in 25m radius
			objNull
		];
	}
	else
	{
		_isFlat = _posNow isFlatEmpty 
		[
			(sizeof _object) / 2,	//--- Minimal distance from another object
			0,				//--- If 0, just check position. If >0, select new one
			0.7,				//--- Max gradient
			(sizeof _object),	//--- Gradient area
			0,				//--- 0 for restricted water, 2 for required water,
			false,				//--- True if some water can be in 25m radius
			objNull
		];
	};

	if(_loop > 50) then
	{
		_loop = 0;
		_centerPos set[0,(_centerPos select 0) + (random 800 - random 800)];
		_centerPos set[1,(_centerPos select 1) + (random 800 - random 800)];
		diag_log "FIND LOC :: Changing base location because no match was found...";
	};
	
	if(!(_isFlat isEqualTo []) && _isFlat distance _centerPos > 700 && _isFlat distance (getMarkerPos "HQ") > 700 && _isFlat distance (getMarkerPos "Respawn_West") > 500 ) then {breakTo "main";};
	
	diag_log format ["FIND LOC :: Searching for location again....  old location : %1",_posNow];
};
diag_log format ["FIND LOC :: Exiting, location found : %1",_isFlat];

_isFlat;
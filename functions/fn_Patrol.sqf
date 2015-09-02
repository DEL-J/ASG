/*
	File: fn_patrol.sqf
	Author: austinXmedic

	Description:
	set up waypoints for group to patrol

	Parameter(s):
	_this select 0 - GROUP	- group to use
	_this select 1 - ARRAY - Position to use as center
	_this select 2 - NUMBER - Max Distance
	_this select 3 - NUMBER - How many extra waypoints to include (randomized)

	Returns:
	BOOLEAN 
*/

_grp = _this select 0;
_pos = _this select 1;
_maxDist = _this select 2;
_extraWP = _this select 3;

_grp setBehaviour "SAFE";

//Create a string of randomly placed waypoints.
private ["_prevPos"];
_prevPos = _pos;
for "_i" from 0 to (2 + (floor (random _extraWP))) do
{
	private ["_wp", "_newPos"];
	_newPos = [_prevPos, 50, _maxDist, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
	_prevPos = _newPos;

	_wp = _grp addWaypoint [_newPos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 20;

	//Set the group's speed and formation at the first waypoint.
	if (_i == 0) then
	{
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointFormation "STAG COLUMN";
	};
};

//Cycle back to the first position.
private ["_wp"];
_wp = _grp addWaypoint [_pos, 0];
_wp setWaypointType "CYCLE";
_wp setWaypointCompletionRadius 20;

true;
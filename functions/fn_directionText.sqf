/*
	File: fn_animation.sqf
	Author: austinXmedic

	Description:
	finds direction from number

	Parameter(s):
	_this select 0 -	FLOAT - Directional number
		

	Returns:
	STRING
*/

_direction = _this select 0;
if ((_direction > 22.5) && (_direction <= 67.5)) exitWith {"NORTHEAST"};
if ((_direction > 67.5) && (_direction <= 112.5)) exitWith {"EAST"};
if ((_direction > 112.5) && (_direction <= 157.5)) exitWith {"SOUTHEAST"};
if ((_direction > 157.5) && (_direction <= 202.5)) exitWith {"SOUTH"};
if ((_direction > 202.5) && (_direction <= 247.5)) exitWith {"SOUTHWEST"};
if ((_direction > 247.5) && (_direction <= 295.5)) exitWith {"WEST"};
if ((_direction > 295.5) && (_direction <= 337.5)) exitWith {"NORTHWEST"};
"NORTH"
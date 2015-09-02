
/*
	File: fn_animation.sqf
	Author: austinXmedic

	Description:
	plays anim's for all clients in MP

	Parameter(s):
	_this select 0 -	OBJECT	- Unit 
	_this select 1 - STRING - Animation
		

	Returns:
	Boolean
*/


_unit = _this select 0;
_anim = _this select 1;

_handled = false;

_unit switchMove "";

sleep 0.1;

_unit switchMove _anim;

_handled = true;

_handled;
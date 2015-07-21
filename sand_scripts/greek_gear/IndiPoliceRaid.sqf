if (!isServer) exitwith {};
_marker1=_this select 0;
_marker2=_this select 1;
_IndiGroup1= [getmarkerpos _marker1, resistance, ["I_Soldier_AAR_F","I_Soldier_AAR_F","I_Soldier_AAR_F"],[],[],[],[],[],0] call BIS_fnc_spawnGroup;
_IndiGroup2= [getmarkerpos _marker2, resistance, ["I_Soldier_AAR_F","I_Soldier_AAR_F","I_Soldier_AAR_F"],[],[],[],[],[],0] call BIS_fnc_spawnGroup;
{
[_x] spawn IndiGear;
}foreach units _IndiGroup1;
{
[_x] spawn IndiGear;
}foreach units _IndiGroup2;
Sleep 1;

_WP = _IndiGroup1 addWaypoint [getmarkerpos _marker1, 0]; _WP setWaypointType "HOLD"; _WP setWaypointSpeed "LIMITED"; _WP setWaypointBehaviour "SAFE";
_WP = _IndiGroup2 addWaypoint [getmarkerpos _marker2, 0]; _WP setWaypointType "HOLD"; _WP setWaypointSpeed "LIMITED"; _WP setWaypointBehaviour "SAFE";
Sleep 5;

_veh1 = createVehicle ["C_Offroad_01_F",getmarkerpos _marker1,[],0,"NONE"];
[
	_veh1,
	["blue",1],
	[
		"hidePolice", 0,
		"BeaconsStart", 1,
		"HideGlass2", 1,
		"Proxy", 0,
		"Destruct", 0
	]
] call BIS_fnc_initVehicle;

_veh2 = createVehicle ["C_Offroad_01_F",getmarkerpos _marker2,[],0,"NONE"];
[
	_veh2,
	["blue",1],
	[
		"hidePolice", 0,
		"BeaconsStart", 1,
		"HideGlass2", 1,
		"Proxy", 0,
		"Destruct", 0
	]
] call BIS_fnc_initVehicle;
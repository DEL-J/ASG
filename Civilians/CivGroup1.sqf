if (!isServer) exitwith {};
_marker=_this select 0;
_CivGroup= [getmarkerpos _marker, civilian, ["C_man_hunter_1_F", "C_man_1_3_F", "C_man_1_2_F", "C_man_1_1_F", "C_man_1"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{
[_x] spawn CivGear;
}foreach units _CivGroup;
_WP = _CivGroup addWaypoint [getmarkerpos _marker, 0]; _WP setWaypointType "DISMISSED"; _WP setWaypointSpeed "LIMITED"; _WP setWaypointBehaviour "SAFE";

Sleep 5;
_CivGroup= [getmarkerpos _marker, civilian, ["C_scientist_F", "C_Marshal_F", "C_man_w_worker_F", "C_man_shorts_4_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{
[_x] spawn CivGear;
}foreach units _CivGroup;
_WP = _CivGroup addWaypoint [getmarkerpos _marker, 0]; _WP setWaypointType "HOLD"; _WP setWaypointSpeed "LIMITED"; _WP setWaypointBehaviour "SAFE";
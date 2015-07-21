if (!isServer) exitwith {};
_marker=_this select 0;
_CivGroup= [getmarkerpos _marker, civilian, ["C_man_polo_5_F", "C_man_polo_4_F", "C_man_polo_3_F", "C_man_polo_2_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{
[_x] spawn CivGear;
}foreach units _CivGroup;
_WP = _CivGroup addWaypoint [getmarkerpos _marker, 0]; _WP setWaypointType "DISMISSED"; _WP setWaypointSpeed "LIMITED"; _WP setWaypointBehaviour "SAFE";

Sleep 5;
_marker=_this select 0;
_CivGroup= [getmarkerpos _marker, civilian, ["C_man_polo_1_F", "C_man_p_shorts_1_F","C_man_p_fugitive_F", "C_man_p_beggar_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{
[_x] spawn CivGear;
}foreach units _CivGroup;
_WP = _CivGroup addWaypoint [getmarkerpos _marker, 0]; _WP setWaypointType "HOLD"; _WP setWaypointSpeed "LIMITED"; _WP setWaypointBehaviour "SAFE";
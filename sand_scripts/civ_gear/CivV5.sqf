if (!isServer) exitwith {};
_marker=_this select 0;
_Civ1 = creategroup civilian;
_Civ2 = creategroup civilian;
_Civ3 = creategroup civilian;
_Veh1 = [getMarkerPos _marker, 0, "C_Van_01_transport_F", _Civ1] call BIS_fnc_spawnVehicle;
[_Civ1, getmarkerpos _marker, 3000] call BIS_fnc_taskPatrol;
Sleep 15;

_Veh2 = [getMarkerPos _marker, 0, "C_Van_01_box_F", _Civ2] call BIS_fnc_spawnVehicle;
[_Civ2, getmarkerpos _marker, 3000] call BIS_fnc_taskPatrol;
Sleep 15;

_Veh3 = [getMarkerPos _marker, 0, "C_Quadbike_01_F", _Civ3] call BIS_fnc_spawnVehicle;
[_Civ3, getmarkerpos _marker, 3000] call BIS_fnc_taskPatrol;
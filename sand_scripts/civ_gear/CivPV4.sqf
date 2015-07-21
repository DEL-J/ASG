if (!isServer) exitwith {};
_marker=_this select 0;
_veh = "C_Van_01_transport_F" createVehicle getMarkerPos _marker;
_veh = setvehiclelock  "LOCKED";
enablesentences false;
disableTIequipment true;
enableEngineArtillery false;
enableSaving [false,false];
[] execvm "sand_scripts\zlt_fieldrepair.sqf";
[] execvm "Greeks\IndiGear.sqf";
[] execvm "VCOMAI\init.sqf";
[] execvm "CallRadio.sqf";
[] execvm "ZeusGear.sqf";
[] execvm "Tags.sqf";

if (isServer) then {
	[] execVM "scripts\econ_init.sqf";
};
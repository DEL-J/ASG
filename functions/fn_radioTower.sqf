_unit = _this select 0;
_pos = [];
_pos = [getPos _unit,3000] call AUSMD_fnc_findLoc;

sleep 5;

_tower = "Land_TTowerBig_2_F" createVehicle _pos;

_tower setVectorUp (surfaceNormal position _tower)

for "_i" from 0 to 2 do
{
	_group = [enemySide,50,_pos] call AUSMD_fnc_createGroup;
	[_group,_pos,100,3] call AUSMD_fnc_Patrol;
};

for "_i" from 0 to 2 do
{
	_group = [enemySide,200,_pos] call AUSMD_fnc_createGroup;
	[_group,_pos,500,3] call AUSMD_fnc_Patrol;
};

_random = round(random 2000);

_tskName = format["tskRadioTower_%1",_random];

[_tskName,friendlySide,[format["Task ID %1 <br/><br/><br/> Destroy the radio tower to damage enemy communications in the area.",_random],"DESTROY"],(getPos _tower),"ASSIGNED",1,True,True] spawn BIS_fnc_setTask;

waitUntil{!alive _tower};

[_tskName,friendlySide,[format["Task ID %1 <br/><br/><br/> Destroy the radio tower to damage enemy communications in the area.",_random],"Destroy Radio Tower","DESTROY"],(getPos _tower),"SUCCEEDED",1,True,True] spawn BIS_fnc_setTask;

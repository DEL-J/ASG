_unit = _this select 0;
_pos = [];
_pos = [getPos _unit,3000] call AUSMD_fnc_findLoc;
sleep 5;

_objObjects = [_pos, random 360,[
	["Land_spp_Panel_F",[6.30176,-1.89258,-0.00174522],306.559,1,0,[-0.0881872,-0.0455055],"","",true,false], 
	["Land_Mil_WiredFenceD_F",[-3.89551,-3.59375,0],140.427,1,0,[0,-0],"","",true,false], 
	["Land_spp_Transformer_F",[-6.19531,1.90625,0],135.139,1,0,[0,-0],"","",true,false], 
	["Land_IndFnc_9_F",[-4.1123,2.92285,-0.000461578],225.208,1,0,[-3.15163e-007,0],"","",true,false], 
	["Land_dp_transformer_F",[-8.79492,-2.89258,0],316.246,1,0,[0,-0],"","",true,false], 
	["Land_dp_transformer_F",[-11.0947,-0.892578,0.000869751],135.227,1,0,[0,0],"","",true,false], 
	["Land_spp_Panel_F",[4.40527,-9.59375,-0.0031414],306.559,1,0,[0.0136599,0],"","",true,false], 
	["Land_spp_Panel_F",[15.7051,4.00586,0.0172749],306.559,1,0,[-0.154495,-0.152376],"","",true,false], 
	["Land_IndFnc_9_F",[-9.2041,5.60352,-0.00227928],137.751,1,0,[1.39072e-006,-0],"","",true,false], 
	["Land_Mil_WiredFenceD_F",[-9.69531,-8.29297,-5.14984e-005],140.427,1,0,[-0.0102182,0.107556],"","",true,false], 
	["Land_LampAirport_F",[-13.3955,-5.29297,-2.8106],360,1,0,[0,0],"","",true,false], 
	["Land_dp_transformer_F",[-13.8213,-4.83301,0.477623],316.246,1,0,[0.00234926,-0.108015],"","",true,false], 
	["Land_dp_transformer_F",[-14.4951,-3.89258,-2.09808e-005],135.227,1,0,[-0.000427967,0.108039],"","",true,false], 
	["Land_IndFnc_9_F",[-15.0938,0.208008,-0.0019722],137.751,1,0,[1.3657e-006,-0],"","",true,false], 
	["Land_spp_Panel_F",[-7.29785,-11.3945,0.0127659],306.559,1,0,[-0.0561398,-0.10687],"","",true,false], 
	["Land_Mil_WiredFence_F",[-14.8955,-10.793,-1.90735e-006],329.337,1,0,[2.8348e-006,0],"","",true,false], 
	["Land_dp_transformer_F",[-16.2949,-9.59375,0],316.246,1,0,[0,-0],"","",true,false], 
	["Land_dp_transformer_F",[-18.5947,-7.39258,0],135.227,1,0,[0,0],"","",true,false], 
	["Land_IndFnc_9_F",[-18.0664,-2.53223,0.00867081],137.751,1,0,[-0.00518302,0.107916],"","",true,false], 
	["Land_Mil_WiredFence_F",[-19.6953,-9.59375,0],50.3806,1,0,[0,0],"","",true,false], 
	["Land_spp_Panel_F",[-6.79492,-21.5938,-0.00121498],306.559,1,0,[0.00748762,0],"","",true,false]
]] call BIS_fnc_objectsMapper;


{_x setVectorUp (surfaceNormal position _x);} forEach _objObjects;


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

_taskObjectives = nearestObjects[_pos,["Land_dp_transformer_F"],30];

_task1 = _taskObjectives select 0;
_task2 = _taskObjectives select 1;
_task3 = _taskObjectives select 2;
_task4 = _taskObjectives select 3;
_task5 = _taskObjectives select 4;
_task6 = _taskObjectives select 5;

_random = round(random 2000);

_tskName = format["tskPowerStation_%1",_random];

[_tskName,friendlySide,[format["Task ID: %1 <br/><br/><br/>Destory all the transformers at the power station and shut it down.",_random],"Destory Power Station","DESTORY"],(getPos _task1),"ASSIGNED",1,True,True] spawn BIS_fnc_setTask;

waitUntil{!alive _task1 && !alive _task2 && !alive _task3 && !alive _task4 && !alive _task5 && !alive _task6};

[_tskName,friendlySide,[format["Task ID: %1 <br/><br/><br/>Destory all the transformers at the power station and shut it down.",_random],"Destory Power Station","DESTORY"],(getPos _task1),"SUCCEEDED",1,True,True] spawn BIS_fnc_setTask;
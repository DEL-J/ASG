_unit = _this select 0;
_pos = [];
_pos = [getPos _unit,3000] call AUSMD_fnc_findLoc;
sleep 5;
_objObjects = [_pos,random 360, [
	["Land_HBarrier_1_F",[-0.775391,5.05664,0.000789642],317.62,1,0,[-1.67977,0.0853194],"","",true,false], 
	["Land_HBarrier_1_F",[-1.70313,6.125,0.000675201],317.621,1,0,[-1.5106,-0.0691688],"","",true,false], 
	["Land_HBarrier_1_F",[-2.63477,7.08398,0.000675201],317.621,1,0,[-1.5106,-0.0691688],"","",true,false], 
	["Land_HBarrier_1_F",[-3.44238,8.19141,0.000528336],229.521,1,0,[-0.119224,1.50748],"","",true,false], 
	["Land_HBarrier_1_F",[-2.30078,9.26367,0.000486374],229.54,1,0,[0.634138,1.56727],"","",true,false], 
	["Land_ReservoirTank_V1_F",[10.2109,0.0078125,0.00324631],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_1_F",[-2.99316,10.4395,0.000425339],138.62,1,0,[1.55688,-0.659246],"","",true,false], 
	["Land_HBarrierTower_F",[3.13281,11.8379,-0.000169754],226.144,1,0,[-0.173882,0.590837],"","",true,false], 
	["Land_HBarrierBig_F",[7.43555,11.8516,-0.00044632],44.8464,1,0,[0.160456,-0.594623],"","",true,false], 
	["Land_HBarrierBig_F",[13.0176,6.59766,-5.72205e-006],44.8479,1,0,[-0.1089,-0.32383],"","",true,false], 
	["Land_HBarrierBig_F",[-15.7363,-0.0878906,0.00180054],314.544,1,0,[-0.97136,0.115769],"","",true,false], 
	["Land_HBarrierBig_F",[-2.22949,15.6191,0.000427246],314.541,1,0,[-0.381146,-0.375082],"","",true,false], 
	["Land_HBarrierBig_F",[-12.8252,-9.90625,-0.000616074],47.8922,1,0,[2.17548,0.813054],"","",true,false], 
	["Land_HBarrierBig_F",[2.7666,16.2598,-0.00025177],44.848,1,0,[-0.0020056,-0.756216],"","",true,false], 
	["Land_HBarrierBig_F",[-7.72949,-15.3926,-0.000682831],47.8922,1,0,[2.17548,0.813054],"","",true,false], 
	["Land_HBarrierBig_F",[-16.7197,-5.7832,-0.00107002],47.9164,1,0,[0.69682,-0.938019],"","",true,false], 
	["Land_HBarrierBig_F",[18.6582,1.07031,0.000801086],44.8495,1,0,[0.00226947,0.864234],"","",true,false], 
	["Land_ReservoirTank_V1_F",[17.71,-7.47656,0.00140572],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrierBig_F",[-2.04102,-21.2441,-0.000802994],47.8764,1,0,[1.06263,0.377912],"","",true,false], 
	["Land_HBarrierBig_F",[13.7676,-19.5273,-0.000204086],317.732,1,0,[0.210674,0.118226],"","",true,false], 
	["Land_HBarrierBig_F",[19.2441,-14.2168,-0.000423431],317.732,1,0,[0.226133,-0.205536],"","",true,false], 
	["Land_HBarrierBig_F",[24.4814,-4.24414,4.57764e-005],44.8478,1,0,[-0.0541531,-0.0538663],"","",true,false], 
	["Land_HBarrierBig_F",[24.3906,-9.02148,0.000114441],317.731,1,0,[-0.0565218,0.0513754],"","",true,false], 
	["Land_HBarrierBig_F",[2.95898,-26.4082,-0.000219345],47.8701,1,0,[0.113315,-0.102495],"","",true,false]
]] call BIS_fnc_objectsMapper;

{_x setVectorUp (surfaceNormal position _x);} forEach _objObjects;


for "_i" from 0 to 2 do
{
	_group = [enemySide,30,_pos] call AUSMD_fnc_createGroup;
	[_group,_pos,100,3] call AUSMD_fnc_Patrol;
};

for "_i" from 0 to 2 do
{
	_group = [enemySide,200,_pos] call AUSMD_fnc_createGroup;
	[_group,_pos,500,3] call AUSMD_fnc_Patrol;
};

_taskObjectives = nearestObjects[_pos,["Land_ReservoirTank_V1_F"],30];

_task1 = _taskObjectives select 0;
_task2 = _taskObjectives select 1;


_random = round(random 2000);

_tskName = format["tskFuelDepot_%1",_random];

[_tskName,friendlySide,[format["Task ID: %1<br/><br/><br/> Destory both the fuel reservoirs at the fuel depot.","Destroy Fuel Depot",_random],"DESTORY"],(getpos _task1),"ASSIGNED",1,True,True] spawn BIS_fnc_setTask;

waitUntil{!alive _task1 && !alive _task2};

[_tskName,friendlySide,[format["Task ID: %1<br/><br/><br/> Destory both the fuel reservoirs at the fuel depot.","Destroy Fuel Depot",_random],"DESTORY"],(getpos _task1),"SUCCEEDED",1,True,True] spawn BIS_fnc_setTask;
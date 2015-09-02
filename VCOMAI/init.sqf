//Define certain variables here
//Counting the # of bullets fired
FiredBulletCount = 0;
//Set Debug information below
VCOM_AIDEBUG = 0; //1 is on, 0 is off. Not recommended to have on for large # of AI. Will destroy any computer. (Spawn's infinite amount of markers to track AI).
MarkerName = 0; //Do not touch! Used to define a name for later use. DEBUG TOOL
MarkerArray = []; //Do not touch! Used to define an array for later use. DEBUG TOOL

//Compile important functions below.
call compile preProcessFile "VCOMAI\FSMFunctions\configFunctions.sqf"; 
FiredAtTarget = compile preprocessFile "VCOMAI\FSMFunctions\HitNear.sqf";
AIPath = compile preprocessFile "VCOMAI\FSMFunctions\Aiwaypoint.sqf";
VCOM_fnc_ClosestEnemy = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ClosestEnemy.sqf";
VCOM_fnc_Garrison = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_Garrison.sqf";
VCOM_fnc_LightGarrison = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_LightGarrison.sqf";
Vcom_fnc_VehicleHandle = compile preprocessFile "VCOMAI\FSMFunctions\Vcom_fnc_VehicleHandle.sqf";
VCOM_fnc_ClosestAllyWarn = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ClosestAllyWarn.sqf";
//VCOM_fnc_KnockDown = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_KnockDown.sqf";
VCOM_fnc_BlowBuilding = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_BlowBuilding.sqf";
VCOM_fnc_HasMine = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_HasMine.sqf";
VCOM_fnc_ReactToFireGrenade = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ReactToFireGrenade.sqf";
//VCOM_fnc_ReactToFireSuppressed = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ReactToFireSuppressed.sqf";
VCOM_fnc_classVehicle = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_classVehicle.sqf";
VCOM_fnc_MagClass = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_MagClass.sqf";
VCOM_fnc_ChangeFormation = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ChangeFormation.sqf";
VCOM_fnc_CheckBag = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_CheckBag.sqf";
VCOM_fnc_GuessDirection = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_GuessDirection.sqf";
VCOM_fnc_ReactToFire = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ReactToFire.sqf";
playMoveEverywhere = compileFinal "if((_this select 0) getVariable [""AUSMD_interact_surrendered"",false]) exitWith {}; _this select 0 playMoveNow (_this select 1);";
switchMoveEverywhere = compileFinal "if((_this select 0) getVariable [""AUSMD_interact_surrendered"",false]) exitWith {}; _this select 0 switchMove (_this select 1);";
Vcom_fnc_pack = compile preprocessFile "VCOMAI\FSMFunctions\Vcom_fnc_pack.sqf";
Vcom_fnc_unpack = compile preprocessFile "VCOMAI\FSMFunctions\Vcom_fnc_unpack.sqf";
//VCOM_fnc_HandledHeal = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_HandledHeal.sqf";
VCOM_EraseMarkers = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_Erasemarker.sqf";
//VCOM_DownedAI = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_DownedAI.sqf";
VCOM_fnc_Artillery = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_Artillery.sqf";
VCOM_fnc_ArtilleryCalled = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ArtilleryCalled.sqf";

//New Functions
VCOM_fnc_DetermineRank = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_DetermineRank.sqf";
VCOM_fnc_DetermineLeader = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_DetermineLeader.sqf";
VCOM_fnc_EvasiveAI = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_EvasiveAI.sqf";
VCOM_fnc_IsDriver = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_IsDriver.sqf";
VCOM_fnc_HitAI = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_HitAI.sqf";


//AI ACCURACY SETTINGS - You can change these numbers below
AccuracyFunctionRank6 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.3 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.3 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.7 + (random 0.3))];
_Unit setSkill ["spotTime",(0.7 + (random 0.3))];
_Unit setSkill ["courage",(0.3 + (random 0.3))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.3 + (random 0.3))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.6 + (random 0.3))];
};
AccuracyFunctionRank5 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.4 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.4 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.7 + (random 0.3))];
_Unit setSkill ["spotTime",(0.7 + (random 0.3))];
_Unit setSkill ["courage",(0.4 + (random 0.3))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.4 + (random 0.3))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.5 + (random 0.3))];
};
AccuracyFunctionRank4 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.5 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.5 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.7 + (random 0.3))];
_Unit setSkill ["spotTime",(0.7 + (random 0.3))];
_Unit setSkill ["courage",(0.5 + (random 0.3))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.5 + (random 0.3))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.4 + (random 0.3))];
};
AccuracyFunctionRank3 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.4 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.4 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.7 + (random 0.3))];
_Unit setSkill ["spotTime",(0.7 + (random 0.3))];
_Unit setSkill ["courage",(0.4 + (random 0.3))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.4 + (random 0.3))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.5 + (random 0.3))];
};

AccuracyFunctionRank2 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.5 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.5 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.7 + (random 0.3))];
_Unit setSkill ["spotTime",(0.7 + (random 0.3))];
_Unit setSkill ["courage",(0.5 + (random 0.3))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.5 + (random 0.3))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.4 + (random 0.3))];
};

AccuracyFunctionRank1 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.4 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.4 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.7 + (random 0.3))];
_Unit setSkill ["spotTime",(0.7 + (random 0.3))];
_Unit setSkill ["courage",(0.4 + (random 0.3))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.4 + (random 0.3))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.5 + (random 0.3))];
};

AccuracyFunctionRank0 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.3 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.3 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.7 + (random 0.3))];
_Unit setSkill ["spotTime",(0.7 + (random 0.3))];
_Unit setSkill ["courage",(0.3 + (random 0.3))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.3 + (random 0.3))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.6 + (random 0.3))];
};

//The distance AI squads will communicate to each other. This can be changed per unit and is not retroactive.
VCOM_AIWarnDistance = 500;

//AI using smoke. 1 is on.
VCOM_USESMOKE = 1;

//AI will use artillery freely
VCOM_Artillery = 1;

//Artillery unit array. This will automatically fill and empty in the game. Put units in here only if it is SUPER time sensitive.
ArtilleryArray = [];

//Below is loop to check for new AI spawning in to be added to the list

[] spawn 
{
	if (!(isDedicated)) then 
	{
		waitUntil {!isNil "BIS_fnc_init"};
		waitUntil {!(isnull (findDisplay 46))};
	};

while {true} do {

sleep 0.25;
{
if (local _x) then {
_CheckVariable = _x getVariable "FSMRunning";
if (isNil ("_CheckVariable")) then {_CheckVariable = 0;};
if (!(isplayer _x) && (_CheckVariable == 0)) then {
_x setVariable ["AUSMD_interact_tiedUp",false,true];
_x setVariable ["AUSMD_interact_arrested",false,true];
_x setVariable ["AUSMD_interact_beingInterrogated",false,true];
_x setVariable ["AUSMD_interact_gaveInfo",false,true];
_x setVariable ["AUSMD_interact_surrendered",false,true];
null = [_x] execFSM "AIBEHAVIORNEW.fsm";


};
if ((isPlayer _x)  && (_CheckVariable == 0)) then {
player setVariable ["VCOM_FiredTime", 0];
player setVariable ["PLAYERCOMMANDER", 1];
player addEventHandler ["Fired",{null = [_this] call FiredAtTarget;}];
player setVariable ["FSMRunning",1,true];
};
};
} forEach allUnits;
sleep 5;

sleep 1;
};
};
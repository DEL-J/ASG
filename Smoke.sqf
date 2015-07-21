PushupAction = player addAction ["Do Push Ups!",{
_target = _this select 0; _caller = _this select 1; _rank = rank _caller;
if ((_rank=="SERGEANT")&&(_caller distance cursortarget <5)&&(side _caller==side cursortarget))
then {cursorTarget playmove"AmovPercMstpSnonWnonDnon_exercisePushup"}
else {hint "not cool"};},"",1.5,true,true,"","(rank _this=='SERGEANT') && (side _this==side cursortarget)"];

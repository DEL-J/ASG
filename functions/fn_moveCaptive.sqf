scopeName "main";

_handled = false;

_unit = cursorTarget;

if(_unit getVariable "AUSMD_interact_moving") exitWith {diag_log "MOVE CAPTIVE :: Unit is already being moved.";};

_unit attachTo[player,[0,1,0]];

_unit setVariable ["AUSMD_interact_moving",true,true];
player setVariable ["AUSMD_interact_transporting",true,true];

diag_log "MOVE CAPTIVE :: Unit is attached.";

_unit enableAI "MOVE";

_stopMoveAct = _unit addAction ["Stop Moving Captive",{cursorTarget setVariable ["AUSMD_interact_moving",false,true];player setVariable ["AUSMD_interact_transporting",false,true];},nil,1,False,True,"",' player distance cursorTarget < 5 && alive cursorTarget && cursorTarget getVariable "AUSMD_interact_moving" && player getVariable "AUSMD_interact_transporting" '];

while{_unit getVariable "AUSMD_interact_moving"} do
{
	scopeName "loop";
	sleep 2;
	if(vehicle player != player) then
	{
		if(count crew (vehicle player) isEqualTo (getNumber (configFile >> "cfgVehicles" >> (typeOf(vehicle player)) >> 'transportSoldier'))) then
		{	
			diag_log "MOVE CAPTIVE :: Unit detached because vehicle was full";

			breakTo "main";
		}
		else
		{
			_veh = vehicle player;
			
			diag_log "MOVE CAPTIVE :: Unit detached and put into vehicle";
			
			player setVariable ["AUSMD_interact_transporting",false,true];
			
			sleep 0.1;
			
			detach _unit;
			
			sleep 0.1;
			
			_unit enableAI "ANIM";
			
			sleep 0.1;
			
			_unit moveinCargo _veh;
			
			waitUntil{vehicle player == player || !alive _unit || !alive _veh || !alive player};
			
			if(!alive _unit || !alive _veh) then
			{
				diag_log "MOVE CAPTIVE :: Unit detached because veh exploded or unit is dead";
				_unit setVariable ["AUSMD_interact_moving",false,true];
				breakTo "main";
			};
			
			if(vehicle player == player || !alive player) then
			{
				diag_log "MOVE CAPTIVE :: Unit ejected because player ejected";
				_unit action["Eject",vehicle _unit];
				_unit setVariable ["AUSMD_interact_moving",false,true];
				player setVariable ["AUSMD_interact_transporting",false,true];
				sleep 0.5;
				[[_unit,"AmovPercMstpSnonWnonDnon_Ease"],"AUSMD_fnc_animation",true,true] spawn BIS_fnc_MP;
				sleep 0.01;
				_unit disableAI "ANIM";
			};			
		};
		if(!alive player) then
		{
			diag_log "MOVE CAPTIVE :: Unit unmoved";
			_unit setVariable ["AUSMD_interact_moving",false,true];
			player setVariable ["AUSMD_interact_transporting",false,true];
			sleep 0.5;
			[[_unit,"AmovPercMstpSnonWnonDnon_Ease"],"AUSMD_fnc_animation",true,true] spawn BIS_fnc_MP;
			sleep 0.01;
			_unit disableAI "ANIM";
		};	
	};
};

_unit removeAction _stopMoveAct;

diag_log "MOVE CAPTIVE :: Unit detached, script done";

detach _unit;

_unit disableAI "MOVE";

_handled = true;

_handled;
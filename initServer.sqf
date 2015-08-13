// MDCCLXXVI BIS forums
addMissionEventHandler ['HandleDisconnect',{
        [(_this select 0)] spawn {
       
                _unit=_this select 0;
                _POS=getpos _unit;
                _Uni=uniformitems _unit;
                _vest=vestitems _unit;
                _back=backpackitems _unit;
                _Assigned=assignedItems _unit;
               
                _FullArray=_Uni + _vest + _back + _Assigned;
                sleep 1;
                deleteVehicle _unit;
                _holder = createVehicle ["groundweaponholder",_POS, [],0,"can_Collide"];
                {
                                if ( isClass (configFile >> "CFGweapons" >> _x)) then {
                                        //is weapon
                                        _holder addItemCargoGlobal [_x, 1];
                                }else{
                                        if ( isClass (configFile >> "CFGMagazines" >> _x)) then {
                                                //is magazine
                                                _holder addMagazineCargoGlobal [_x, 1];
                                        }else{
                                       
                                        };
                                };
                }foreach _FullArray;
        };
}];
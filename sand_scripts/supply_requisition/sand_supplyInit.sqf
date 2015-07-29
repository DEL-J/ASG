// GV_Sand_Balance, GV_Sand_ConnectedIDs

waitUntil {(!isNil "GV_Sand_Balance") && (!isNil "GV_Sand_ConnectedIDs")};

fnc_SetPitchBankYaw = { 
    private ["_object","_rotations","_aroundX","_aroundY","_aroundZ","_dirX","_dirY","_dirZ","_upX","_upY","_upZ","_dir","_up","_dirXTemp",
    "_upXTemp"];
    _object = _this select 0; 
    _rotations = _this select 1; 
    _aroundX = _rotations select 0; 
    _aroundY = _rotations select 1; 
    _aroundZ = (360 - (_rotations select 2)) - 360; 
    _dirX = 0; 
    _dirY = 1; 
    _dirZ = 0; 
    _upX = 0; 
    _upY = 0; 
    _upZ = 1; 
    if (_aroundX != 0) then { 
        _dirY = cos _aroundX; 
        _dirZ = sin _aroundX; 
        _upY = -sin _aroundX; 
        _upZ = cos _aroundX; 
    }; 
    if (_aroundY != 0) then { 
        _dirX = _dirZ * sin _aroundY; 
        _dirZ = _dirZ * cos _aroundY; 
        _upX = _upZ * sin _aroundY; 
        _upZ = _upZ * cos _aroundY; 
    }; 
    if (_aroundZ != 0) then { 
        _dirXTemp = _dirX; 
        _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ); 
        _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);        
        _upXTemp = _upX; 
        _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ); 
        _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ); 		
    }; 
    _dir = [_dirX,_dirY,_dirZ]; 
    _up = [_upX,_upY,_upZ]; 
    _object setVectorDirAndUp [_dir,_up]; 
};

sand_fnc_sup_smallCrate = {
	_crateClass = _this;
	
};

sand_fnc_sup_largeCrate = {
	private ["_crateClass","_trawler","_driver","_condition"];
	//spawn the carrier for the crate
	_trawler = createVehicle ["C_Boat_Civil_04_F",(getMarkerPos "mrk_supply_spawn"), [], 0, "NONE"];
	_engine = createVehicle ["C_Boat_Civil_01_F",(getMarkerPos "mrk_supply_spawn"), [], 0, "NONE"];
	_engine allowDamage false;
	_engine setDir -160;
	_driver = createAgent ["C_man_1", (getMarkerPos "mrk_supply_spawn"), [], 0, "NONE"];
	_driver disableAI "FSM";
	_driver setBehaviour "CARELESS";
	
	_trawler attachTo [_engine, [0,0,3.1]];
	_driver moveInDriver _engine;
	
	_driver moveTo (getMarkerPos "mrk_supply_pickup");
	
	//carrier spawned, now spawn the crate
	_crate = createVehicle ["Box_East_AmmoVeh_F", [0,0,0], [], 0, "NONE"];
	_crate allowDamage false;
	
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	_gear = [["arifle_MX_ACO_F", 20], ["30Rnd_65x39_caseless_mag", 500], ["30Rnd_65x39_caseless_mag_Tracer", 250]];
	{
		_isWep = isClass (configFile >> "CfgWeapons" >> (_x select 0));
		if (_isWep) then {
			_crate addWeaponCargoGlobal [(_x select 0), (_x select 1)];
			diag_log format["_crate addWeaponCargoGlobal [%1, %2];", (_x select 0), (_x select 1)];
		} else {
			_crate addMagazineCargoGlobal [(_x select 0), (_x select 1)];
			diag_log format["_crate addMagazineCargoGlobal [%1, %2];", (_x select 0), (_x select 1)];
		};
	} forEach _gear;
	
	
	_condition = false;
	while {!_condition} do {
		_pitch = 0 - ((_engine call BIS_fnc_getPitchBank) select 0);
		_bank = 0 -  (((_engine call BIS_fnc_getPitchBank) select 1) * (3 / 4)); //((_engine call BIS_fnc_getPitchBank) select 1) / 4;
		_yaw = 0;
		[_trawler, [_pitch, _bank, _yaw]] call fnc_SetPitchBankYaw;
		sleep 0.01;
	};
};

sand_fnc_sup_smallVictor = {
	_vehClass = _this;
	
};

sand_fnc_sup_largeVictor = {
	_vehClass = _this;
	
};
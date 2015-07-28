// GV_Sand_Balance, GV_Sand_ConnectedIDs

waitUntil {(!isNil "GV_Sand_Balance") && (!isNil "GV_Sand_ConnectedIDs")};

sand_fnc_sup_smallCrate = {
	_crateClass = _this;
	
};

sand_fnc_sup_largeCrate = {
	private ["_crateClass","_trawler","_driver","_condition"];
	_crateClass = _this;
	//spawn the carrier for the crate
	_trawler = createVehicle ["C_Boat_Civil_04_F",(getMarkerPos "mrk_supply_spawn"), [], 0, "NONE"];
	_engine = createVehicle ["C_Boat_Civil_01_F",(getMarkerPos "mrk_supply_spawn"), [], 0, "NONE"];
	_engine allowDamage false;
	_driver = createAgent ["C_man_1", (getMarkerPos "mrk_supply_spawn"), [], 0, "NONE"];
	_driver disableAI "FSM";
	_driver setBehaviour "CARELESS";
	
	_trawler attachTo [_engine, [0,0,3]];
	_driver moveInDriver _engine;
	
	_driver moveTo (getMarkerPos "mrk_supply_pickup");
	
	//carrier spawned, now spawn the crate
	
	_condition = false;
	while {!_condition} do {
		_trawler setVectorUp [0, 0 - ((vectorUp _engine) select 1), 1];
		sleep 0.05;
	};
};

sand_fnc_sup_smallVictor = {
	_vehClass = _this;
	
};

sand_fnc_sup_largeVictor = {
	_vehClass = _this;
	
};


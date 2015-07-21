// var stores the current entire sidebalance for the players
GV_Sand_Balance = sand_param_startingBalance;
publicVariable "GV_Sand_Balance";

// var stores all IDs of players who have connected during the mission progress
GV_Sand_ConnectedIDs = [];
publicVariable "GV_Sand_ConnectedIDs";

[] spawn {
	while {true} do {
		_timeStart = time;
		waitUntil {time = _timeStart + 86400};
		GV_Sand_ConnectedIDs = [];
		publicVariable "GV_Sand_ConnectedIDs";
	};
};

_wait = true;

_wait
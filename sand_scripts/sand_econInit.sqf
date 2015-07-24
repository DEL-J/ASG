// var stores the current entire sidebalance for the players
GV_Sand_Balance = sand_param_startingBalance;

// var stores all IDs of players who have connected during the mission progress
GV_Sand_ConnectedIDs = [];

[] spawn {
	private ["_timeStart"];
	while {true} do {
		_timeStart = time;
		waitUntil {time > (_timeStart + 86400)};
		GV_Sand_ConnectedIDs = [];
	};
};

_wait = true;

_wait
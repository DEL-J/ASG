call compile preprocessFileLineNumbers "sand_scripts\sand_radioPreInit.sqf"; //Runs 'sand_scripts\sand_radioPreInit.sqf' so that all is ready

channelSetup = { //Function to determine channel to be added to and add player to it
    _channels = [];
    { if (toUpper str player in _x) then {_channels pushBack _forEachIndex} } forEach CHANNEL_DATA; //Get channel name for the player from 'CHANNELS' based off of 'CHANNEL_DATA'
    { [true,CHANNELS select _x,[player]] call RADIO } count _channels; //If player has a channel to be added to, add them to it, otehr wise add to the "Rogue Channel?!?" channel
};

CHANNELS = [ //Your channel names
    "Platoon 1",
    "Platoon 2",
    "Platoon 3",
    "Company Radio Net",
    "Headquarters"
];

CHANNEL_DATA = [ //MUST ALL BE UPPER CASE!
    ["A11","A12","A13","PL1","PS1","RO1","CM1"], //Members of 'Channel 1'
    ["A21","A22","A23","PL2","PS2","RO2","CM2"], //Members of 'Channel 2'
    ["A31","A32","A33","PL3","PS3","RO3","CM3"], //Members of 'Channel 3'
    ["RO6","RO1","RO2","RO3","HP1","HP2","HP3","WSL","ASL"], //Members of 'Channel 4'
    ["HQ6","HQ5","HQ4","OPS","RO6","CM6","HP1","HP2","HP3","WSL","ASL"] //Members of 'Channel 5'
];

if isServer then { //Only do this if we are a server
    { [_x,true,[]] call RADIO } forEach CHANNELS //Create all the channels from 'CHANNELS' array ready for players to be added to
};

if hasInterface then { //If not a dedicated server, do this
    call channelSetup; //Run the 'channelSetup' function to add player to the appopriate channel
    player addEventHandler ["Respawn",{call channelSetup}]; //Add a event handler that runs 'channelSetup' function when player respawns
};
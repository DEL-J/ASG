CHANNELS = [ //Your channel names and colours
    ["Platoon 1",[1,0,0,1]],
    ["Platoon 2",[0,1,0,1]],
    ["Platoon 3",[0,0,1,1]],
    ["Company Radio Net",[1,1,0,1]],
    ["Headquarters",[1,1,0,1]]
];

CHANNEL_DATA = [ //MUST ALL BE UPPER CASE!
    ["A11","A12","A13","PL1","PS1","RO1","CM1"], //Members of 'Channel 1'
    ["A21","A22","A23","PL2","PS2","RO2","CM2"], //Members of 'Channel 2'
    ["A31","A32","A33","PL3","PS3","RO3","CM3"], //Members of 'Channel 3'
    ["RO6","RO1","RO2","RO3","HP1","HP2","HP3","WSL","ASL"], //Members of 'Channel 4'
    ["RCO","RXO","ROS","RSM","BCO","BXO","BPO","BLO","BOS","BFS","HQ6","HQ5","HQ4","OPS","RO6","CM6","HP1","HP2","HP3","WSL","ASL"] //Members of 'Channel 5'
];

if (hasInterface && !isServer) then { //if not the server and is a client that is playing i.e not headless
    RADIO = { //define function that will simply send any parameters to the server
        PV__RADIO = _this;
        publicVariableServer "PV__RADIO"; //send passed values to the server, whis will trigger publicvariable event for PV__RADIO on server
    };
};

channelSetup = { //Function to determine channel to be added to and add player to it
    private ["_channels","_channel"];
    _channels = [];
    { 
        if (toUpper str player in _x) then { //see if the players unit name (set in editor) is in the current channel_data array
            _channel = CHANNELS select _forEachIndex select 0;
            _channels pushBack _channel;
            [true,_channel,[player]] call RADIO //if it is add the player to the channel (see RADIO function comments)
        }
    } forEach CHANNEL_DATA; //go through each of the CHANNEL_DATA elements (look at these commands on the wiki)
    _channels
};

if isServer then { //Only do this if we are a server
    RADIO = {
        if (typeName (_this select 0) == "BOOL") then [{ //if the first element in the passed array is boolean, do this stuff... (all to do with adding/removing from EXISTING channels)
            _chan = if (typeName (_this select 1) != "STRING") then [{str (_this select 1)},{_this select 1}]; //the channel name passed to the function with some validation...
            _id = missionNamespace getVariable ["#RADIO#"+_chan,nil]; //get the actual channel ID from the variable created earlier
            if (isNil '_id') exitWith {diag_log format["RADIO: Invalid channel name: '%1'",_chan]}; //if no ID retrieved (some error?) exit the script with error in .rpt
            _units = [_this, 2, [], [[]]] call BIS_fnc_param; //get the units to add to the channel (lookup BIS_fnc_param on the wiki)
            if (_units isEqualTo []) exitWith {diag_log format["RADIO: No units to be added/removed from '%1'",_chan]}; //if no units were sent to be added exit with error

            if (_this select 0) then [{ //if the first element in the passed array is true
                diag_log format["RADIO: Added %1 to %2(%3)",_units,_chan,_id];
                _id radioChannelAdd _units //add new units to the channel
            },{
                diag_log format["RADIO: Removed %1 from %2(%3)",_units,_chan,_id];
                _id radioChannelRemove _units //if false, remove units
            }];
        },{
            _chan = if (typeName (_this select 0) != "STRING") then [{str (_this select 0)},{_this select 0}]; //the channel name passed to the function with some validation...
            _add = [_this, 1, true, [true]] call BIS_fnc_param; //if second element in array is true, creating channel. If false, removing/emptying
            _units = [_this, 2, [], [[]]] call BIS_fnc_param;  //get the units to add to the channel once it is created
            _chanVar = "#RADIO#"+_chan; //The variable name used for storing the actual channel ID simply #RADIO# plus the channel name itself
            _id = missionNamespace getVariable [_chanVar,0]; //check if the variable already exists, if not _id == 0
            if (_add && {_id != 0}) exitWith { //if we're adding a channel and the ID is not equal to 0, then channel exists already
                diag_log format["RADIO: Channel '%1' already exists",_chan] //error to .rpt
            };
            if _add then [{ //if we're adding a channel, do this stuff...
                _callsign = [_this, 4, "%UNIT_NAME", [""]] call BIS_fnc_param;
                _id = radioChannelCreate [ //create radio channel based off of following parameters, _id is set to new channel ID from radioChannelCreate command (lookup on wiki)
                    ([_this, 3, [random 1,random 1,random 1,1], [[]], [4]] call BIS_fnc_param), //1st param - colour - use passed colour, if not passed/invalid use random colour
                    _chan, //2nd param - name - from _chan stored earlier as passed to fucntion
                    //3rd param - callsign - below I was not 100% sure of its use and in the end assumed it had to do with what is shown as the "sender" of a message/voice comm
                    //The line below ensures it is a compatible type passed (from https://community.bistudio.com/wiki/radioChannelSetCallSign) if not default to %UNIT_NAME
                    (if !(_callsign in ["%CHANNEL_LABEL","%UNIT_SIDE","%UNIT_NAME","%UNIT_RANK","%UNIT_ID","%UNIT_REF","%UNIT_GRP_NAME","%UNIT_GRP_LEADER","%UNIT_VEH_NAME","%UNIT_VEH_POSITION"]) then [{"%UNIT_NAME"},{_callsign}]),
                    _units //4th param - units to add - from _units array as passed to funcction
                ];
                diag_log format["RADIO: Created channel %1 with id %2%3",_chan,_id,(if (_units isEqualTo []) then [{""},{format[" and added %1",_units]}])];
            },{
                _id radioChannelRemove allUnits; //if we're not adding a channel, I guess we're removing it. Remove allUnits from the channel
            }];
            if (_id == 0) exitWith { //if _id == 0 then we must be at the max supported of 10 (https://community.bistudio.com/wiki/radioChannelCreate) EXIT
                diag_log format["RADIO: More than 10 channels created, could not create channel: '%1'",_chan]; //error to .rpt
            };
            missionNamespace setVariable [_chanVar,_id]; //set the variable to the channel ID. Variable name is #RADION#+ channel name
        }];
    };
    "PV__RADIO" addPublicVariableEventHandler { //Whenever PV__RADIO is publicvariabled the below is run on the server
        (_this select 1) call RADIO; //the publicvariabled value of PV__RADIO is passed to RADIO function on server
    };
    { [_x select 0,true,[],_x select 1] call RADIO } forEach CHANNELS; //Create all the channels from 'CHANNELS' array ready for players to be added to
};

if hasInterface then { //If not a dedicated server, do this
    waitUntil {!isNull player};
    uiSleep 1;
    hintSilent format["Channels: %1",call channelSetup]; //Run the 'channelSetup' function to add player to the appopriate channel
    player addEventHandler ["Respawn",{call channelSetup}]; //Add a event handler that runs 'channelSetup' function when player respawns as the game removes a unit automatically when it dies
};
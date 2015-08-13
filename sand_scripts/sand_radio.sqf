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
    ["HQ6","HQ5","HQ4","OPS","RO6","CM6","HP1","HP2","HP3","WSL","ASL"] //Members of 'Channel 5'
];

if (hasInterface && !isServer) then {
    RADIO = {
        PV__RADIO = _this;
        publicVariableServer "PV__RADIO";
    };
};

channelSetup = { //Function to determine channel to be added to and add player to it
    _channels = [];
    { if (toUpper str player in _x) then {_channels pushBack _forEachIndex} } forEach CHANNEL_DATA; //Get channel name for the player from 'CHANNELS' based off of 'CHANNEL_DATA'
    { [true,CHANNELS select _x select 0,[player]] call RADIO } count _channels; //If player has a channel to be added to, add them to it, otehr wise add to the "Rogue Channel?!?" channel
};

if isServer then { //Only do this if we are a server
    CHANNEL_BACKUPS = [
        ["A11A", "A12A", "A13A", "A11B", "A12B", "A13B"],
        ["A21A", "A22A", "A23A", "A21B", "A22B", "A23B"],
        ["A31A", "A32A", "A33A", "A31B", "A32B", "A33B"],
        ["PS1", "PS2", "PS3", "PL1", "PL2", "PL3", "CM1", "CM2", "CM3"],
        ["PS1", "PS2", "PS3", "PL1", "PL2", "PL3", "CM1", "CM2", "CM3"]
    ];
    RADIO = {
        if (typeName (_this select 0) == "BOOL") then [{
            _chan = if (typeName (_this select 1) != "STRING") then [{str (_this select 1)},{_this select 1}];
            _id = missionNamespace getVariable ["#RADIO#"+_chan,nil];
            if (isNil '_id') exitWith {diag_log format["RADIO: Invalid channel name: '%1'",_chan]};
            _units = [_this, 2, [], [[]]] call BIS_fnc_param;
            if (_units isEqualTo []) exitWith {diag_log format["RADIO: No units to be added/removed from '%1'",_chan]};

            if (_this select 0) then [{
                _id radioChannelAdd _units
            },{
                _id radioChannelRemove _units
            }];
        },{
            _chan = if (typeName (_this select 0) != "STRING") then [{str (_this select 0)},{_this select 0}];
            _add = [_this, 1, true, [true]] call BIS_fnc_param;
            _units = [_this, 2, [], [[]]] call BIS_fnc_param;
            _chanVar = "#RADIO#"+_chan;
            _id = missionNamespace getVariable [_chanVar,0];
            if (_add && {_id != 0}) exitWith {
                diag_log format["RADIO: Channel '%1' already exists",_chan]
            };
            if _add then [{
                _callsign = [_this, 4, "%UNIT_NAME", [""]] call BIS_fnc_param;
                _id = radioChannelCreate [
                    ([_this, 3, [random 1,random 1,random 1,1], [[]], [4]] call BIS_fnc_param),
                    _chan,
                    (if !(_callsign in ["%CHANNEL_LABEL","%UNIT_SIDE","%UNIT_NAME","%UNIT_RANK","%UNIT_ID","%UNIT_REF","%UNIT_GRP_NAME","%UNIT_GRP_LEADER","%UNIT_VEH_NAME","%UNIT_VEH_POSITION"]) then [{"%UNIT_NAME"},{_callsign}]),
                    _units
                ]
            },{
                _id radioChannelRemove allUnits;
            }];
            if (_id == 0) exitWith {
                diag_log format["RADIO: More than 10 channels created, could not create channel: '%1'",_chan];
            };
            missionNamespace setVariable [_chanVar,_id];
        }];
    };
    "PV__RADIO" addPublicVariableEventHandler {
        (_this select 1) call RADIO;
    };
    addMissionEventHandler ["HandleDisconnect",{
        _unit = _this select 0;
        _channels = [];
        _backupFound = false;
        { if (toUpper str _unit in _x) then {_channels pushBack _forEachIndex} } forEach CHANNEL_DATA;
        if !(_channels isEqualTo []) then {
            {
                _backups = CHANNEL_BACKUPS select _x;
                _channel = CHANNELS select _x select 0;
                {
                    _x = missionNamespace getVariable [_x,objNull];
                    if (isPlayer _x) exitWith {
                        _backupFound = true;
                        [true,_channel,[_x]] call RADIO;
                        [format["[RADIO] %1 was added to %2 to replace %3",name _x,_channel,_this select 3],"systemChat",true] call BIS_fnc_MP;
                    };
                } forEach _backups
            } forEach _channels;
            if !_backupFound then {
                [format["[RADIO] No backup to replace %1 who disconnected from %2",_this select 3,_channel],"systemChat",true] call BIS_fnc_MP;
            };
        };
        false
    }];
    { [_x select 0,true,[],_x select 1] call RADIO } forEach CHANNELS; //Create all the channels from 'CHANNELS' array ready for players to be added to
};

if hasInterface then { //If not a dedicated server, do this
    call channelSetup; //Run the 'channelSetup' function to add player to the appopriate channel
    player addEventHandler ["Respawn",{call channelSetup}]; //Add a event handler that runs 'channelSetup' function when player respawns
};
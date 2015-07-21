if isServer then {
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
};
 
if (hasInterface && !isServer) then {
RADIO = {
PV__RADIO = _this;
publicVariableServer "PV__RADIO";
};
}; 
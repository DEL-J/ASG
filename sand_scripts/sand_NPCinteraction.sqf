//AUSMD Interaction
//change bis_curatorUnit to what your zeus controller is named (a physical unit or the name of the virtual zeus entity)
//ONLY run on a single client otherwise it may cause unwanted behaviour
//also change bis_curator to what the curator module is called

if(getPlayerUID player isEqualTo 76561198031485127) then
{
	ZeusUnit = player;
};
if(player == ZeusUnit) then
{
	[Zeus2] execVM "AUSMD_init.sqf";
};
enemySide = east; //change this to west if you want nato as hostiles.
friendlySide = west; //opposite of the above (this side will receive side objective tasks from captives)

AUSMD_holstileSayings = ["I will only tell you my name, rank, and serial number.","I won't tell you fuck all you scumbag."];

player createDiaryRecord ["Diary",["AUSMD Unit Interaction","This system allows you to interact with hostile units that surrender, and also with civilians. You can ask them information about possible hostile units nearby, or ask about the nearest town. 
<br/><br/>
Once an enemy has surrendered he will put his hands up and throw away his guns, and you can then walk up to him and tie him up. Once this is done you can then either move him or question him. If moving him and you get into a vehicle, he will be placed in the vehicle as well (if there is space availiable).
<br/><br/>
You will need to get creative about getting hostile captives to talk, they won't just give up information willingly without a good reason."]];
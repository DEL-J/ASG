//Global Function to edit unit gear. Only does when the function is run with "spawn", "call"
IndiGear={
_unit = _this select 0;
_type = typeof _unit;
               
//edit gear
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit forceAddUniform "U_I_CombatUniform";
_unit addItemToUniform "FirstAidKit";
_unit addVest "V_PlateCarrierIA1_dgtl";
_unit addHeadgear "H_HelmetIA";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
   
//Switch type
switch (_type) do {
 
//Basic
default {
for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
_unit addWeapon "arifle_MX_Black_F";
_unit addPrimaryWeaponItem "optic_Aco";
_unit setunitrank "PRIVATE";};

//Police
case "I_Soldier_AAR_F" :{
_unit forceAddUniform "U_B_CTRG_2";
_unit addVest "V_TacVest_blk_POLICE";
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
_unit addHeadgear "H_Cap_police";
_unit addWeapon "arifle_Katiba_C_F";
_unit addPrimaryWeaponItem "optic_Aco";
_unit setunitrank "PRIVATE";};
};
};
//Global Function to edit unit gear. Only does when the function is run with "spawn", "call"
CivGear={
_unit=_this select 0;
_type=typeof _unit;
               
//edit gear
removeuniform _unit;
removeallweapons _unit;
   
//Switch type
switch (_type) do {
 
//Basic
default {
};

//Start
case "C_man_1" :{
_unit forceAddUniform "U_BG_Guerilla2_1"};

case "C_man_1_1_F" :{
_unit forceAddUniform "U_BG_Guerilla2_2"};

case "C_man_1_2_F" :{
_unit forceAddUniform "U_BG_Guerilla2_3"};

case "C_man_1_3_F" :{
_unit forceAddUniform "U_BG_Guerilla3_1"};

case "C_man_hunter_1_F" :{
_unit forceAddUniform "U_C_HunterBody_grn"};

case "C_man_p_beggar_F" :{
_unit forceAddUniform "U_C_Journalist"};

case "C_man_p_fugitive_F" :{
_unit forceAddUniform "U_C_Poloshirt_blue"};

case "C_man_p_shorts_1_F" :{
_unit forceAddUniform "U_C_Poloshirt_burgundy"};

case "C_man_polo_1_F" :{
_unit forceAddUniform "U_C_Poloshirt_redwhite"};

case "C_man_polo_2_F" :{
_unit forceAddUniform "U_C_Poloshirt_salmon"};

case "C_man_polo_3_F" :{
_unit forceAddUniform "U_C_Poloshirt_stripped"};

case "C_man_polo_4_F" :{
_unit forceAddUniform "U_C_Poloshirt_tricolour"};

case "C_man_polo_5_F" :{
_unit forceAddUniform "U_C_Poor_1"};

case "C_man_polo_6_F" :{
_unit forceAddUniform "U_C_WorkerCoveralls"};

case "C_man_shorts_1_F" :{
_unit forceAddUniform "U_Competitor"};

case "C_man_shorts_2_F" :{
_unit forceAddUniform "U_I_G_resistanceLeader_F"};

case "C_man_shorts_3_F" :{
_unit forceAddUniform "U_Marshal"};

case "C_man_shorts_4_F" :{
_unit forceAddUniform "U_NikosAgedBody"};

case "C_man_w_worker_F" :{
_unit forceAddUniform "U_NikosBody"};

case "C_Marshal_F" :{
_unit forceAddUniform "U_OrestesBody"};

case "C_scientist_F" :{
_unit forceAddUniform "U_Rangemaster"};
};
};
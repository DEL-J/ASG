Fnc_AdjustUnitGear={
private ["_unit", "_type", "_side"];
_unit=_this select 0;

_type=typeof _unit;
_side=side _unit;

switch (_side) do {

	case WEST: {
	
	switch (_type) do {
			//Friendly Police
			case "B_G_Soldier_lite_F" :{
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeUniform _unit;
			removeVest _unit;
			removeBackpack _unit;
			removeHeadgear _unit;
			removeGoggles _unit;
			_unit forceAddUniform "U_I_HeliPilotCoveralls";
			_unit addVest "V_TacVest_blk_POLICE";
			for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addHeadgear "H_Cap_police";
			_unit addWeapon "arifle_MXC_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit setunitrank "PRIVATE";};
	};//end type switch
	};//end WEST
	
	
		case EAST: {
		//edit gear
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		_unit forceAddUniform "U_O_OfficerUniform_ocamo";
		_unit addVest "V_PlateCarrier1_blk";
		_unit addHeadgear "H_HelmetB_light_black";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		switch (_type) do {
		//Basic
		default {
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "SmokeShell";
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "PRIVATE";};

		//Officer
		case "O_Soldier_O_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "SmokeShell";
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "LIEUTENANT";};

		//Squad Leader
		case "O_Soldier_SL_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Arco";
		_unit setunitrank "SERGEANT";};

		//Team Leader
		case "O_Soldier_TL_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "SmokeShell";
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "CORPORAL";};

		//Rifleman
		case "O_Soldier_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "SmokeShell";
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "PRIVATE";};

		//Grenadier
		case "O_Soldier_GL_F" :{
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "3Rnd_HE_Grenade_shell";
		_unit addWeapon "arifle_MX_GL_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "PRIVATE";};

		//Autorifleman
		case "O_Soldier_AR_F" :{
		for "_i" from 1 to 2 do {_unit addItemToVest "200Rnd_65x39_cased_Box_Tracer";};
		_unit addWeapon "LMG_Mk200_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "PRIVATE";};

		//AT Rifleman
		case "O_Soldier_LAT_F" :{
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addBackpack "B_AssaultPack_ocamo";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "RPG32_F";};
		_unit addItemToBackpack "RPG32_HE_F";
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit addWeapon "launch_RPG32_F";
		_unit setunitrank "PRIVATE";};

		//AA Rifleman
		case "O_Soldier_AA_F" :{
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit addWeapon "launch_O_Titan_F";
		_unit setunitrank "PRIVATE";};

		//Light Machine Gunner
		case "O_HeavyGunner_F" :{
		for "_i" from 1 to 2 do {_unit addItemToVest "150Rnd_93x64_Mag";};
		_unit addWeapon "MMG_01_tan_F";
		_unit addPrimaryWeaponItem "bipod_02_F_tan";
		_unit addPrimaryWeaponItem "optic_Arco";
		_unit setunitrank "PRIVATE";};

		//Heavy Machine Gunner
		case "O_support_MG_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addBackpack "O_HMG_01_weapon_F";
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "PRIVATE";};

		//Grenade Machine Gunner
		case "O_support_GMG_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addBackpack "O_GMG_01_weapon_F";
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "PRIVATE";};

		//Assistant Machine Gunner
		case "O_support_AMG_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addBackpack "O_HMG_01_support_F";
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "PRIVATE";};

		//Mortar Gunner
		case "O_support_Mort_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addBackpack "O_Mortar_01_weapon_F";
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "PRIVATE";};

		//Mortar Assistant
		case "O_support_AMort_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addBackpack "O_Mortar_01_support_F";
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "PRIVATE";};

		//Recon Team Leader
		case "O_recon_TL_F" :{
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
		for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "O_IR_Grenade";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit addWeapon "Rangefinder";
		_unit linkItem "NVGoggles_OPFOR";
		_unit setunitrank "SERGEANT";};

		//Recon Marksman
		case "O_recon_M_F" :{
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
		for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "O_IR_Grenade";};
		_unit addWeapon "arifle_MXM_F";
		_unit addPrimaryWeaponItem "optic_Arco";
		_unit linkItem "NVGoggles_OPFOR";
		_unit setunitrank "CORPORAL";};

		//Recon Scout
		case "O_recon_F" :{
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
		for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "O_IR_Grenade";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit addWeapon "Binocular";
		_unit linkItem "NVGoggles_OPFOR";
		_unit setunitrank "CORPORAL";};

		//Recon Scout AT
		case "O_recon_LAT_F" :{
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
		for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "O_IR_Grenade";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit addWeapon "Binocular";
		_unit linkItem "NVGoggles_OPFOR";
		_unit addBackpack "B_AssaultPack_ocamo";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "RPG32_F";};
		_unit addWeapon "launch_RPG32_F";
		_unit setunitrank "CORPORAL";};

		//Recon JTAC
		case "O_recon_JTAC_F" :{
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
		for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "O_IR_Grenade";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit addWeapon "Laserdesignator";
		_unit linkItem "NVGoggles_OPFOR";
		_unit setunitrank "CORPORAL";};

		//Recon Medic
		case "O_recon_medic_F" :{
		_unit addBackpack "B_AssaultPack_blk";
		_unit addItemToBackpack "Medikit";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "FirstAidKit";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
		for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "O_IR_Grenade";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit addWeapon "Binocular";
		_unit linkItem "NVGoggles_OPFOR";
		_unit setunitrank "CORPORAL";};

		//Recon Demolition Specialist
		case "O_recon_exp_F" :{
		_unit addBackpack "B_AssaultPack_blk";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
		for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
		for "_i" from 1 to 2 do {_unit addItemToVest "O_IR_Grenade";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit addWeapon "Binocular";
		_unit linkItem "NVGoggles_OPFOR";
		_unit setunitrank "CORPORAL";};

		//Combat Medic
		case "O_medic_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addBackpack "B_AssaultPack_blk";
		_unit addItemToBackpack "Medikit";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "FirstAidKit";};
		_unit addWeapon "arifle_MXM_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "CORPORAL";};

		//Demolition Specialist
		case "O_soldier_exp_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addBackpack "B_AssaultPack_blk";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		_unit addWeapon "arifle_MXM_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit setunitrank "CORPORAL";};

		//Engineer
		case "O_engineer_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit addBackpack "B_AssaultPack_blk";
		_unit addItemToBackpack "ToolKit";
		_unit addItemToBackpack "MineDetector";
		_unit setunitrank "CORPORAL";};

		//UAV Operator
		case "O_soldier_UAV_F" :{
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Holosight";
		_unit addBackpack "O_UAV_01_backpack_F";
		_unit linkItem "O_UavTerminal";
		_unit setunitrank "CORPORAL";};

		//Sniper
		case "O_sniper_F" :{
		_unit forceAddUniform "U_O_GhillieSuit";
		for "_i" from 1 to 3 do {_unit addItemToUniform "11Rnd_45ACP_Mag";};
		for "_i" from 1 to 8 do {_unit addItemToVest "10Rnd_93x64_DMR_05_Mag";};
		_unit addWeapon "srifle_DMR_05_tan_f";
		_unit addPrimaryWeaponItem "optic_LRPS";
		_unit addPrimaryWeaponItem "bipod_02_F_tan";		
		_unit addWeapon "hgun_Pistol_heavy_01_F";
		_unit setunitrank "PRIVATE";};

		//Spotter
		case "O_spotter_F" :{
		_unit forceAddUniform "U_O_GhillieSuit";
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		_unit addWeapon "arifle_MX_F";
		_unit addPrimaryWeaponItem "optic_Arco";
		_unit addWeapon "Rangefinder";
		_unit setunitrank "CORPORAL";};
		
		//Guerilla Squad Leader
		case "O_SoldierU_SL_F" :{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		_unit addVest "V_Chestrig_khk";
		_unit addHeadgear "H_Booniehat_mcamo";
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "optic_ACO_grn";
		_unit setunitrank "SERGEANT";};
		
		//Guerilla Team Leader
		case "O_soldierU_TL_F" :{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		_unit addVest "V_Chestrig_khk";
		_unit addHeadgear "H_Booniehat_mcamo";
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "optic_ACO_grn";
		_unit setunitrank "CORPORAL";};
		
		//Guerilla Rifleman
		case "O_soldierU_F" :{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		_unit addVest "V_Chestrig_khk";
		_unit addHeadgear "H_Booniehat_mcamo";
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
		_unit addWeapon "arifle_Katiba_C_F";
		_unit addPrimaryWeaponItem "optic_ACO_grn";
		_unit setunitrank "PRIVATE";};
		
		//Guerilla Autorifleman
		case "O_soldierU_AR_F" :{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		_unit addVest "V_Chestrig_khk";
		_unit addHeadgear "H_Booniehat_mcamo";
		for "_i" from 1 to 2 do {_unit addItemToVest "150Rnd_762x54_Box";};
		_unit addWeapon "LMG_Zafir_F";
		_unit addPrimaryWeaponItem "optic_ACO_grn";
		_unit setunitrank "PRIVATE";};
		
		//Guerilla Machine Gunner
		case "O_Urban_HeavyGunner_F" :{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		_unit addVest "V_Chestrig_khk";
		_unit addHeadgear "H_Booniehat_mcamo";
		for "_i" from 1 to 2 do {_unit addItemToVest "150Rnd_93x64_Mag";};
		_unit addWeapon "MMG_01_tan_F";
		_unit addPrimaryWeaponItem "optic_Arco";
		_unit addPrimaryWeaponItem "bipod_02_F_tan";
		_unit setunitrank "PRIVATE";};
		
		//Guerilla Marksman
		case "O_soldierU_M_F" :{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		_unit addVest "V_Chestrig_khk";
		_unit addHeadgear "H_Booniehat_mcamo";
		for "_i" from 1 to 6 do {_unit addItemToVest "20Rnd_762x51_Mag";};
		_unit addWeapon "srifle_DMR_06_olive_F";
		_unit addPrimaryWeaponItem "optic_ACO_grn";
		_unit addPrimaryWeaponItem "bipod_01_F_blk";
		_unit setunitrank "PRIVATE";};
		
		//Guerilla Sniper
		case "O_Urban_Sharpshooter_F" :{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		_unit addVest "V_Chestrig_khk";
		_unit addHeadgear "H_Booniehat_mcamo";
		for "_i" from 1 to 4 do {_unit addItemToVest "10Rnd_93x64_DMR_05_Mag";};
		_unit addWeapon "srifle_DMR_05_blk_F";
		_unit addPrimaryWeaponItem "optic_LRPS";
		_unit addPrimaryWeaponItem "bipod_01_F_blk";
		_unit setunitrank "PRIVATE";};
		
		};//end type switch
		};//end EAST
		
	
			case RESISTANCE: {
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
			switch (_type) do {
			//Basic
			default {
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit setunitrank "PRIVATE";};

			//Officer
			case "I_Officer_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit setunitrank "LIEUTENANT";};

			//Squad Leader
			case "I_Soldier_SL_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit setunitrank "SERGEANT";};

			//Team Leader
			case "I_Soldier_TL_F" :{
			for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
			for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_Smoke_Grenade_shell";};
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
			_unit addWeapon "arifle_MX_GL_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit setunitrank "CORPORAL";};

			//Autorifleman
			case "I_Soldier_AR_F" :{
			for "_i" from 1 to 3 do {_unit addItemToVest "100Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_SW_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addPrimaryWeaponItem "bipod_01_F_blk";
			_unit setunitrank "PRIVATE";};

			//AT Rifleman
			case "I_Soldier_LAT_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addBackpack "B_AssaultPack_dgtl";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "NLAW_F";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addWeapon "launch_NLAW_F";
			_unit setunitrank "PRIVATE";};

			//AA Rifleman
			case "I_Soldier_AA_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addWeapon "launch_I_Titan_F";
			_unit setunitrank "PRIVATE";};

			//Light Machine Gunner
			case "I_Soldier_lite_F" :{for "_i" from 1 to 2 do {_unit addItemToVest "130Rnd_338_Mag";};
			_unit addWeapon "MMG_02_black_F";
			_unit addPrimaryWeaponItem "optic_Hamr";
			_unit addPrimaryWeaponItem "bipod_01_F_blk";
			_unit setunitrank "PRIVATE";};

			//Medic
			case "I_medic_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addItemToUniform "FirstAidKit";
			_unit addBackpack "B_AssaultPack_dgtl";
			_unit addItemToBackpack "Medikit";
			for "_i" from 1 to 4 do {_unit addItemToBackpack "FirstAidKit";};
			_unit setunitrank "PRIVATE";};

			//Heavy Machine Gunner
			case "I_support_MG_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addBackpack "I_HMG_01_A_high_weapon_F";
			_unit setunitrank "PRIVATE";};

			//Grenade Machine Gunner
			case "I_support_GMG_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addBackpack "I_GMG_01_high_weapon_F";
			_unit setunitrank "PRIVATE";};

			//Assistant Gunner
			case "I_support_AMG_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addBackpack "I_HMG_01_support_high_F";
			_unit setunitrank "PRIVATE";};

			//Mortar Gunner
			case "I_support_Mort_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addBackpack "I_Mortar_01_weapon_F";
			_unit setunitrank "PRIVATE";};

			//Assistant Mortar Gunner
			case "I_support_AMort_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addBackpack "I_Mortar_01_support_F";
			_unit setunitrank "PRIVATE";};

			//Sniper
			case "I_Sniper_F" :{
			_unit forceAddUniform "U_I_FullGhillie_sard";
			_unit addVest "V_PlateCarrierIA1_dgtl";
			for "_i" from 1 to 8 do {_unit addItemToVest "10Rnd_338_Mag";};
			_unit addWeapon "srifle_DMR_02_camo_F";
			_unit addPrimaryWeaponItem "muzzle_snds_338_green";
			_unit addPrimaryWeaponItem "acc_pointer_IR";
			_unit addPrimaryWeaponItem "optic_AMS_khk";
			_unit addPrimaryWeaponItem "bipod_01_F_mtp";
			_unit setunitrank "CORPORAL";};

			//Spotter
			case "I_Spotter_F" :{
			_unit forceAddUniform "U_I_FullGhillie_sard";
			for "_i" from 1 to 2 do {_unit addItemToVest "FirstAidKit";};
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "acc_pointer_IR";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addWeapon "Rangefinder";
			_unit setunitrank "SERGEANT";};

			//UAV
			case "I_soldier_UAV_F" :{
			for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
			_unit addWeapon "arifle_MX_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addBackpack "I_UAV_01_backpack_F";
			_unit linkItem "I_UavTerminal";
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
			};//end type switch
			};//end RESISTANCE
	
	
				case CIVILIAN: {
				//edit gear
				removeuniform _unit;
				removeallweapons _unit;
				switch (_type) do {
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
				};//end TYPE				
				};//end CIVILIAN
				
};//End SIDE switch



};//end function




//ZEUS1 is the name of a Zeus module on map. Alter the name as needed


Zeus addEventHandler ["CuratorObjectPlaced",{  
_zeusModule=_this select 0;
_unit= _this select 1;

	//define based on unit sides

[_unit] spawn Fnc_AdjustUnitGear;


}];


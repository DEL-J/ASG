////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Bismarck, v1.063, #Nebumu)
////////////////////////////////////////////////////////
class sand_eco_gui
{
	idd = -1;
	movingenable = true;
	
	class Controls
	{
		class sand_eco_box: BOX
		{
			idc = 1800;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};

		class sand_eco_frame: RscFrame
		{
			idc = 1800;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.528 * safezoneH;
		};
		class sand_eco_b_order: RscButton
		{
			idc = 1600;
			text = "Order"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class sand_eco_b_cancel: RscButton
		{
			idc = 1601;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class sand_eco_list_weapons: RscListbox
		{
			idc = 1500;
			text = "Weapons"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class sand_eco_list_active_weapons: RscListbox
		{
			idc = 1501;
			text = "Active Weapons"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class sand_eco_list_magazines: RscListbox
		{
			idc = 1502;
			text = "Magazines"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class sand_eco_list_active_magazines: RscListbox
		{
			idc = 1503;
			text = "Active Magazines"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.231 * safezoneH;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

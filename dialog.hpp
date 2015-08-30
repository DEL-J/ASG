class PasswordUI
{
   idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['PasswordUI', _this select 0];";
    fadein = 0;
    fadeout = 0;
        class controls
        {
class RscFrame_1800: RscFrame
{
        idc = 1800;
        x = 0.244042 * safezoneW + safezoneX;
        y = 0.176985 * safezoneH + safezoneY;
        w = 0.495918 * safezoneW;
        h = 0.170008 * safezoneH;
};
class RscStructuredText_1100: RscStructuredText
{
        idc = 1100;
        text = "Enter the password:"; //--- ToDo: Localize;
        x = 0.252041 * safezoneW + safezoneX;
        y = 0.193986 * safezoneH + safezoneY;
        w = 0.479921 * safezoneW;
        h = 0.0510023 * safezoneH;
};
class RscEdit_1400: RscEdit
{
        idc = 1400;
        x = 0.268038 * safezoneW + safezoneX;
        y = 0.261989 * safezoneH + safezoneY;
        w = 0.319947 * safezoneW;
        h = 0.0510023 * safezoneH;
};
class RscButton_1600: RscButton
{
        idc = 1600;
        text = "Submit"; //--- ToDo: Localize;
        x = 0.61998 * safezoneW + safezoneX;
        y = 0.261989 * safezoneH + safezoneY;
        w = 0.0959841 * safezoneW;
        h = 0.0510023 * safezoneH;
        action="[] spawn aph_fnc_CheckPassword;";
};
};
};
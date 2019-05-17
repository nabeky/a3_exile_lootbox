LB_Version = getText (configFile >> "CfgPatches" >> "lootbox" >> "lootbox_version");
[]spawn 
{
	diag_log format ["[LOOTBOX]:: Loot boxes %1 starting",LB_Version];
	diag_log "[LOOTBOX]:: Loading Config";
	call compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\config.sqf";
	if(isNil "LB_CompiledOkay") exitWith
	{
		diag_log "[LOOTBOX]:: ================================";
		diag_log "[LOOTBOX]:: ERROR : failed to read config.sqf ;-(";
		diag_log "[LOOTBOX]:: ================================";
	};
	LB_fnc_marker = compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\functions\marker.sqf";
	LB_fnc_putSimpleobj = compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\functions\putSimpleobj.sqf";
	LB_fnc_collectItems = compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\functions\collectItems.sqf";
	LB_fnc_addCargo = compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\functions\addCargo.sqf";
	LB_fnc_isSafePos = compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\functions\isSafePos.sqf";
	LB_fnc_selectAIGear = compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\functions\selectAIGear.sqf";
	LB_fnc_findBuildings = compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\functions\findBuildings.sqf";
	LB_fnc_getBuildingPos = compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\functions\getBuildingPos.sqf";
	// EH
	LB_eh_fired = compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\functions\event\eh_Fired.sqf";
	LB_eh_engine = compile preprocessFileLineNumbers "\x\addons\a3_exile_lootbox\functions\event\eh_Engine.sqf";

	diag_log "[LOOTBOX]:: Initialised";
	[]execVM "\x\addons\a3_exile_lootbox\putBoxes.sqf";
};
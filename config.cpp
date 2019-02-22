class CfgPatches
{
	class lootbox
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		lootbox_version = "v1.40 (06-01-2019)";
		requiredAddons[] = {"exile_client","exile_assets","exile_server_config","a3_dms"};
		author[]= {"nabek"};
	};
};

class CfgFunctions
{
	class lootbox
	{
		class main
		{
			class lootbox_init
			{
				file = "\x\addons\a3_exile_lootbox\initServer.sqf";
				postInit = 1;
			}
		};
	};
};

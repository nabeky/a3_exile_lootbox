////////////////////////////////////////////////////////////////////////
// Looting boxes (a3_exile_lootbox)
// * config file => config.sqf
//
// for Arma3 EXILE MOD (Server-Addon) and Community
// *if u wont supports? blog.ahh.jp (Japanese only)
// *included documents "readme_jp.txt" but japanese.
// *someone who translates!(English,French,German etc.)
//
//	Index
//	(1) Map Marker
//	(2) Container objects
//	(3) Target location type
//	(4) Create new location
//	(5) Blacklist
//	(6) Trush items
//	(7) Special Rare items
//	(8) Loot groups
//	(9) Location settings
//	(10) Static Item-box
//	(11) Bandit AI(in House)
//	(12) Trap
//	(13) Vehicle/Airplane spawn
//	(14) Fire-place objects
//	(15) Strange objects
//	(16) Flaming objects
//	(17) Travelers AI
//	(18) Iron-man AI
//	(19) Static Water-cooler
//	(20) Custom billboards
//	(21) Text on Map
//	(22) Server messages
////////////////////////////////////////////////////////////////////////
LB_DebugMode = true;
LB_OutputLog = true;
LB_PendingTime = 0.0;	// second
LB_WaitSysBusy = true;	// 40fps lower

/*=============================
	(1) Debug Marker

	*loot-box/trap/strange-obj
	*not use to MarkerType = ""
	Marker Colors
	https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3
	Marker Types
	https://community.bistudio.com/wiki/cfgMarkers
	*/
LB_MapMarker = true;
// Item-box
LB_MapMarkerType = "mil_dot_noShadow";
LB_MapMarkerColor = "ColorYellow";
// Trap
LB_MapMarkerTypeMine = "mil_dot_noShadow";
LB_MapMarkerColorMine = "ColorRed";
// AI
LB_MapMarkerTypeAI = "mil_dot_noShadow";
LB_MapMarkerColorAI = "ColorRed";
// AI Traveler
LB_MapMarkerTypeAITr = "mil_dot_noShadow";
LB_MapMarkerColorAITr = "ColorBlue";
// Vehicle
LB_MapMarkerTypeVehicle = "mil_dot_noShadow";
LB_MapMarkerColorVehicle = "ColorOrange";
// Strange/Framing-object/custom billboard
LB_MapMarkerTypeST = "mil_dot_noShadow";
LB_MapMarkerColorST = "ColorGreen";

/*=============================
	(2) Container objects

	(array)
	Random pickup
	*can unpack(Exile_Container_Storagecrate..)
	Capacity
	500:Exile_Container_CamoTent
	600:Exile_Container_Storagecrate
	???:Exile_Container_SupplyBox
	*/
LB_BoxObjClass_indoor = ["Exile_Container_Storagecrate"];
LB_BoxObjClass_outdoor = ["Exile_Container_Storagecrate","Exile_Container_CamoTent"];

/*=============================
	(3) Target location type

	NameVillage/NameCity/NameCityCapital
	NameLocal/Mount/Airport..
	https://community.bistudio.com/wiki/Location
	*Please check map data
	*if use map-local randmark add "NameLocal"
	*Traveler AI : use "NameCity","NameCityCapital"
	*Iron-man AI : use "NameLocal"(search airport/military)
	*/
//*Can use "Map Local name" for LB_LocationLoot
LB_Locations = ["NameVillage","NameCity","NameCityCapital","NameLocal"];

//*DEBUG fast finish(non Village)
//LB_Locations = ["NameCity","NameCityCapital","NameLocal"];
//LB_Locations = [];

/*=============================
	(4) Create new location
	
	(array)
	1:Location type
	2:Location name
	3:Position
	4:Radius
	*type is "" disable
	*If u wont Item-BOX/Vehicle/AI spawn area
	*/
LB_NewLocation = [
	["NameLocal","Scrap Yard",[5200,11300,0],500]
	];
	
/*=============================
	(5) Blacklist

	*trader zone etc..
	1-3:position(xyz) z:0
	3:radius(m)
	[[x,y,z],radius],[[x,y,z],radius], ...
	*/
LB_Blacklist = [[[0,0,0],0]];
LB_BLTrader = 500;
LB_BLSpawnZone = 0;
LB_BLTerritory = 300;
LB_BLItembox = 20;
LB_BLBandit = 20;
LB_BLVehicle = 20;

/*=============================
	(6) Trush items

	*overwrite the items list
	*/
LB_TrashItems = [
	"Exile_Item_Magazine01",
	"Exile_Item_Magazine02",
	"Exile_Item_Can_Empty",
	"Exile_Item_PlasticBottleEmpty",
	"Exile_Item_PlasticBottleDirtyWater",
	"Exile_Item_PlasticBottleSaltWater",
	"Exile_Item_FuelCanisterEmpty",
	"Exile_Item_BurlapSack",
	"Exile_Item_Bullets_556",
	"Exile_Item_Bullets_762",
	"hgun_Pistol_Signal_F",
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F",
	"6Rnd_RedSignal_F",
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_red",
	"FlareGreen_F",
	"FlareRed_F",
	"FlareWhite_F",
	"FlareYellow_F",
	"UGL_FlareWhite_F",
	"3Rnd_UGL_FlareGreen_F",
	"SmokeShell",
	"SmokeShellOrange",
	"SmokeShellRed",
	"Exile_Item_CarWheel",
	"H_Cap_blu",
	"H_Cap_oli",
	"H_Cap_blk",
	"H_Cap_grn",
	"H_Cap_headphones",
	"H_Cap_tan",
	"U_C_Poor_1",
	"U_C_Poor_2",
	"U_C_Poor_shorts_1",
	"U_C_Poor_shorts_1",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_tricolour",
	"G_Aviator",
	"G_Lady_Dark",
	"G_Lady_Red",
	"G_Lady_Blue",
	"G_Sport_Red",
	"H_Booniehat_grn",
	"H_Booniehat_tan",
	"H_Watchcap_blk",
	"H_Watchcap_khk",
	"H_Hat_checker",
	"H_StrawHat",
	"H_Shemag_olive",
	"H_ShemagOpen_khk",
	"H_TurbanO_blk",
	"H_Beret_red",
	"Exile_Item_WoodPlank",
	"Exile_Item_WoodLog",
	"Exile_Item_SnakeFilet_Raw",
	"Exile_Item_RabbitSteak_Raw",
	"Exile_Item_ChickenFilet_Raw",
	"Exile_Item_GoatSteak_Raw"
	//"Poop",
	//"Samsung_Galaxy",
	//"Surstromming"
];

/*=============================
	(7) Special Rare items

	*/
LB_SRareItems = [
	"Exile_Item_RubberDuck",	//　!?
	"Exile_Item_Knife",
	"Exile_Item_CodeLock",
	"Exile_Item_EMRE",
	"optic_AMS",
	"optic_Nightstalker"
	//"Exile_Item_SafeKit"
	//"Beautiful Girlfriend"
	//"Senzu Bean"
	//"1 Bit-coin"
];

/*=============================
	(8) Loot groups
	
	[group name] (3array)
		[items....] <- static
		[items....] <- 50% random pickup
		[items....] <- rare random 1 pickup
	*Think about Storage capacity
	*One may be added from LB_RareItems
	*Finally it will be overwritten with trush(%)
	*/
LB_LootAllFixedItems = [
	"ItemMap","Binocular","Exile_Item_PlasticBottleFreshWater","Exile_Item_SeedAstics",
	"Exile_Item_Bandage","Exile_Item_Vishpirin",
	"Exile_Weapon_M1014","Exile_Magazine_8Rnd_74Slug","Exile_Magazine_8Rnd_74Slug",
	"Exile_Weapon_Taurus","Exile_Magazine_6Rnd_45ACP","Exile_Magazine_6Rnd_45ACP",
	"9Rnd_45ACP_Mag",
	"Exile_Magazine_7Rnd_45ACP",
	"Exile_Magazine_8Rnd_9x18",
	"16Rnd_9x21_Mag",
	"30Rnd_9x21_Mag",
	"11Rnd_45ACP_Mag",
	"30Rnd_45ACP_Mag_SMG_01"
];
LB_LootGroups = [
	["foods",[
		["Exile_Item_InstantCoffee","Exile_Item_Catfood","Exile_Item_Dogfood","Exile_Item_InstantCoffee","Exile_Item_MountainDupe"],
		["Exile_Item_Moobar","Exile_Item_Raisins","Exile_Item_Noodles","Exile_Item_GloriousKnakworst","Exile_Item_BBQSandwich","Exile_Item_Beer"],
		["Exile_Item_BeefParts","Exile_Item_Cheathas","Exile_Item_PlasticBottleCoffee","Exile_Item_PowerDrink"]
	]],
	["civ",[
		["Exile_Item_Matches","Exile_Item_Bandage","Exile_Item_Heatpack","Exile_Item_ToiletPaper"],
		["ItemGPS","Exile_Item_Vishpirin","Exile_Item_CookingPot","Exile_Item_CanOpener","Exile_Item_CamoTentKit","Exile_Item_Hammer","Exile_Item_MobilePhone"],
		["Exile_Item_InstaDoc","Exile_Item_RubberDuck","NVGoggles"]
	]],
	["tools",[
		["Exile_Item_MetalScrews","Exile_Item_Sand","Exile_Item_Cement","Exile_Item_LightBulb","Exile_Item_ExtensionCord"],
		["Exile_Item_DuctTape","Exile_Item_Rope","Exile_Item_Pliers","Exile_Item_MetalBoard","Exile_Item_MetalPole","Exile_Item_Handsaw","Exile_Item_Screwdriver","Exile_Item_PortableGeneratorKit"],
		["Exile_Item_Knife","Exile_Item_CodeLock","Exile_Item_Grinder","Exile_Item_Foolbox","Exile_Item_BaseCameraKit"]
	]],
	["weapon",[
		[],
		["hgun_P07_khk_F","hgun_Pistol_01_F",	//apex
		"hgun_ACPC2_F","hgun_Pistol_heavy_01_F","hgun_Pistol_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F",
		"SMG_05_F","LMG_03_F",	//apex
		"hgun_PDW2000_F","SMG_01_F","SMG_02_F",
		"Exile_Weapon_SA61","Exile_Weapon_Makarov",
		"Exile_Weapon_Taurus","Exile_Weapon_SA61","Exile_Weapon_Colt1911"],
		[]
	]],
	["asalt",[
		[],
		["arifle_Mk20_F","arifle_TRG20_F","Exile_Weapon_AK74","Exile_Weapon_M4","Exile_Weapon_M16A4","arifle_CTAR_blk_F","arifle_SDAR_F",
		"Exile_Weapon_AKS","Exile_Weapon_AKM","Exile_Weapon_AK107","Exile_Weapon_M16A2",
		"Exile_Weapon_AK47","arifle_Katiba_F","arifle_MX_khk_F","arifle_MXC_khk_F"
		],
		[]
	]],
	["sniper",[	//sniper&ammo
		[
		"5Rnd_127x108_APDS_Mag",
		"5Rnd_127x108_Mag",
		"7Rnd_408_Mag",
		"Exile_Magazine_10Rnd_9x39",
		"Exile_Magazine_10Rnd_303",
		"Exile_Magazine_5Rnd_22LR",
		"Exile_Magazine_5Rnd_127x108_Bullet_Cam_Mag",
		"Exile_Magazine_5Rnd_127x108_APDS_Bullet_Cam_Mag",
		"Exile_Magazine_10Rnd_93x64_DMR_05_Bullet_Cam_Mag",
		"Exile_Magazine_7Rnd_408_Bullet_Cam_Mag",
		"Exile_Magazine_10Rnd_338_Bullet_Cam_Mag",
		"Exile_Magazine_10Rnd_127x99_m107",
		"Exile_Magazine_10Rnd_127x99_m107_Bullet_Cam_Mag",
		"Exile_Magazine_5Rnd_127x108_KSVK_Bullet_Cam_Mag",
		"Exile_Magazine_5Rnd_127x108_APDS_KSVK_Bullet_Cam_Mag"
		],[
		"optic_AMS","optic_Hamr","optic_LRPS",
		"optic_Arco_blk_F","optic_DMS_ghex_F","optic_ERCO_khk_F","optic_SOS_khk_F",
		"bipod_01_F_blk","bipod_02_F_blk",
		"muzzle_snds_B","muzzle_snds_H","muzzle_snds_L","muzzle_snds_M"
		],[
		"Exile_Weapon_LeeEnfield",
		"srifle_DMR_01_F",
		"srifle_GM6_F",
		"Exile_Weapon_SVD",
		"Exile_Weapon_DMR",
		"srifle_LRR_F",
		"srifle_GM6_ghex_F",
		"srifle_DMR_07_hex_F"
		]
	]],
	["armo",[	//asalt,sniper
		[
		"Exile_Magazine_30Rnd_762x39_AK",
		"Exile_Magazine_30Rnd_545x39_AK_White",
		"Exile_Magazine_10Rnd_762x54",
		"20Rnd_762x51_Mag",
		"30Rnd_556x45_Stanag_Tracer_Yellow",
		"30Rnd_65x39_caseless_green",
		"30Rnd_580x42_Mag_Tracer_F",
		"20Rnd_650x39_Cased_Mag_F",
		"30Rnd_762x39_Mag_Tracer_F",
		"30Rnd_545x39_Mag_Tracer_F"
		],[
		"5Rnd_127x108_APDS_Mag",
		"5Rnd_127x108_Mag",
		"7Rnd_408_Mag",
		"Exile_Magazine_10Rnd_303",
		"Exile_Magazine_5Rnd_22LR",
		"Exile_Magazine_5Rnd_127x108_Bullet_Cam_Mag",
		"Exile_Magazine_5Rnd_127x108_APDS_Bullet_Cam_Mag",
		"Exile_Magazine_10Rnd_93x64_DMR_05_Bullet_Cam_Mag",
		"Exile_Magazine_7Rnd_408_Bullet_Cam_Mag",
		"Exile_Magazine_10Rnd_338_Bullet_Cam_Mag",
		"Exile_Magazine_10Rnd_127x99_m107",
		"Exile_Magazine_10Rnd_127x99_m107_Bullet_Cam_Mag",
		"Exile_Magazine_5Rnd_127x108_KSVK_Bullet_Cam_Mag",
		"Exile_Magazine_5Rnd_127x108_APDS_KSVK_Bullet_Cam_Mag"
		],[]
	]],
	["scope",[	//scope,attachments
		["acc_flashlight","acc_pointer_IR","optic_Holosight","Binocular","ItemCompass"],
		[
		"optic_MRD","optic_Aco","optic_Yorris","optic_MRCO","optic_SOS",
		"optic_Arco","optic_DMS","optic_Hamr","optic_KHS_blk","optic_NVS",
		"bipod_01_F_mtp","bipod_02_F_tan","bipod_03_F_oli",
		"optic_ERCO_blk_F","optic_SOS_khk_F",
		"muzzle_snds_M","muzzle_snds_L","muzzle_snds_H","muzzle_snds_acp",
		"muzzle_snds_H_khk_F","muzzle_snds_58_blk_F","muzzle_snds_m_khk_F","muzzle_snds_B_khk_F"
		],
		[
		"Rangefinder","ItemGPS","muzzle_snds_338_black","muzzle_snds_93mmg_tan","optic_LRPS_ghex_F"
		]
	]],
	["armar",[
		["Exile_Headgear_SafetyHelmet"],
		[
		"V_PlateCarrier1_blk","V_PlateCarrier2_rgr","V_PlateCarrierH_CTRG","V_Press_F","V_TacVest_brn",
		"H_HelmetB_light_black","H_HelmetIA","H_HelmetB_light_grass","H_HelmetB_light_snakeskin"
		],
		["V_PlateCarrierIAGL_dgtl","H_HelmetSpecB","H_HelmetSpecB_paint1"]
	]],
	["backpack",[
		[],
		["B_OutdoorPack_blu","B_AssaultPack_blk","B_FieldPack_cbr","B_ViperHarness_blk_F","B_HuntingBackpack","B_TacticalPack_ocamo","B_Kitbag_cbr"],
		["B_Bergen_rgr","B_Carryall_mcamo"]
	]],
	["explosives",[
		["HandGrenade","MiniGrenade","B_IR_Grenade","O_IR_Grenade","I_IR_Grenade","1Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell"],
		["APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","APERSTripMine_Wire_Mag","ClaymoreDirectionalMine_Remote_Mag","SLAMDirectionalMine_Wire_Mag","IEDLandBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDUrbanSmall_Remote_Mag"],
		["SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag"]
	]],
	["vehicle",[	// use vehicle spawn
		[],
		["Exile_Item_Vishpirin","ItemGPS","MiniGrenade","1Rnd_HE_Grenade_shell"],
		["Exile_Item_DuctTape","NVGoggles","Rangefinder","Exile_Item_InstaDoc","Exile_Item_EMRE"]
	]],
	["bandit",[		// use bandit spawn
		[],
		["Exile_Item_Bandage","Exile_Item_Vishpirin","Exile_Item_InstaDoc",
		"MiniGrenade",
		"Exile_Item_Beer","Exile_Item_MountainDupe","Exile_Item_PowerDrink",
		"Exile_Item_Moobar","Exile_Item_CockONut","Exile_Item_Noodles","Exile_Item_ChickenFilet_Cooked",
		"Exile_Item_CanOpener","Exile_Item_DuctTape",
		"Exile_Item_Magazine01","Exile_Item_Magazine02"],
		[]
	]]
];

/*=============================
	(9) Location settings

	1:Location type or name
	(Location Type or MAP LocalName) *priority Type > Name
	2:Radius(m) *0:use map data
	3:Box Count
	4:Static items multiple(1-x) *random
	5:Into buildding rate (0-1)%
	6:Add Special Rare item rate (0-1)%
	7:Add Poptabs(random max value)　low:30%
	8:Trash rate (0-1)%
	9:Bandit AIs(0-x) *DMS Addon
	10:Mine(s) count on nearest road
	11:Wire-trap rate (0-1)%
	12:Strange-objects(0-x)
	13:Flaming-objects(0-x)
	14:Fire places(0-x)
	15:Vehicle count
	16:Vehicle type[] *Cliche:air/tank/army > spawn radius(20m)
	17:Loot groups(array)
	*/
LB_LocationLoot = [
	["Hazar Bagh",[		// 1:<-map local name (Type:NameLocal)
		300,			// 2:  *SAMPLE : local setting
		2,				// 3:
		2,				// 4:
		0.5,			// 5:
		0.1,			// 6:
		100,			// 7:
		0.3,			// 8:
		0,				// 9:
		0,				// 10:
		0.2,			// 11:
		10,				// 12:
		0,				// 13:
		2,				// 14:
		4,				// 15:
		["poor"],		// 16:
		["armo","civ","foods","asalt","weapon","backpack"]
		]
	],
	["Anar",[			// 1:<-map local name (Type:NameLocal)
		300,			// 2:  *SAMPLE : no item-box,trader area etc..
		0,				// 3:
		0,				// 4:
		0,				// 5:
		0,				// 6:
		0,				// 7:
		0,				// 8:
		0,				// 9:
		0,				// 10:
		0,				// 11:
		15,				// 12:<-use strange-obj.
		1,				// 13:<-use flaming-obj.
		2,				// 14:
		0,				// 15:
		[],				// 16:
		[]
		]
	],
	["Scrap Yard",[		// 1:<-new location (Type:NameLocal)
		200,			// 2:  *SAMPLE : vehicle spawn, & 1AI
		0,				// 3:
		1,				// 4:
		0,				// 5:
		0.5,			// 6:
		100,			// 7:
		0.9,			// 8:
		1,				// 9:
		2,				// 10:
		0,				// 11:
		10,				// 12:
		0,				// 13:
		2,				// 14:
		5,				// 15:
		["car","guerilla","armed"],	// 16:
		["armo","civ","foods","asalt","sniper","scope","explosives"]
		]
	],
	["NameVillage",[	// 1:(Type:NameVillage)
		300,			// 2:
		2,				// 3:
		2,				// 4:
		0.5,			// 5:
		0.1,			// 6:
		100,			// 7:
		0.3,			// 8:
		0,				// 9:
		0,				// 10:
		0.2,			// 11:
		10,				// 12:
		0,				// 13:
		2,				// 14:
		4,				// 15:
		["poor"],		// 16:
		["armo","civ","foods","asalt","weapon","backpack"]
		]
	],
	["NameCity",[		// 1:(Type:NameCity)
		500,			// 2:
		5,				// 3:
		2,				// 4:
		0.7,			// 5:
		0.2,			// 6:
		300,			// 7:
		0.2,			// 8:
		2,				// 9:
		0,				// 10:
		0.3,			// 11:
		15,				// 12:
		0,				// 13:
		1,				// 14:
		5,				// 15:
		["poor","car"],	// 16:
		["armo","civ","foods","armar","explosives"]
		]
	],
	["NameCityCapital",[// 1:(Type:NameCityCapital)
		800,			// 2:
		10,				// 3:
		2,				// 4:
		0.8,			// 5:
		0.3,			// 6:
		500,			// 7:
		0.1,			// 8:
		3,				// 9:
		0,				// 10:
		0.5,			// 11:
		20,				// 12:
		1,				// 13:
		1,				// 14:
		5,				// 15:
		["car","guerilla"],	// 16:
		["armo","civ","foods","sniper","scope","armar","explosives"]
		]
	],
	["airfield",[		// 1:(Type:NameLocal:"airfield") *TANOA:type:"Airport"
		800,			// 2:
		2,				// 3:
		2,				// 4:
		0.1,			// 5:
		0.5,			// 6:
		1000,			// 7:
		0.1,			// 8:
		3,				// 9:
		1,				// 10:
		0.7,			// 11:
		0,				// 12:
		2,				// 13:
		0,				// 14:
		3,				// 15:
		["air","armed","guerilla"],	// 16:
		["armo","asalt","sniper","scope","explosives"]
		]
	],
	["military base",[	// 1:(Type:NameLocal)
		800,			// 2:
		2,				// 3:
		2,				// 4:
		0.8,			// 5:
		0.5,			// 6:
		1000,			// 7:
		0.1,			// 8:
		3,				// 9:
		1,				// 10:
		0.7,			// 11:
		0,				// 12:
		2,				// 13:
		0,				// 14:
		3,				// 15:
		["guerilla","armed"],	// 16:
		["armo","asalt","sniper","scope","explosives"]
		]
	]
];

/*=============================
	(10) Static Item-box
	
	(array)
	LB_StaticBox
	1:Position
	2:Item groups[]
	3:Static items multiple(1-x) *random
	4:Add Special Rare item rate (0-1)%
	5:Trash rate (0-1)%
	6:Add Poptabs(random max value)　low:30%
	
	*put on Maze-Prize,Top of Mt. or Tower,Under sea etc.
	*use object LB_BoxObjClass_outdoor
	*/
LB_StaticBox = [
	[[0,0,0],["asalt","sniper","scope"],2,0.8,0.1,3000]
];

/*=============================
	(11) Bandit AI(in City)

	*defficulty:
		"random","static","hardcore","difficult","moderate","easy"
	*class:
		"custom" or DMS settings:"random","assault","MG","sniper"
	*use DMS-addon config
	*1AI = 1Group
	LB_BanditItemCfg
	1:Static items multiple(1-x) *random
	2:Add Special Rare item rate (0-1)%
	3:Trash rate (0-1)%
	*/
LB_BanditSide = EAST;
LB_BanditDifficulty = "random";
LB_BanditClass = "custom";
LB_BanditSniper = 10;	// higher(ASL base difference) *class=DMS:sniper
LB_BanditMove = 0.8;
//*class:Custom Equipments
LB_BanditUniforms		= ["Exile_Uniform_BambiOverall","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_NikosAgedBody","U_NikosBody","U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_BG_Guerilla2_1","U_IG_Guerilla3_2","U_BG_Guerrilla_6_1","U_BG_Guerilla1_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1"];
LB_BanditVests			= ["V_Press_F","V_TacVestCamo_khk","V_TacVest_blk","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_oli"];
LB_BanditHeadgear		= ["Exile_Headgear_SafetyHelmet","Exile_Headgear_SantaHat","H_TurbanO_blk","H_Shemag_khk","H_Shemag_olive","H_Shemag_olive_hs","H_Shemag_tan","H_ShemagOpen_khk","H_ShemagOpen_tan","Exile_Headgear_SafetyHelmet","Exile_Headgear_SantaHat","H_CrewHelmetHeli_B","H_CrewHelmetHeli_I","H_CrewHelmetHeli_O"];
LB_BanditWeapon			= ["SMG_01_F","SMG_02_F","SMG_05_F","hgun_PDW2000_F","arifle_TRG21_F","arifle_TRG20_F","arifle_SDAR_F","Exile_Weapon_LeeEnfield","arifle_AKS_F","Exile_Weapon_AK74","Exile_Weapon_AK107","arifle_Katiba_F"];
LB_BanditWeaponAttach	= ["acc_flashlight"];
LB_BanditPistol			= ["hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","Exile_Weapon_Makarov"];
LB_BanditPistolAttach	= [];
LB_BanditAssignedItems	= ["ItemMap","ItemCompass"];	//,"ItemGPS"
LB_BanditLauncher		= [];
LB_BanditBackpack		= [
	"B_HuntingBackpack","B_Kitbag_cbr","B_Kitbag_mcamo","B_Kitbag_sgg","B_OutdoorPack_blk","B_OutdoorPack_blu","B_OutdoorPack_tan","B_TacticalPack_blk","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_oli","B_TacticalPack_rgr",
	"B_ViperLightHarness_khk_F","B_ViperLightHarness_ghex_F","B_FieldPack_blk","B_ViperHarness_base_F","B_Bergen_blk","B_FieldPack_cbr","B_ViperHarness_khk_F","B_FieldPack_oucamo","B_FieldPack_oucamo","B_ViperHarness_hex_F","B_ViperLightHarness_blk_F","B_FieldPack_ocamo","B_ViperLightHarness_blk_F","B_ViperHarness_ghex_F","B_Bergen_sgg","B_ViperHarness_ghex_F","B_ViperLightHarness_khk_F","B_FieldPack_ocamo","B_ViperHarness_oli_F","B_FieldPack_cbr","B_FieldPack_blk","B_FieldPack_oucamo","B_ViperHarness_khk_F","B_ViperLightHarness_khk_F","B_ViperLightHarness_hex_F","B_FieldPack_ocamo","B_ViperHarness_hex_F","B_ViperHarness_base_F","B_ViperHarness_blk_F","B_ViperLightHarness_ghex_F","B_FieldPack_cbr","B_ViperLightHarness_oli_F","B_ViperHarness_oli_F","B_ViperLightHarness_hex_F","B_Bergen_rgr","B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_oucamo","B_ViperLightHarness_oli_F","B_ViperLightHarness_ghex_F","B_FieldPack_blk","B_FieldPack_cbr","B_ViperLightHarness_hex_F","B_FieldPack_oucamo","B_FieldPack_ocamo","B_FieldPack_ghex_F","B_FieldPack_blk","B_ViperLightHarness_blk_F","B_FieldPack_ocamo","B_ViperHarness_blk_F","B_Bergen_mcamo","B_ViperLightHarness_oli_F"];
LB_BanditItem			= [];	// *recommend empty(use Item-box engine)
LB_BanditItemGroups = ["civ","bandit"];
LB_BanditItemCfg = [1,0.5,0.1];
LB_BanditMaxPoptab = 1000;

/*=============================
	(12) Trap

	ATMine/APERSMine/APERSBoundingMine/SLAMDirectionalMine/APERSTripMine
	SatchelCharge_F/DemoCharge_F/Claymore_F/IEDUrbanBig_F/IEDLandBig_F/IEDUrbanSmall_F/IEDLandSmall_F
	UnderwaterMine/UnderwaterMineAB/UnderwaterMinePDM
	*/
LB_NearMine = ["APERSTripMine"];	// or "Samsung_Galaxy"
LB_RoadMine = ["APERSMine"];

/*=============================
	(13) Vehicle/Airplane spawn

	*spawn in town near builddings
	*"Bike" not damege spawn
	
	LB_Vehicles
	1:Type
		1:Vehicle name[]
		*Cliche:
		*	poor - not use Blacklist
		*	air/tank/army - spawn radius 20m
	
	LB_VItemConfig
	1:Static items multiple(1-x) *random
	2:Add Special Rare item rate (0-1)%
	3:Trash rate (0-1)%
	*/
LB_VRandomFuel = true;
LB_VFuelLow = 0.1;
LB_VFuelMax = 0.5;	// false:LB_VRandomFuel
LB_VBrokenParts = ["wheel"];	// damege 0.9-0.99
LB_VDamageChance = 0.9;
LB_VDamageLow = 0.5;
LB_VDamageMax = 0.7;
LB_EngineOn = 0.7;
LB_LightOn = 0.0;	// see arma3 bug ;-)
LB_VItemGroup = ["vehicle","civ","weapon"];
LB_VItemConfig = [1,0.1,0.7];
LB_VPoptabMax = 1000;
LB_Vehicles = [
	["poor",[
		"Exile_Bike_OldBike",	//?!
		"Exile_Bike_OldBike",	//?!
		"Exile_Bike_MountainBike",	//?!
		"Exile_Bike_MountainBike",	//?!
		"Exile_Bike_QuadBike_Blue",
		"Exile_Bike_QuadBike_Red",
		"Exile_Bike_QuadBike_White",
		//"Exile_Car_Kart_RedStone",
		"Exile_Car_Tractor_Red"
		//"Exile_Car_OldTractor_Red",
		//"Exile_Car_TowTractor_White"
		]
	],
	["car",[
		"Exile_Car_Volha_Blue",
		"Exile_Car_Volha_White",
		"Exile_Car_Volha_Black",
		"Exile_Car_Lada_Green",
		"Exile_Car_Lada_Taxi",
		"Exile_Car_Lada_Red",
		"Exile_Car_Lada_Hipster",
		"Exile_Car_Octavius_White",
		"Exile_Car_Octavius_Black",
		"Exile_Car_Hatchback_Yellow",
		"Exile_Car_Hatchback_Sport_Green",
		"Exile_Car_Hatchback_Sport_Orange",
		//"Exile_Car_Van_White",
		//"Exile_Car_Van_Box_White",
		"Exile_Car_Hatchback_Sport_Red",
		"Exile_Car_SUV_Grey",
		"Exile_Car_SUV_Orange",
		"Exile_Car_Golf_Red",
		"Exile_Car_Golf_Black"
		//"Exile_Car_SUVXL_Black",
		]
	],
	["guerilla",[
		"Exile_Car_UAZ_Open_Green",
		"Exile_Car_UAZ_Green",
		//"Exile_Car_LandRover_Red",
		//"Exile_Car_LandRover_Ambulance_Green",
		//"Exile_Car_Van_White",
		//"Exile_Car_Van_Box_White",
		"Exile_Car_Offroad_Red",
		"Exile_Car_Offroad_Blue",
		"Exile_Car_Offroad_Guerilla01",
		"Exile_Car_Offroad_Rusty1",
		"Exile_Car_Van_Red",
		"Exile_Car_Van_Guerilla01",
		"Exile_Car_Van_Box_Red",
		"Exile_Car_Van_Box_Guerilla01"
		//"Exile_Car_Ikarus_Party"	//bus
		]
	],
	["armed",[
		"Exile_Car_Offroad_Armed_Guerilla01",
		//"Exile_Car_HEMMT",
		"Exile_Car_Hunter",
		"Exile_Car_Ifrit",
		"Exile_Car_Strider",
		"Exile_Car_SUV_Armed_Black",
		"Exile_Car_BRDM2_HQ",
		"Exile_Car_BTR40_MG_Green",
		"Exile_Car_HMMWV_M134_Green",
		"Exile_Car_HMMWV_M2_Green",
		"Exile_Car_HMMWV_MEV_Green",
		"Exile_Car_HMMWV_UNA_Green",
		"Exile_Car_Tempest",
		"Exile_Car_Zamak"
		]
	],
	["air",[
		"Exile_Plane_Cessna",
		"Exile_Plane_AN2_Green",
		"Exile_Plane_AN2_White",
		"Exile_Plane_AN2_Stripe",
		"Exile_Chopper_Hummingbird_Green",
		"Exile_Chopper_Hummingbird_Civillian_Red",
		"Exile_Chopper_Hummingbird_Civillian_Light",
		"Exile_Chopper_Hummingbird_Civillian_Sunset"
		]
	]
];

/*=============================
	(14) Fire places objects

	*use craft,cooking,night light etc.
	*/
LB_FirePlaceObjs = [
	"Land_Fire_barrel_burning",
	"Land_Campfire_burning"
];
	
/*=============================
	(15) Strange objects

	[object,size,flat,simulation]
	Randomly placed on the surrounding ground.
	ex:Garbage,Scarecrow,Blood pool,Oil spill,Dead body etc..
	*if u wont can put Wreck vehicles,Air Planes,Rocks,Mountains!?
	Worthless.. Joke? or landmark for BOX?!
	*/
LB_StrangeObjs = [
	["Land_HighVoltageTower_dam_F",10,false,false],	// tower
	["Land_Communication_F",10,false,false],		// higher tower
	["Land_PowerPoleWooden_L_F",5,false,false],		// wooden tower
	["Land_FieldToilet_F",5,false,false],			// toilet
	["Land_GarbageBarrel_01_F",3,false,false],		// barrel
	["Land_Garbage_square3_F",3,true,false],		// garbage
	["Land_Garbage_square5_F",5,true,false],		// garbage
	["Land_GarbageBags_F",5,false,false],			// garbage
	["Land_GarbagePallet_F",5,false,false],			// garbage
	["Land_GarbageWashingMachine_F",5,false,false],	// garbage
	["Land_JunkPile_F",5,false,false],				// garbage
	["Land_Tyre_F",1,false,false],					// tyre
	["Land_CratesWooden_F",5,false,false],			// wooden box
	["Land_Sacks_heap_F",3,false,false],			// sucks
	["Land_Wreck_Skodovka_F",5,false,false],		// wreck vehicles
	["Land_Wreck_CarDismantled_F",5,false,false],	//
	["Land_Wreck_Truck_F",5,false,false],			//
	["Land_Wreck_Car2_F",5,false,false],			//
	["Land_Wreck_Car3_F",5,false,false],			//
	["Land_Wreck_Hunter_F",5,false,false],			//
	["Land_Wreck_Van_F",5,false,false],				//
	["Land_Wreck_Offroad_F",5,false,false],			//
	["Land_Wreck_Offroad2_F",5,false,false],		//
	["Land_Wreck_UAZ_F",5,false,false],				//
	["Land_Wreck_Ural_F",10,false,false],			//
	["Land_Wreck_Truck_dropside_F",10,false,false],	//
	["Land_Wreck_BMP2_F",10,false,false],			//
	["Land_Wreck_HMMWV_F",10,false,false],			//
	["Land_Wreck_BRDM2_F",10,false,false],			//
	["Land_Wreck_Slammer_F",10,false,false],		//
	["Land_Wreck_Heli_Attack_02_F",10,false,false],	//
	["Land_UWreck_Heli_Attack_02_F",10,false,false],//
	["Land_UWreck_MV22_F",10,false,false],			//

	// DLC objects
	["Oil_Spill_F",3,true,false],					// oil spill(DLC:cart)
	["Land_GarbageHeap_01_F",5,false,false],		// garbage(DLC:apex)
	["Land_GarbageHeap_02_F",5,false,false],		// garbage(DLC:apex)
	["Land_GarbageHeap_03_F",5,false,false],		// garbage(DLC:apex)
	["Land_GarbageHeap_04_F",5,false,false],		// garbage(DLC:apex)
	["BloodPool_01_Large_New_F",3,true,false],		// blood(DLC:Laws of War)
	["BloodPool_01_Large_Old_F",3,true,false],		// blood(DLC:Laws of War)
	
	// !! Needs CUP-Terrains MOD !! or delete
	["CUP_misc_TorzoTree_PMC",5,false,false],		// dead tree
	["CUP_misc_BurnSpruce_PMC",5,false,false],		// dead tree
	["Mass_grave",10,false,false],					// MAD..
	["CUP_Akat02S",5,false,false],					// strange tree
	["CUP_A2_snowman",2,false,false],				// snow-man
	["CUP_A1_Mrtvola_Army2",3,false,false],			// dead man? Zombie?
	["CUP_A1_Mrtvola_Army3",3,false,false],			// dead man? Sleeping?
	["CUP_A1_pa_sx",3,false,false],					// X'mas tree
	["CUP_A1_socha",10,false,false],				// large statue
	["Land_tires_EP1",3,false,false],				// tyre
	["CUP_A2_boogieman",3,false,false],				// scarecrow
	// !! Needs CUP-Terrains MOD !! or delete
	["LADAWreck",5,false,false],					// wreck vihecles
	["HMMWVWreck",5,false,false],					//
	["JeepWreck1",5,false,false],					//
	["JeepWreck2",5,false,false],					//
	["JeepWreck3",5,false,false],					//
	["hiluxWreck",5,false,false],					//
	["datsun01Wreck",5,false,false],				//
	["datsun02Wreck",5,false,false],				//
	["SKODAWreck",5,false,false],					//
	["Mi8Wreck",10,false,false],					// wreck helis
	["BlackhawkWreck",10,false,false]				//
	//["Scarecrow_Trump",1,false,true]
	//["Scarecrow_Putin",1,false,true]
];

/*=============================
	(16) Flaming objects

	*Vehicles/Tanks or Building or Wood material?
	*Free burning!
	*/
LB_FlamingObjs = [
	"Land_Wreck_Offroad_F",
	"Land_Wreck_UAZ_F",
	"Land_Wreck_Ural_F",
	"Land_Wreck_Truck_dropside_F",
	"Land_Wreck_Truck_F",
	"Land_Wreck_Heli_Attack_02_F",
	"Land_UWreck_Heli_Attack_02_F",
	"Land_UWreck_MV22_F"
];

/*=============================
	(17) Traveler AI(moving items & monney)

	* Walk between city to city
	* Spawn all CapitalCity 1person
	LB_TravelerItemCfg
	1:Static items multiple(1-x) *random
	2:Add Special Rare item rate (0-1)%
	3:Trash rate (0-1)%
	*/
LB_Traveler = true;
LB_TravelerGrpMaxAI = 3;
LB_TravelerItemGrp = ["civ","foods","scope"];
LB_TravelerItemCfg = [1,0.5,0.1];
LB_TravelerPoptabMax = 3000;

/*=============================
	(18) Iron-Man AI(not die?)
	
	LB_IronMan
	1:Spawn position[x,y,0] *[] is military or airports random
	2:AI count
	* Iron body AI spawn position
	* Banbi-uniform & Santa hut with Machine gun & Granade
	* 300m radius patrol,remove all weapons
	* no Death,canot capture items & weapons
	*/
LB_IronMan = [
	//[[100,100,0],1]	// *SAMPLE [100,100] fixed spawn
	[[],1],				// *SAMPLE airport or military random 1 spawn
	[[],1]				// *SAMPLE airport or military random 1 spawn
];

/*=============================
	(19) Static Clean-water

	LB_CleanWaterObj
	1:Position([x,y,0] or [x,y,z])
	2:Angle(0-359) *Eden editor rotation "Z" value
	Fixed spawn clean-water objects
	*default class "Land_WaterCooler_01_new_F"
	*config.sqf:CfgInteractionModels->CleanWaterSource
	*if u wont in building spawn. use Z value [x,y,z]
	*/
LB_CleanWaterObj = [
	[[100,100,0],0],
	[[110,100,0],0],
	[[120,100,0],0]
];
LB_CleanWaterCount = -1;	// -1 is All available,1-x is Random pickup

/*=============================
	(20) Custom billboards

	LB_CBillboard
	1:Object classname(Land_Billboard_F etc.)
	2:Position[x,y,0]
	3:Angle(0-359) *Eden editor rotation "Z" value
	4:Texture
	*Change texture objects
	*Use Eden editor menu(value:position/vector)
	*Texture image in mission.pbo(.paa/.jpeg,size:2^x)
	*Land_Billboard_F/Land_InfoStand_V1_F/Land_InfoStand_V2_F/Land_MapBoard_F/Land_Noticeboard_F
	SignAd_Sponsor_F/SignAd_SponsorS_F etc.
	*Land_Billboard_04_blank_F(2screen) no support
	*/
LB_CBillboards = [
	["Land_Billboard_F",[0,0,0],0,"bill0.jpg"]	// sample:map left-bottom corner,replace texture data
];

/*=============================
	(21) Map text

	LB_Maptext
	1:Position on map
	2:MarkerType
	3:Text
	4:Color
	5:Size[width,height] *marker scale,[0,0] is non-icon
	*can use double-byte characters(Kanji)
	*/
LB_Maptext = [
	[[400,400],"KIA","WUT is here!?","ColorBlack",[0,0]]
];

/*=============================
	(22) Broodcast messages
	
	*/
LB_Bcmessage = [
	"Hello everyone! ;-)",
	"Welcome to Exile Server ;-)",
	"Information https://steamcommunity.com/",
	"Support http://google.com",
	"Discord Ch. https://discordapp.com/",
	"Donate https://www.paypal.com"
];
LB_BcmessageTime = 60;	// seconds

// orz..
LB_CompiledOkay = true;
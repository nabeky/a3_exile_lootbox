if(!isServer)exitWith{};
/*
|LOOT BOX for Arma3 EXILE MOD(Server-Addon)
|"a3_exile_lootbox"
|putBoxes.sqf (´・ω・｀)ノ
|*Licence:CreativeCommons(CC-NC)
|Special Thanks!! Yukihito,Losty
|дﾟ)
*/
//-------------------------------
//　Kick ass!
LB_fn_log={
	if!(LB_OutputLog)exitWith{};
	diag_log format["[LOOTBOX]:: %1",_this];
};
"Starting Loot-boxes addon" call LB_fn_log;
uisleep LB_PendingTime;
private["_middle","_mapCenter","_maxDistance","_locCapital","_locVillage","_locMilitary"];
_middle = floor(worldSize/2);
_mapCenter = [_middle,_middle,0];
_maxDistance = _middle * 1.4;
private _aiNames = ["Goemon","Nezumi","Tengu","Karaage","Takoyaki","Zunda","Horumon","Ikageso","Uiroh","Monja","Tekkamaki"];
//-------------------------------
// Bandit city
private _bc_vehicles=[
	"Exile_Car_Ural_Covered_Yellow",
	"Exile_Car_Ural_Open_Military",
	"Exile_Car_Ural_Open_Yellow",
	"Exile_Car_Ural_Open_Blue",
	"Exile_Car_V3S_Open",
	"Exile_Car_V3S_Covered",
	"UAZ_Open_Base",
	"UAZ_Armed_Base",
	"Exile_Car_Ural_Covered_Military",
	"Ural_Civ_01",
	"Exile_Car_Lada_Hipster",
	"Exile_Car_LandRover_Desert",
	"Exile_Car_LandRover_Sand",
	"Exile_Car_Offroad_Guerilla12",
	"Ikarus_Govnodav_02",
	"Exile_Car_Ikarus_Blue",
	"Ikarus_Govnodav_01",
	"Ikarus_Civ_02"
];
private _bc_objects=[
// !! CUP-Terrain objests !! *if u don't need, delete or replace
/*
	"US_WarfareBUAVterminal_Base_EP1",
	"TK_WarfareBVehicleServicePoint_Base_EP1",
	"Land_PowGen_Big_ruins_EP1",
	"TK_WarfareBBarracks_Base_EP1",
	"Wire","Wire","Wire","Wire","Wire","Wire","Wire","Wire",
	"Fort_RazorWire","Fort_RazorWire","Fort_RazorWire","Fort_RazorWire",
	"Fort_RazorWire","Fort_RazorWire","Fort_RazorWire","Fort_RazorWire",
	"Land_CamoNet_EAST_EP1",
	"Land_CamoNet_NATO_EP1",
	"Land_CamoNetB_NATO_EP1",
	"Land_CamoNetVar_NATO_EP1",
	"US_WarfareBContructionSite_Base_EP1",
	"US_WarfareBContructionSite1_Base_EP1",
	"TK_GUE_WarfareBContructionSite_Base_EP1",
	"Land_Misc_Cargo1F",
	"Land_Misc_Cargo1E",
	"Misc_Cargo1Bo_civil",
	"Land_Misc_CargoMarket1a_EP1",
	"Land_Misc_Cargo2E",
	"Land_Misc_Cargo2B",
	"Land_Misc_Cargo2B_EP1",
	"Land_Misc_Cargo2E_EP1",
*/
	// ** Arma3 objects(included DLCs)
	"Land_MarketShelter_F",
	"Land_CanvasCover_01_F",
	"Land_CanvasCover_02_F",
	"Land_cargo_addon02_V2_F",
	"Land_cargo_addon02_V1_F",
	"Land_Cargo40_color_V3_ruins_F",
	"Land_cargo_house_slum_ruins_F",
	"Land_Cargo20_china_color_V1_ruins_F",
	"Land_Cargo40_military_ruins_F",
	"Land_Cargo40_idap_ruins_F",
	"Land_Cargo20_idap_ruins_F",
	"Land_cargo_house_slum_F",
	"Land_Cargo20_vr_F",
	"Land_Cargo20_IDAP_F",
	"Land_Cargo20_blue_F",
	"Land_Cargo20_cyan_F",
	"Land_Cargo20_yellow_F"
];

//-------------------------------
// petit func.
//дﾟ)
//-------------------------------
LB_fn_logline={"----------------------------------------------------------------" call LB_fn_log;};
LB_fn_2pos={[floor(_this#0),floor(_this#1)]};
// Calc cargo Poptabs
LB_fn_calc_poptab={
	floor(_this*0.3+random(_this*0.7))
};
// Check Military location
LB_fn_isMilitary={
	private _name=toLower _this;if((_name find "airport")>-1 or(_name find "airfield")>-1 or(_name find "military")>-1)exitWith{true};
false};
// Set Waypoint BanditAI
LB_fn_addWaypoint={
	private _wp = (_this#0) addWaypoint [_this#1,5];
	_wp setWaypointBehaviour selectRandom["AWARE","COMBAT","STEALTH"];
	_wp setWaypointCombatMode "RED";
	_wp setWaypointCompletionRadius 10;
	_wp setWaypointType (_this#2);
_wp};
// Find safe-empty area
// return:position []:none
LB_fn_findEmptyAroundField={
	params ["_pos",["_radius",50],["_size",5],["_spawned",[]]];
	private _ret = [];
	private _ok=false;
	for [{private _i=0},{_i<5 && !_ok},{_i=_i+1}] do{
		_pos = [_pos,5,_radius,_size,0,0.3,0,_spawned] call BIS_fnc_findSafePos;
		if((count _pos) isEqualTo 2)then{
			if(count(_pos nearRoads 10) < 1)then{
				_ok=true;_ret=_pos;
			};
		};
	};
_ret};// [x,y]
// Calc Object add direction
LB_fn_calcDirPos={
	params ["_obj","_add","_dist"];
	_add = (getDir _obj)+_add;
	if(_add < 0)then{_add=360+_add;};
	private _pos = _obj getPos [_dist,(_add % 360)];
[_pos#0,_pos#1,0]};
// Easy Put around objects
LB_fn_putAroundObject={
	params ["_base","_classname","_add","_dist",["_sim",false]];
	private _obj = createVehicle [_classname,[_base,_add,_dist] call LB_fn_calcDirPos,[],0,"CAN_COLLIDE"];
	_obj enableSimulationGlobal _sim;
	_obj setDir floor(random 360);
_obj};
// Get Killed Player object
LB_fn_getPlayerObj={
	params ["_player"];
	private["_veh","_playerObj"];
	_playerObj = objNull;
	if (isPlayer _player) then{
		_veh = vehicle _player;
		_playerObj = _player;
		if (!(_player isKindOf "Exile_Unit_Player") && {!isNull (gunner _player)}) then{
			_playerObj = gunner _player;
		};
		if (!(_veh isEqualTo _player) && {(driver _veh) isEqualTo _player}) then{
			_playerObj = driver _veh;
		};
	};
_playerObj};
// Change Player Score (0:player 1:score%)
LB_fn_changePlayerScore={
	params ["_player","_score"];
	private _sc = round((_player getVariable ["ExileScore", 0])*_score);
	_player setVariable ["ExileScore",_sc];
	ExileClientPlayerScore = _sc;
	(owner _player) publicVariableClient "ExileClientPlayerScore";
	ExileClientPlayerScore = nil;
_sc};

/*
	Spawn Bandit (random gears) *cant use alone
	return:unit
*/
LB_fn_spawnBanditAI = {
	params ["_AIcnt","_objLoc","_side","_wp","_spos","_bclass","_diffi","_ItemGrp","_ItemCfg","_MaxTabs"];

	private _unit = [_group,_spos,_bclass,_diffi,"bandit","soldier",("" call LB_fnc_selectAIGear)] call DMS_fnc_SpawnAISoldier;
	_unit setVariable["LB_BANDIT",[_AIcnt,_objLoc,_side,_wp,_spos,_bclass,_diffi,_ItemGrp,_ItemCfg,_MaxTabs]];
	_unit setVariable["ExileMoney",_MaxTabs call LB_fn_calc_poptab,true];
	_unit setName (selectRandom ["Goemon","Nezumi","Tengu","Karaage","Takoyaki","Zunda","Horumon","Ikageso","Uiroh","Monja","Tekkamaki"]);
	_unit allowFleeing (random 0.3);
	_unit allowDamage true;
	_unit setDamage 0;
	_unit enableAI "AUTOTARGET";
	_unit enableAI "TARGET";
	_unit enableAI "MOVE";

	// freez
	if(count _wp < 1)then{
		_unit disableAI "PATH";
	};

	reloadEnabled _unit;
	if(needReload _unit isEqualTo 1)then{reload _unit};
	_items = [selectRandom _ItemGrp,_ItemCfg,false] call LB_fnc_collectItems;
	{
		[_unit,_x] call ExileClient_util_playerCargo_add;
	}forEach _items;
	_unit addEventHandler ["Fired","_this call LB_eh_Fired"];
	_unit addMPEventHandler ["MPKilled","params['_unit','_killer'];
		if(isServer)then{
			[_unit]+(_unit getVariable 'LB_BANDIT') spawn{
				params ['_unit','_AIcnt','_Loc','_side','_wp','_pos','_class','_diffi','_ItemGrp','_ItemCfg','_MaxTabs'];
				if(count ((units group _unit) - [_unit]) < 1)then{
					uiSleep (300 + floor(random 300));
					waitUntil {
						uiSleep 60;
						(allPlayers findIf {(_pos distance2D _x) < 500 && alive _x}) isEqualTo -1
					};
					[_AIcnt,_Loc,_side,_wp,_pos,_class,_diffi,_ItemGrp,_ItemCfg,_MaxTabs] call LB_fn_spawnBanditGroup;
				};
			};
		};"];
_unit};
/*
	Spawn City/Traveler Bandit Group(random gears)
	"_AIcnt"	AI Count
	"_objLoc"	Location
	"_side"		AI Side
	"_wp"		Way positions[] *random
	"_pos"		Spawn position
	"_bclass"	DMS class
	"_diffi"	DMS difficulty
	"_ItemGrp"	Item group
	"_ItemCfg"	Item config
	"_MaxTabs"	Max tabs
	return:group
*/
LB_fn_spawnBanditGroup={
	params ["_AIcnt","_objLoc","_side","_wp","_pos","_bclass","_diffi","_ItemGrp","_ItemCfg","_MaxTabs"];
	
	private _group = createGroup [_side,false];
	_group setVariable ["DMS_LockLocality",nil];
	_group setVariable ["DMS_SpawnedGroup",true];
	_group setVariable ["DMS_Group_Side","bandit"];
	_group setVariable ["DMS_AllowFreezing",true];
	_group setVariable ["DMS_isGroupFrozen",true];
	_group setVariable ["LB_FireCount",time];
	_group setCombatMode "RED";

	if(_bclass isEqualTo "sniper")then{
		_group setBehaviour "STEALTH";
	}else{
		_group setBehaviour selectRandom["AWARE","COMBAT","STEALTH"];
	};

	// make waypoint
	while{(count (waypoints _group)) > 0}do{
		deleteWaypoint ((waypoints _group)#0);
	};
	if(count _wp > 0)then{
		{
			private _wpos = _x;
			[_group,_wpos,"MOVE"] call LB_fn_addWaypoint;
		}forEach (_wp call ExileClient_util_array_shuffle);
		[_group,_pos,"CYCLE"] call LB_fn_addWaypoint;
		_wp pushBack _pos;
	};

	if(_AIcnt > 1)then{
		for [{private _i=0},{_i<_AIcnt},{_i=_i+1}] do{
			private _sppos = [_pos,100,1] call LB_fn_findEmptyAroundField;
			if!(_sppos isEqualTo [])then{
				[_AIcnt,_objLoc,_side,_wp,_sppos,_bclass,_diffi,_ItemGrp,_ItemCfg,_MaxTabs] call LB_fn_spawnBanditAI;
			};
		};
	}else{
		[_AIcnt,_objLoc,_side,_wp,_pos,_bclass,_diffi,_ItemGrp,_ItemCfg,_MaxTabs] call LB_fn_spawnBanditAI;
	};
	format["[LOOTBOX]:: Spawn Bandit(%1) %2AI %3 %4 %5",text _objLoc,_AIcnt,_bclass,_diffi,_pos] call LB_fn_log;
_group};
/*
	Build CapitalCity:BanditCity (AI group & Objects)
	"_loc"				Location
	"_buildings"		Buildings[]
	"_spawnedPositions"	Blacklist[]
	
	return:group
*/
LB_fn_buildBanditCity = {
	params ["_loc","_buildings","_spawnedPositions"];
	if(count(_buildings#0) < 10)exitWith{};

	private _locPos = [];
	_locPos = getPos selectRandom (_buildings#0);
	["LB_BANDITCITY_CIRCLE",[_locPos#0,_locPos#1],"","colorUNKNOWN",1,"BDiagonal",_loc getVariable "LB_SIZE"] call LB_fnc_marker;
	["LB_BANDITCITY_MARK",[_locPos#0,_locPos#1],"ExileMissionCapturePointIcon","ColorRed",1,"Bandit city"] call LB_fnc_marker;

	// vehicle object(simple obejct)
	_cnt = 0;
	for [{_j=0},{_j<_C_banditcitygrp},{_j=_j+1}] do{
		_className = selectRandom _bc_vehicles;
		_pos = [_locPos,150,15,_spawnedPositions]call LB_fn_findEmptyAroundField;
		if!(_pos isEqualTo [])then{
			[_className,_pos] call LB_fnc_putSimpleobj;
			_spawnedPositions pushBack [[_pos#0,_pos#1,0],5];
			_cnt = _cnt + 1;
		};
	};
	format["Bandit-City %1 Vehicles",_cnt] call LB_fn_log;
	// camp object(simple object)
	_cnt = 0;
	{
		_className = _x;
		_pos = [_locPos,200,5,_spawnedPositions]call LB_fn_findEmptyAroundField;
		if!(_pos isEqualTo [])then{
			[_className,_pos]call LB_fnc_putSimpleobj;
			_spawnedPositions pushBack [[_pos#0,_pos#1,0],5];
			_cnt = _cnt + 1;
		};
	}forEach _bc_objects;
	format["Bandit-City %1 Objects",_cnt] call LB_fn_log;

	format["Bandit-City %1 Groups",_C_banditcitygrp] call LB_fn_log;
	for [{_j=0},{_j<_C_banditcitygrp},{_j=_j+1}] do{	// spawn groups(3AI)
		private _wp = [];
		if(count(_buildings#1) > 0)then{
			_wp pushBack getPos (selectRandom (_buildings#1));
		};
		for [{_k=0},{_k<count(_buildings#0) && (count _wp)<5},{_k=_k+1}] do{
			_wp pushBack getPos (selectRandom (_buildings#0));
		};
		while{count _wp < 5}do{
			_wp pushBack [[[_pos,_loc getVariable "LB_SIZE"]],[]] call BIS_fnc_randomPos;
		};
		// Spawn 3AI
		[3,_loc,_C_banditSide,_wp,getPos selectRandom (_buildings#0),_C_banditClass,_C_banditDifficulty,_C_banditItemgrps,_C_banditItemcfg,_C_banditmaxpoptab] call LB_fn_spawnBanditGroup;
	};
};
/*
	Spawn IronMiller AI (Military)
	"_pos"			Position
	"_spawn"		Spawn number
	"_side"			Side
	
	return:-
*/
LB_fn_spawnIronMiller = {
	params ["_pos","_spawn","_side"];

	private _group = createGroup [_side,false];
	_group setVariable ["DMS_LockLocality",nil];
	_group setVariable ["DMS_SpawnedGroup",true];
	_group setVariable ["DMS_Group_Side","bandit"];
	_group setVariable ["DMS_AllowFreezing",true];
	_group setVariable ["DMS_isGroupFrozen",true];
	_group setVariable ["LB_FireCount",time];
	_group setCombatMode "RED";
	_group setBehaviour "AWARE";	//CARELESS
	[_group,_pos,300] call bis_fnc_taskPatrol;

	private ["_unit"];
	for [{_j=0},{_j<_spawn},{_j=_j+1}] do{
		_unit = [_group,_pos findEmptyPosition [5,50],"custom","hardcore","bandit","soldier",("IRON" call LB_fnc_selectAIGear)] call DMS_fnc_SpawnAISoldier;
		_unit setVariable ["LB_IM",[_pos,_spawn,_side]];
		_unit setVariable ["BIS_enableRandomization", false];
		_unit setVariable ["BIS_fnc_animalBehaviour_disable", true];
		_unit setVariable ["DMS_AI_Money",0];	// no poptabs
		_unit setVariable ["DMS_AI_Respect",0];	// no respects
		_unit setName "Iron-Miller";
		_unit allowFleeing 0;
		_unit setDamage 0;
		_unit allowDamage false;
		_unit removeAllEventHandlers "Fired";
		_unit removeAllEventHandlers "HandleDamage";
		_unit removeAllMPEventHandlers "MPKilled";
		_unit addEventHandler ["Fired","_this call LB_eh_fired"];
		_unit addEventHandler ["HandleDamage",{0}];
		_unit addEventHandler ["Dammaged","(_this#0) setDamage 0"];
		_unit addMPEventHandler ["MPKilled","params['_unit'];
			'SmokeShell' createVehicle (getPos _unit);
			{_unit removeWeaponGlobal _x;} forEach (weapons _unit);
			_unit setUnitLoadout 'Exile_Unit_Player';
			[_unit]spawn{
				uisleep 10;
				deleteVehicle (_this#0);
			};
			[_unit]+(_unit getVariable 'LB_IM') spawn{
				params ['_unit','_pos','_spawn','_side'];
				if(count ((units group _unit) - [_unit]) < 1)then{
					uisleep 2;
					[_pos,_spawn,_side] call LB_fn_spawnIronMiller;
				};
			};
			"];
		[_unit, "Miller"] remoteExec ["setFace", 0, _unit];
		reloadEnabled _unit;
		if(needReload _unit isEqualTo 1)then{reload _unit};
	};
};
/*
	Spawn Traveler AI CapitalCity to near City (AI group)
	"_loc"				Location
	
	return:-
*/
LB_fn_spawnTravelerGroup = {
	params ["_loc"];

	private _pos = [[[position _loc, _loc getVariable "LB_SIZE"]],[]] call BIS_fnc_randomPos;
	_pos = _pos findEmptyPosition [0,50];
	if!([_pos,[]] call LB_fnc_isSafePos)exitWith{};

	_loc_city = nearestLocations [_pos,["NameCity","NameLocal"],4000];
	if(count _loc_city < 1)exitWith{};
	private _wp = [];
	private _loc_to = selectRandom _loc_city;
	_wp pushBack ([[[position _loc_to, (size _loc_to)#0]],[]] call BIS_fnc_randomPos);

	private _spawncnt = floor(random _C_travelersGrpMax) + 1;
	format["Traveler %1 AI %2 move to %3 %4",_spawncnt,_pos,text _loc_to,_wp#0] call LB_fn_log;
	
	// Spawn AI
	[_spawncnt,_loc,_C_banditSide,_wp,_pos,_C_banditClass,_C_banditDifficulty,_C_travelersItemGrp,_C_travelersItemCfg,_C_travelersMaxTab] call LB_fn_spawnBanditGroup;
	["LB_TR#"+(text _loc),_pos,_C_markertypeAItr,_C_markercolorAItr,0.7] call LB_fnc_marker;
};
//-------------------------------
// read config
private _C_wsb = LB_WaitSysBusy;
private _C_TraderSide = LB_TraderSide;
private["_C_log","_C_loc","_C_newloc","_C_locLoot","_C_lootGrp","_C_boxobjclass_in","_C_boxobjclass_out","_C_fixeditems","_C_trashitems","_C_srareitems","_C_fireplaceobj","_C_strangeobj","_C_flamingobj","_C_nearMine","_C_roadMine","_C_rndexileobj","_C_cleanwatercnt","_C_concretemixcnt","_C_tradercnt"];
_C_log = LB_OutputLog;
_C_loc = LB_Locations;
_C_newloc = LB_NewLocation;
_C_locLoot = LB_LocationLoot;
_C_lootGrp = LB_LootGroups;
_C_boxobjclass_in = LB_BoxObjClass_indoor;
_C_boxobjclass_out = LB_BoxObjClass_outdoor;
_C_fixeditems = LB_LootAllFixedItems;
_C_trashitems = LB_TrashItems;
_C_srareitems = LB_SRareItems;
_C_fireplaceobj = LB_FirePlaceObjs;
_C_strangeobj = LB_StrangeObjs;
_C_flamingobj = LB_FlamingObjs;
_C_nearMine = LB_NearMine;
_C_roadMine = LB_RoadMine;
_C_rndexileobj = LB_RandomExileObj;
_C_cleanwatercnt = LB_ReoCleanWaterCount;
_C_lockercnt = LB_ReoLockerCount;
_C_concretemixcnt = LB_ReoConcreteMixCount;
_C_tradercnt = LB_ReoTraderCount;
//
private["_C_banditSide","_C_banditDifficulty","_C_banditClass","_C_banditSniper","_C_banditmove","_C_banditItemgrps","_C_banditItemcfg","_C_banditmaxpoptab","_C_banditcitygrp"];
_C_banditSide = LB_BanditSide;
_C_banditDifficulty = LB_BanditDifficulty;
_C_banditClass = LB_BanditClass;
_C_banditSniper = LB_BanditSniper;
_C_banditmove = LB_BanditMove;
_C_banditItemgrps = LB_BanditItemGroups;
_C_banditItemcfg = LB_BanditItemCfg;
_C_banditmaxpoptab = LB_BanditMaxPoptab;
_C_banditcitygrp = LB_BCGroups;
//
private["_C_traveler","_C_travelersGrpMax","_C_travelersItemGrp","_C_travelersItemCfg","_C_travelersMaxTab","_C_ironman"];
_C_traveler = LB_Traveler;
_C_travelersGrpMax = LB_TravelerGrpMaxAI;
_C_travelersItemGrp = LB_TravelerItemGrp;
_C_travelersItemCfg = LB_TravelerItemCfg;
_C_travelersMaxTab = LB_TravelerPoptabMax;
_C_ironman = LB_IronMan;
//
private["_C_vrndfuel","_C_vfuellow","_C_vfuelmax","_C_vbroken","_C_vdamege","_C_vdamegelow","_C_vdamegemax","_C_vengineon","_C_vlighton","_C_vitemgrp","_C_vitemcfg","_C_vpoptab","_C_vlist"];
_C_vrndfuel = LB_VRandomFuel;
_C_vfuellow = LB_VFuelLow;
_C_vfuelmax = LB_VFuelMax;
_C_vbroken = LB_VBrokenParts;
_C_vdamege = LB_VDamageChance;
_C_vdamegelow = LB_VDamageLow;
_C_vdamegemax = LB_VDamageMax;
_C_vengineon = LB_EngineOn;
_C_vlighton = LB_LightOn;
_C_vitemgrp = LB_VItemGroup;
_C_vitemcfg = LB_VItemConfig;
_C_vpoptab = LB_VPoptabMax;
_C_vlist = LB_Vehicles;
//
private["_C_blacklist","_C_bl_item","_C_bl_bandit","_C_bl_vehicle","_C_staticbox","_C_cbboards","_C_bfuel","_C_ttraders","_C_tttype","_C_ttwp"];
_C_blacklist = LB_Blacklist;
_C_bl_item = LB_BLItembox;
_C_bl_bandit = LB_BLBandit;
_C_bl_vehicle = LB_BLVehicle;
_C_staticbox = LB_StaticBox;
_C_cbboards = LB_CBillboards;
_C_bfuel = LB_BFuel_Rate;
_C_bfuelmk = LB_BFuel_MapMark;
_C_ttraders = LB_TTraders;
_C_tttype = LB_TTType;
_C_ttmessages = LB_TTMessages;
_C_ttwp = LB_TTWayPoints;
_C_ttinci = LB_TTInvincible;
//
private["_C_marker","_C_markercolor","_C_markertype","_C_markercolorMine","_C_markertypeMine","_C_markercolorAI","_C_markertypeAI","_C_markercolorAItr","_C_markertypeAItr","_C_markercolorST","_C_markertypeST","_C_markercolorVI","_C_markertypeVI","_C_maptext"];
_C_marker = LB_MapMarker;
_C_markercolor = LB_MapMarkerColor;
_C_markertype = LB_MapMarkerType;
_C_markercolorMine = LB_MapMarkerColorMine;
_C_markertypeMine = LB_MapMarkerTypeMine;
_C_markercolorAI = LB_MapMarkerColorAI;
_C_markertypeAI = LB_MapMarkerTypeAI;
_C_markercolorAItr = LB_MapMarkerColorAITr;
_C_markertypeAItr = LB_MapMarkerTypeAITr;
_C_markercolorST = LB_MapMarkerColorST;
_C_markertypeST = LB_MapMarkerTypeST;
_C_markercolorVI = LB_MapMarkerColorVehicle;
_C_markertypeVI = LB_MapMarkerTypeVehicle;
_C_maptext = LB_Maptext;

//-------------------------------
// Create new locations
{
	if !((_x#0) isEqualTo "")then{
		private _loc = createLocation [_x#0,_x#2,_x#3,_x#3];
		_loc setPosition (_x#2);
		_loc setName (_x#1);
		_loc setText (_x#1);
		_loc setSize [200,200];
		format["create new location : %1:%2 %3",_x#0,_x#1,(_x#2)call LB_fn_2pos] call LB_fn_log;
	};
}foreach _C_newloc;
//-------------------------------
//　location engine
/*
	Location Variable:
	"LB_CFG"		: Config
	"LB_BASEPOS"	: Base position
	"LB_SIZE"		: Size
*/
private["_locations","_locItems","_locCount","_icnt","_noHouse","_bInDoor","_boxName","_pos","_vehicle","_ItemsList","_popTabs"];
private["_spawnedPositions","_posMine","_mine","_mcnt"];
private["_objLoc","_temppos","_locationName","_locationType","_locationsize","_posBase","_buildings","_buildingCnt","_lconfig"];
private["_aicnt","_useLaunchers","_bclass","_group","_cgear","_unit","_wppos","_target","_road"];
private["_i","_j","_k","_cnt","_posStr"];
private["_vicnt","_ok","_bike","_className","_type","_size","_rndpos","_parts","_hitpointsData","_damege"];
private["_strenge","_className","_size","_flat","_siml","_temp","_tpos","_vectorDirUp","_model"];
private["_flcnt","_BanditCity"];

// location collect
_locations = nearestLocations[_mapCenter,_C_loc,_maxDistance];
_locItems = count _locations;
_locCapital = [];
_locVillage = [];
_locMilitary = [];
_locCount = 0;
LB_fn_log_location = {params["_locCount","_objLoc"];
	if(LB_DebugMode)then{
		format["%1 - %2 (%3) Size:%4 [X:%5 Y:%6]",_locCount,text _objLoc,(type _objLoc)select[4],(size _objLoc)#0,floor((position _objLoc)#0),floor((position _objLoc)#1)] call LB_fn_log;
	};
};
call LB_fn_logline;
format["** Server:%1",serverName] call LB_fn_log;
format["** Map:%2 (Size:%3m Center:%4)",serverName,worldName,worldSize,_mapCenter] call LB_fn_log;
call LB_fn_logline;
format["** Locations :%1",_locItems] call LB_fn_log;
{
	_objLoc = _x;
	_locCount = _locCount + 1;
	
	if(type _objLoc isEqualTo "NameVillage")then{
		_locVillage pushBack _objLoc;
	}else{
		if(type _objLoc isEqualTo "NameCityCapital")then{
			_locCapital pushBack _objLoc;
		}else{
			if((text _objLoc)+(type _objLoc) call LB_fn_isMilitary)then{
				_locMilitary pushBack _objLoc;
			};
		};
	};
	[_locCount,_objLoc] call LB_fn_log_location;
}forEach _locations;
if(LB_DebugMode)then{
	"** Capital City list" call LB_fn_log;
	_locCount = 1;
	{[_locCount,_x] call LB_fn_log_location;_locCount=_locCount+1;}forEach _locCapital;
	"** Military list" call LB_fn_log;
	_locCount = 1;
	{[_locCount,_x] call LB_fn_log_location;_locCount=_locCount+1;}forEach _locMilitary;
	call LB_fn_logline;
};
// Bandit city
_BanditCity = selectRandom _locCapital;
//-------------------------------
//　all locations loop
_locCount = 0;
{
	// Wait for system busy
	if(_C_wsb > 0)then{waitUntil{sleep 1;diag_fps > _C_wsb};};

	_objLoc = _x;
	_temppos = position _objLoc;
	_locationName = text _objLoc;
	_locationType = type _objLoc;
	_locationsize = (size _objLoc)#0;
	_locCount = _locCount + 1;

	// Lookup location configs
	_lconfig = nil;
	{
		if(_x#0 isEqualTo _locationType)exitWith{
			_lconfig = _x#1;
		};
		if(_x#0 isEqualTo _locationName)exitWith{
			_lconfig = _x#1;
		};
	}foreach _C_locLoot;
	if(isNil {_lconfig})then{
		call LB_fn_logline;
		format["** Nothing location config:(%1/%2) %3:%4",_locCount,_locItems,_locationType,_locationName] call LB_fn_log;
	}else{
		// Load location config
		_lconfig params ["_C_areaSize","_C_boxCount","_C_multiple","_C_intoBuildding","_C_RateSRare","_C_maxPoptab","_C_rateTrash","_C_banditAIs","_C_putMine","_C_putWiretrap","_C_strangeCount","_C_flamingCount","_C_firePlaces","_C_vehiclecount","_C_vehicletype","_C_lootGroups"];
		_objLoc setVariable ["LB_CFG",_lconfig];

		// Adjust radius
		if(_C_areaSize isEqualTo 0)then{
			_C_areaSize = (size _x)#1;
			if((size _x)#0 > (size _x)#1)then{
				_C_areaSize = (size _x)#0;
			};
		};
		_objLoc setVariable ["LB_SIZE",_C_areaSize];

		// Adjust base position
		_posBase = _temppos;
		_posBase = [[[_posBase, _C_areaSize*0.3]],[]] call BIS_fnc_randomPos;
		private _nearestRoad = [_posBase] call BIS_fnc_nearestRoad;
		if!(isNull(_nearestRoad))then{
			_posBase = getPos _nearestRoad;
		}else{
			_posBase = getPos (nearestBuilding _posBase);
		};
		_objLoc setVariable ["LB_BASEPOS",_posBase];
		
		// Collect near buildings
		_buildings = [_posBase,_C_areaSize,_C_banditSniper] call LB_fnc_findBuildings;
		_buildingCnt = count(_buildings#0);
		// Log
		call LB_fn_logline;
		format["** Found!(%1/%2) %3:%4 [X:%5/Y:%6] house:%7 radius:%8 box:%9",_locCount,_locItems,_locationType,_locationName,floor(_posBase#0),floor(_posBase#1),_buildingCnt,_C_areaSize,_C_boxCount] call LB_fn_log;
		if(LB_DebugMode)then{
			if!(isNull (_buildings#2))then{
				format["** Lower Pos.:%1 (bp:%2) ASL:%3",str(_buildings#2),count((_buildings#2) buildingPos -1),AGLToASL(getPos (_buildings#2))] call LB_fn_log;
			};
			if!(isNull (_buildings#3))then{
				format["** Higher Pos.:%1 (bp:%2) ASL:%3",str(_buildings#3),count((_buildings#3) buildingPos -1),AGLToASL(getPos (_buildings#3))] call LB_fn_log;
			};
			format["** Difference in height:%1m (ASL:%2m - %3m)",(_buildings#4)toFixed 2,(AGLToASL(getPos (_buildings#2))#2)toFixed 2,(AGLToASL(getPos (_buildings#3))#2)toFixed 2] call LB_fn_log;
		};
	
		// Random open doors
		if(_buildingCnt > 0)then{
			{
				if !(isNil "_x")then{
					if(random 1 > 0.8)then{this = _x;[_x,1,1] call BIS_fnc_Door;};
				};
			}forEach (_buildings#0);
		};
		
		// add blacklist
		_spawnedPositions = [];
		_spawnedPositions append _C_blacklist;

		//-------------------------------
		// "loot boxes" Loop!!
		_icnt = _C_boxCount;
		for [{_j=0},{_j<20 && _icnt>0 && _buildingCnt > 0},{_j=_j+1}] do{
			_building = selectRandom (_buildings#0);
			_ok = [getPos _building,_spawnedPositions] call LB_fnc_isSafePos;
			
			if(_ok)then{
				// decide place(near building)
				_noHouse = false;if(_buildingCnt < _icnt * 2)then{_noHouse = true;};
				_bInDoor = true;
				_boxName = "";
				_pos = [];
				if(random 1 < _C_intoBuildding and (not _noHouse))then{
					// Indoor
					_bpos = [_building] call LB_fnc_getBuildingPos;
					_pos = ASLToATL(AGLToASL(_bpos#3));
					_boxName = selectRandom _C_boxobjclass_in;
				}else{
					// Outdoor(random "on field"or"near building")
					if(_noHouse)then{
						_pos = [_posBase,1,_C_areaSize,2,0,0.2,0,_spawnedPositions] call BIS_fnc_findSafePos;
					}else{
						_pos = [getPos _building,1,10,2,0,0.2,0,_spawnedPositions] call BIS_fnc_findSafePos;
					};
					if(count _pos isEqualTo 2 and not(isOnRoad _pos))then{
						_boxName = selectRandom _C_boxobjclass_out;
						_bInDoor = false;
					};
				};

				if !(_boxName isEqualTo "")then{
					// Spawn BOX
					_vehicle = createVehicle [_boxName,_pos,[],0,"CAN_COLLIDE"];
					_vehicle setDir (random 360);
					_vehicle allowDamage false;
					_vehicle enableRopeAttach false;
					_ItemsList = [selectRandom _C_lootGroups,[_C_multiple,_C_RateSRare,_C_rateTrash],true] call LB_fnc_collectItems;
					_popTabs = _C_maxPoptab call LB_fn_calc_poptab;
					[_vehicle,_ItemsList,_popTabs,[]] call LB_fnc_addCargo;
					// Log
					format["Loot %1/%2 %3 House:%4 %5",(_C_boxCount - _icnt + 1),_C_boxCount,_boxName,_bInDoor,_pos] call LB_fn_log;
					["LB_item#"+_locationName+str _icnt,_pos,_C_markertype,_C_markercolor,0.7] call LB_fnc_marker;
					// Add blacklist
					_spawnedPositions pushBack [[_pos#0,_pos#1,0],_C_bl_item];

					// Trap!
					if(random 1 < _C_putWiretrap)then{
						if !(_bInDoor)then{
							_pos = [_pos#0,_pos#1];
							_posMine = [_pos,1,3,1,0,0.2,0,[]] call BIS_fnc_findSafePos;
							if !(count _posMine isEqualTo 3)then{
								_mine = createMine [selectRandom _C_nearMine,_posMine,[],1];
								_C_banditSide revealMine _mine;
								["LB_Trap#"+_locationName+str _icnt,getPos _mine,_C_markertypeMine,_C_markercolorMine,0.7] call LB_fnc_marker;
								format["with Trap! %1",getPos _mine] call LB_fn_log;
							};
						};
					};
					_icnt = _icnt - 1;
				};
			}
		};
		if(_icnt > 0)then{
			format["%1/%2 canot found places",_C_boxCount - _icnt,_C_boxCount] call LB_fn_log;
		};
		//-------------------------------
		// Trap!(on road)
		_mcnt = _C_putMine;
		for [{_j=0},{_j<10 && _mcnt>0},{_j=_j+1}] do{
			_pos = [[[_posBase, _C_areaSize]],[]] call BIS_fnc_randomPos;
			_posMine = [_pos, _C_areaSize, []] call BIS_fnc_nearestRoad;
			if!(isNull(_posMine))then{
				_ok = [getPos _posMine,_spawnedPositions] call LB_fnc_isSafePos;
				if(_ok)then{
					_mine = createMine [selectRandom _C_roadMine, getPos _posMine , [], 0];
					_C_banditSide revealMine _mine;
					["LB_Mine#"+_locationName+str _j,getPos _mine,_C_markertypeMine,_C_markercolorMine,0.7] call LB_fnc_marker;
					format["Road Mine %1/%2 %3",_C_putMine - _mcnt + 1,_C_putMine,(getPos _mine)call LB_fn_2pos] call LB_fn_log;
					_spawnedPositions pushBack [[getPos _mine select 0,getPos _mine select 1,0],10];
					_mcnt = _mcnt - 1;
				};
			};
		};
		//-------------------------------
		// Spawn vehicles
		_vicnt = _C_vehiclecount;
		for [{_j=0},{_j<20 && _vicnt>0},{_j=_j+1}] do{
			// Select vehicle
			_ok = false;
			_bike = false;
			_className = "";
			_type = selectRandom _C_vehicletype;
			{
				if(_type isEqualTo (_x#0))then{
					_className = selectRandom (_x#1);
				};
			}foreach _C_vlist;
			if(_className isEqualTo "")then{
				format["canot found vihecle type:%1",_type] call LB_fn_log;
			}else{
				// object size
				_size = 4.5;
				if(toLower(_type) find "air" >= 0 or toLower(_type) find "tank" >= 0 or toLower(_type) find "army" >= 0)then{
					_size = 20;
				};
				if((toLower(_className) find "_bike_") >= 0)then{
					_bike = true;
					_size = 3;
				};

				// find position
				_rndpos = false;
				_pos = [];
				if(_buildingCnt > _vicnt * 2)then{
					// Find near buildings
					_pos = (getPos (selectRandom (_buildings#0))) findEmptyPosition [5+_size,5+_size * 5,_className];
				}else{
					// Put random on field
					_pos = [[[_posBase, _C_areaSize]],[]] call BIS_fnc_randomPos;
					_pos = _pos findEmptyPosition [_size,_size * 5,_className];
					_rndpos = true;
				};
				if(count(_pos) > 2)then{
					if !(isOnRoad _pos)then{
						_ok = [_pos,_spawnedPositions] call LB_fnc_isSafePos;
					};
				};
				if(_ok)then{
					_vehicle = [_className, [_pos#0,_pos#1,0],floor(random 360),true] call ExileServer_object_vehicle_createNonPersistentVehicle;
					// Damege?
					if !(_bike)then{
						_hitpointsData = getAllHitPointsDamage _vehicle;
						if !(_hitpointsData isEqualTo [])then{
							_hitpoints = _hitpointsData select 0;
							{
								_parts = _x;
								_ok = false;
								_damege = _C_vdamegelow + random (_C_vdamegemax-_C_vdamegelow);
								{
									if !((toLower(_parts) find _x) isEqualTo -1)then{
										// broken parts!?
										_damege = 0.9 + random 0.1;
										_ok = true;
									};
								}foreach _C_vbroken;
								if (_ok or (random 1 < _C_vdamege))then{
									_vehicle setHitPointDamage [_parts, _damege];
								};
							}forEach _hitpoints;
						};
					};
					if (_C_vrndfuel) then{
						_vehicle setFuel (_C_vfuellow + random (_C_vfuelmax-_C_vfuellow));
					}else{
						_vehicle setFuel _C_vfuelmax;
					};
					if((not _bike) and random 1 < _C_vengineon)then{
						_vehicle engineOn true;
					};
					if((not _bike) and random 1 < _C_vlighton)then{
						_vehicle setPilotLight true;
					};

					_items = [selectRandom _C_vitemgrp,_C_vitemcfg,true] call LB_fnc_collectItems;
					[_vehicle,_items,(_C_vpoptab call LB_fn_calc_poptab),[]] call LB_fnc_addCargo;
					_vehicle addEventHandler ["Engine","_this call LB_eh_engine"];
					_vehicle setVariable ["LB_Attach",selectRandom["MiniGrenade","SmokeShell","SmokeShellOrange","SmokeShellRed"]];
					_vehicle setVariable ["LB_Started",false];

					_vicnt = _vicnt - 1;
					["LB_Vehicle#"+_locationName+str _vicnt,getPos _vehicle,_C_markertypeVI,_C_markercolorVI,0.7] call LB_fnc_marker;
					format["Vehicle %1/%2 %3 on field:%4 %5",_C_vehiclecount - _vicnt,_C_vehiclecount,_className,_rndpos,(getPos _vehicle)call LB_fn_2pos] call LB_fn_log;
					_spawnedPositions pushBack [[(getPos _vehicle)#0,(getPos _vehicle)#1,0],_C_bl_vehicle];
				};
			};
		};
		if(_vicnt > 0)then{
			format["Vehicle canot found places, last %1(%2)",_vicnt,_C_vehiclecount] call LB_fn_log;
		};
		//-------------------------------
		// Spawn city bandit AIs
		if(_C_banditAIs > 0)then{
			_aicnt = _C_banditAIs;
			_useLaunchers = DMS_ai_use_launchers;
			for [{_j=0},{_j<10 && _aicnt>0},{_j=_j+1}] do{
				_pos = _posBase;
				_bclass = _C_banditClass;
				if !(_buildingCnt < _aicnt * 2)then{
					// in building
					_building = [];
					if(_locationName+_locationType call LB_fn_isMilitary)then{
						// all
						_building = selectRandom (_buildings#0);
					}else{
						// choice higher
						if((_buildings#4) < 10 or count (_buildings#1) < _C_banditAIs)then{
							_building = selectRandom (_buildings#0);
						}else{
							_building = selectRandom (_buildings#1);
							if(isNil"_building")then{
								_building = selectRandom (_buildings#0);
							};
						};
					};
					// Sniper?
					if (random 1 > 0.9 and not(isNull(_buildings#3)))then{
						_building = _buildings#3;
						_bclass = "sniper";
					};
					
					// get nearest road position
					_bpos = [_building] call LB_fnc_getBuildingPos;
					_pos = _bpos#2;
					if(count (_bpos#6) isEqualTo 3)then{
						_pos = ASLToATL(AGLToASL(_bpos#6));
					};
					if(_bclass isEqualTo "sniper")then{
						_pos = ASLToATL(AGLToASL(_bpos#4));
					};
				}else{
					// Random on field
					_pos = [_posBase,1,_C_areaSize,3,0,0.2,0,_spawnedPositions] call BIS_fnc_findSafePos;
					_pos = [_pos#0,_pos#1,0];
				};
				if([_pos,_spawnedPositions] call LB_fnc_isSafePos)then{
					// waypoints
					private _wp = [];
					if(random 1 < _C_banditmove)then{	// move or freez
						private _wptmp = [];
						// search Vehicles
						_target = _pos nearEntities [["Car"], _C_areaSize];
						if(count _target > 0)then{
							{
								_wptmp = getPos _x;
								if((random 1 > 0.5) && [_wptmp,[]] call LB_fnc_isSafePos)then{
									_wp pushBack _wptmp;
								};
							}forEach _target;
						};
						// search Landmark
						_target = nearestTerrainObjects [_pos,["FUELSTATION","CHURCH","HOSPITAL","TOURISM","MAIN ROAD"],_C_areaSize];
						if(count _target > 0)then{
							_wptmp = getPos(selectRandom _target);
							if([_wptmp,[]] call LB_fnc_isSafePos)then{
								_wp pushBack _wptmp;
							};
						};
						// higher building
						if(count (_buildings#1) > 0 && count _wp <5)then{
							_wp pushBackUnique (getPos (selectRandom (_buildings#1)));
						};
						// buildings
						for [{private _i=0},{_i<count(_buildings#0) && (count _wp)<5},{_i=_i+1}] do{
							_wp pushBack (getPos (selectRandom (_buildings#0)));
						};
						while{count _wp < 5}do{
							private _ps = [[[_pos, _C_areaSize]],[]] call BIS_fnc_randomPos;
							if!(_ps isEqualTo [0,0])then{
								_wp pushBack _ps;
							};
						};
						{
							[format["LB_AI#%1_%2_%3",_locationName,_x#0,_x#1],_x,"waypoint",_C_markercolorAI,0.7] call LB_fnc_marker;
						}forEach _wp;
					};
					
					// spawn city bindit
					[1,_objLoc,_C_banditSide,_wp,_pos,_bclass,_C_banditDifficulty,_C_banditItemgrps,_C_banditItemcfg,_C_banditmaxpoptab] call LB_fn_spawnBanditGroup;

					_aicnt = _aicnt - 1;
					["LB_AI#"+_locationName+str _aicnt,_pos,_C_markertypeAI,_C_markercolorAI,0.7] call LB_fnc_marker;
					_spawnedPositions pushBack [[_pos#0,_pos#1,0],_C_bl_bandit];
				};
			};
			if(_aicnt > 0)then{
				format["AI canot found places, last %1(%2)",_aicnt,_C_banditAIs] call LB_fn_log;
			};
			DMS_ai_use_launchers = _useLaunchers;
		};
		//-------------------------------
		// Fire places
		for [{_j=0},{_j<_C_firePlaces},{_j=_j+1}] do{
			_className = selectRandom _C_fireplaceobj;
			_pos = [[[_posBase,_C_areaSize]],[]] call BIS_fnc_randomPos;
			_posStr = getPos(nearestBuilding _pos);
			_pos = [_posStr,150,2,_spawnedPositions]call LB_fn_findEmptyAroundField;
			if!(_pos isEqualTo [])then{
				_vehicle = createVehicle [_className,_pos,[],0,"CAN_COLLIDE"];
				_vehicle setDir (random 360);
				_vehicle allowDamage false;
				_vehicle enableSimulationGlobal true;
				_vehicle enableRopeAttach false;
				_spawnedPositions pushBack [[_pos#0,_pos#1,0],2];
				["LB_FP#"+_locationName+str _j,_pos,_C_markertypeST,_C_markercolorST,0.7] call LB_fnc_marker;
			};
		};
		//-------------------------------
		// Strange object
		for [{_j=0},{_j<_C_strangeCount},{_j=_j+1}] do{
			(selectRandom _C_strangeobj)params ["_className","_size","_flat","_siml"];

			_ok = false;
			_pos = [[[_posBase,_C_areaSize*0.5]],[]] call BIS_fnc_randomPos;
			// flat object
			if (_flat)then{
				_road = [_pos, _C_areaSize, []] call BIS_fnc_nearestRoad;
				if !(isNull _road)then{
					_posStr = getPos _road;
					_pos = [[[_posStr, 5]],[]] call BIS_fnc_randomPos;
					_ok = true;
				};
			};
			// non-flat object
			if !(_ok)then{
				_posStr = getPos(nearestBuilding _pos);
				_pos = [_posStr,50,_size,_spawnedPositions]call LB_fn_findEmptyAroundField;
				if!(_pos isEqualTo [])then{_ok = true;};
			};
			if(_ok)then{
				if(_siml)then{
					_vehicle = createVehicle [_className,_pos,[],0,"CAN_COLLIDE"];
					_vehicle setDir floor(random 360);
					_vehicle allowDamage false;
					_vehicle enableSimulationGlobal _siml;
					_vehicle enableRopeAttach false;
				}else{
					[_className,_pos] call LB_fnc_putSimpleobj;
				};
				_spawnedPositions pushBack [[_pos#0,_pos#1,0],_size];
				["LB_ST#"+_locationName+str _j,_pos,_C_markertypeST,_C_markercolorST,0.7] call LB_fnc_marker;
			};
		};
		//-------------------------------
		// Flaming object
		_flcnt = _C_flamingCount;
		for [{_j=0},{_j<10 && _flcnt>0},{_j=_j+1}] do{
			_pos = [[[_posBase, _C_areaSize*0.5]],[]] call BIS_fnc_randomPos;
			_posStr = getPos(nearestBuilding _pos);
			_pos = [_posStr,50,5,_spawnedPositions]call LB_fn_findEmptyAroundField;
			if!(_pos isEqualTo [])then{
				[selectRandom _C_flamingobj,_pos] call LB_fnc_putSimpleobj;
				// flaming
				createVehicle ["test_EmptyObjectForFireBig",_pos,[],0,"CAN_COLLIDE"];
				["LB_FL#"+_locationName+str _flcnt,_pos,_C_markertypeST,_C_markercolorST,0.7] call LB_fnc_marker;
				_flcnt = _flcnt - 1;
				_spawnedPositions pushBack [[_pos#0,_pos#1,0],5];
			};
		};
		//-------------------------------
		// Bandit City
		if(_BanditCity isEqualTo _objLoc)then{
			if(_C_banditcitygrp > 0)then{
				[_objLoc,_buildings,_spawnedPositions] call LB_fn_buildBanditCity;
			};
		};
		//-------------------------------
		// Traveler AIs (NameCityCapital <> NameCity)
		if(_locationType isEqualTo "NameCityCapital")then{
			[_objLoc] call LB_fn_spawnTravelerGroup;
		};
	};
}forEach _locations;
_spawnedPositions = [];

//-------------------------------
// Static loot-boxes
if(count _C_staticbox > 0)then{
	call LB_fn_logline;
	_cnt = 0;
	{
		_x params ["_rate","_pos","_group","_mul","_srare","_trash","_poptab"];
		if(random 1 < _rate)then{
			private _boxName = selectRandom _C_boxobjclass_out;
			private _vehicle = createVehicle [_boxName,_pos,[],0,"CAN_COLLIDE"];
			_vehicle setDir floor(random 360);
			_vehicle allowDamage false;
			_vehicle enableRopeAttach false;
			private  _ItemsList = [selectRandom _group,[_mul,_srare,_trash],true] call LB_fnc_collectItems;
			private _popTabs = _poptab call LB_fn_calc_poptab;
			[_vehicle,_ItemsList,_popTabs,[]] call LB_fnc_addCargo;
			// log
			format["Spawn Static-box %1 %2",_boxName,_pos] call LB_fn_log;
			["LB_STBX#"+str _cnt,_pos,_C_markertype,_C_markercolor,0.7] call LB_fnc_marker;
		};
		_cnt = _cnt + 1;
	}forEach _C_staticbox;
};

//-------------------------------
// Spawn Iron-Miller
if(count _C_ironman > 0)then{
	call LB_fn_logline;
	_aicnt = 0;
	{
		_pos = _x#0;
		_spawn = _x#1;
		_ok = false;
		
		// random air-ports or military
		if(_pos isEqualTo [] && (count _locMilitary) > 0)then{
			private _mil = selectRandom _locMilitary;
			_locMilitary deleteAt (_locMilitary find _mil);
			_pos = [[[position _mil,_mil getVariable "LB_SIZE"]],[]] call BIS_fnc_randomPos;
		};

		if !(_pos isEqualTo [])then{
			_ok = [_pos,[]] call LB_fnc_isSafePos;
		};
		if(_ok)then{
			[_pos,_spawn,_C_banditSide] call LB_fn_spawnIronMiller;
			_aicnt = _aicnt + 1;
			["LB_IR#"+str _aicnt,_pos,_C_markertypeAItr,_C_markercolorAItr,0.7] call LB_fnc_marker;
			format["IronMiller %1/%2 %3 AIs %4",_aicnt,count _C_ironman,_spawn,_pos call LB_fn_2pos] call LB_fn_log;
		};
	}forEach _C_ironman;
};

//-------------------------------
// Put Custom Billboard
if(count _C_cbboards > 0)then{
	call LB_fn_logline;
	private _cnt = 0;
	{
		private _vehicle = createVehicle [_x#0,_x#1,[],0,"CAN_COLLIDE"];
		_vehicle setDir (_x#2);
		_vehicle allowDamage false;
		_vehicle enableSimulationGlobal false;
		_vehicle enableRopeAttach false;
		_vehicle setObjectTextureGlobal [0,_x#3];
		format["Put Custom obejct %1 %2 %3",_x#0,_x#1,_x#3] call LB_fn_log;
//		["LB_CB#"+str _cnt,_x#1,_C_markertypeST,_C_markercolorST,0.7] call LB_fnc_marker;
		_cnt = _cnt + 1;
	}forEach _C_cbboards;
};

//-------------------------------
// Text on Map-screen
if(count _C_maptext > 0)then{
	call LB_fn_logline;
	_C_maptext spawn{
		private _cnt = 0;
		{
			["LB_MAPTEXT#"+str _cnt,_x#0,_x#1,_x#3,1,_x#2,_x#4] call LB_fnc_marker;
			_cnt = _cnt + 1;
		}forEach _this;
	};
};

//-------------------------------
// Random Exile Obejct
// (Clean-water / ConcreteMixer / Locker / Trader)
private["_objs","_angle","_spawn_w","_spawn_l","_spawn_c","_spawn_t","_ok","_trsp"];
if(count _C_rndexileobj > 0)then{
	call LB_fn_logline;
	_trsp = [];
	_objs = _C_rndexileobj call ExileClient_util_array_shuffle;
	_spawn_w = _C_cleanwatercnt;
	_spawn_l = _C_lockercnt;
	_spawn_c = _C_concretemixcnt;
	_spawn_t = _C_tradercnt;
	if(_spawn_w < 0)then{_spawn_w = 99;};
	if(_spawn_l < 0)then{_spawn_l = 99;};
	if(_spawn_c < 0)then{_spawn_c = 99;};
	if(_spawn_t < 0)then{_spawn_t = 99;};
	_cnt = 0;
	{
		_ok = false;
		_className = selectRandom(_x select 0);
		_pos = _x select 1;
		_angle = _x select 2;
		// Clean water
		if(_spawn_w > 0 and _className isEqualTo "Land_WaterCooler_01_new_F")then{
			[_className,AGLToASL(_pos),_angle,0.7]call LB_fnc_putSimpleobj;
			_spawn_w = _spawn_w - 1;
			_ok = true;
		};
		// Locker(canot use simple obj.)
		if(_spawn_l > 0 and _className isEqualTo "Exile_Locker")then{
			_vehicle = createVehicle [_className,_pos,[],0,"CAN_COLLIDE"];
			_vehicle setDir _angle;
			_vehicle allowDamage false;
			_vehicle enableSimulationGlobal true;
			_spawn_l = _spawn_l - 1;
			_ok = true;
		};
		// Concrete Mixer(canot use simple obj.)
		if(_spawn_c > 0 and _className isEqualTo "Exile_ConcreteMixer")then{
			_vehicle = createVehicle [_className,_pos,[],0,"CAN_COLLIDE"];
			_vehicle setDir _angle;
			_vehicle allowDamage false;
			_vehicle enableSimulationGlobal true;
			_spawn_c = _spawn_c - 1;
			_ok = true;
		};
		// Trader
		if(_spawn_t > 0 and (_className find "Exile_Trader_") > -1)then{
			private ["_trader","_attach","_tpos"];
			_tpos = _pos getPos[0.4,_angle];
			//_attach = ["Land_HumanSkull_F",_tpos,_angle]call LB_fnc_putSimpleobj;
			_attach = createVehicle ["Land_HumanSkull_F",_pos,[],0,"CAN_COLLIDE"];
			_attach setDir (360-abs(_angle+180));
			
			// create trader
			_group = createGroup [_C_TraderSide,false];
			_group setCombatMode "BLUE";
			_group setVariable ["DMS_AllowFreezing",false,true];
			_group setVariable ["DMS_LockLocality",true];
			_group setVariable ["DMS_SpawnedGroup",false];
			_className createUnit [_pos,_group,"_trader=this;"];
			_trader reveal _attach;
			_attach disableCollisionWith _trader;
			_trader disableCollisionWith _attach;
			_trader attachTo [_attach, [(_pos#0)-(_tpos#0),(_pos#1)-(_tpos#1),-0.1]];
			//detach _trader;
			
			_trader setVariable ["BIS_enableRandomization", false];
			_trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
			_trader setVariable ["ExileAnimations", ["AmovPsitMstpSnonWnonDnon_smoking"]];
			_trader setVariable ["ExileTraderType", _className,true];
			_trader disableAI "ANIM";
			_trader disableAI "MOVE";
			_trader disableAI "FSM";
			_trader disableAI "AUTOTARGET";
			_trader disableAI "TARGET";
			_trader disableAI "CHECKVISIBLE";
			_trader allowDamage false;
			_trader addEventHandler ["HandleDamage",{0}];
			_trader addEventHandler ["Dammaged","(_this#0) setDamage 0"];
            removeGoggles _trader;
			removeAllItemsWithMagazines _trader;
			removeHeadgear _trader;
			removeUniform _trader;
			removeVest _trader;
			removeBackpackGlobal _trader;
			_trader addWeapon selectRandom["Exile_Weapon_AK47","srifle_LRR_camo_F","Exile_Weapon_LeeEnfield","Exile_Weapon_SVD"];
            _trader forceAddUniform "Exile_Uniform_BambiOverall";
			_trader addHeadgear selectRandom["H_TurbanO_blk","H_Booniehat_grn","H_Hat_checker","Exile_Headgear_SantaHat","Exile_Headgear_SafetyHelmet"];
            _trader addVest selectRandom["V_Press_F","V_TacVest_blk_POLICE","V_TacVestIR_blk","V_TacVest_camo"];
            _trader addBackpack selectRandom["B_Bergen_tna_F","B_Carryall_oli","B_Carryall_ghex_F"];
            _trader linkItem "Exile_Headgear_GasMask";
			_trader switchMove "AmovPsitMstpSnonWnonDnon_smoking";
			_trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
			_trader addMPEventHandler ["MPHit","params['_unit','_caused'];
				if(isServer)then{
					_caused = [_caused] call LB_fn_getPlayerObj;
					if!(isNull _caused)then{
						[_caused,0.95] call LB_fn_changePlayerScore;
						[_caused, 'toastRequest', ['ErrorTitleOnly',['Attacked Trader! Lost 5% Respects!']]] call ExileServer_system_network_send_to;
					};
				};"];
			_spawn_t = _spawn_t - 1;
			_ok = true;
		};
		_cnt = _cnt + 1;
		if(_ok)then{
			format["put Exile-Object %1 %2",_className,_pos call LB_fn_2pos] call LB_fn_log;
			[format["LB_REOBJ%1",_cnt],[_pos#0,_pos#1],"hd_unknown","",0.3,""] call LB_fnc_marker;
		}else{
			if(random 1 > 0.7)then{
				// so bad..
				//["BloodPool_01_Large_New_F",AGLToASL(_pos)] call LB_fnc_putSimpleobj;
				["Land_HumanSkull_F",AGLToASL(_pos),_angle,0.1] call LB_fnc_putSimpleobj;
				[format["LB_REOBJ%1",_cnt],[_pos#0,_pos#1],"hd_unknown","",0.3,""] call LB_fnc_marker;
			};
		};
		// if u wont icon > "ExileConcreteMixerZoneIcon"
	}forEach _objs;
};

//-------------------------------
// Break down Fuel Stations
if(_C_bfuel > 0)then{
	call LB_fn_logline;
	_objs = nearestTerrainObjects [_mapCenter,["Fuelstation"], _maxDistance,false];
	format["FuelStations Total %1 (%2)",count _objs,_C_bfuel] call LB_fn_log;
	_cnt = 1;
	{
		if(random 1 < _C_bfuel)then{
			_x enableSimulationGlobal false;
			_pos=getPos _x;
			if(_C_bfuelmk)then{
				[format["LB_BFUEL%1",_cnt],[_pos#0,_pos#1],"hd_destroy","",0.7,""] call LB_fnc_marker;
			};
			format["Break down:%1 %2",_cnt,_pos call LB_fn_2pos] call LB_fn_log;
			_cnt = _cnt + 1;
		};
	}foreach _objs;
};

//-------------------------------
// Traveling Trader
LB_SpawnTravelingTrader={
	params ["_pos","_className","_group","_invincible","_messages"];
	_pos = [_pos select 0,_pos select 1,0];
	_trader = _group createUnit [_className,_pos,[],0,"CAN_COLLIDE"];
	_trader setVariable ["BIS_enableRandomization",false];
	_trader setVariable ["BIS_fnc_animalBehaviour_disable",true];
	_trader setVariable ["ExileTraderType","",true];
	_trader setVariable ["ExileMoney",floor(random 10),true];
	_trader setVariable ["LB_TT_OBJ",[]];
	_trader setVariable ["LB_TT_Trader",_className];
	_trader setVariable ["LB_TT",[_pos,_group]];
	_trader setDamage 0;
	[_trader] joinSilent _group;
	_trader setName "Traveling Trader";
	_trader disableAI "AUTOTARGET";
	_trader disableAI "SUPPRESSION";
	_trader disableAI "CHECKVISIBLE";
	if(_invincible)then{
		_trader allowDamage false;
		_trader addEventHandler ["HandleDamage",{0}];
		_trader addEventHandler ["Dammaged","(_this#0) setDamage 0"];
	};
	// gears
	removeGoggles _trader;
	removeAllItemsWithMagazines _trader;
	removeHeadgear _trader;
	removeUniform _trader;
	removeVest _trader;
	removeBackpackGlobal _trader;
	_trader addWeapon selectRandom["Exile_Weapon_AK47","srifle_LRR_camo_F","Exile_Weapon_LeeEnfield","Exile_Weapon_SVD"];
	_trader forceAddUniform "Exile_Uniform_BambiOverall";
	_trader addHeadgear selectRandom["H_TurbanO_blk","H_Booniehat_grn","H_Hat_checker","Exile_Headgear_SantaHat","Exile_Headgear_SafetyHelmet"];
	_trader addVest selectRandom["V_Press_F","V_TacVest_blk_POLICE","V_TacVestIR_blk","V_TacVest_camo"];
	_trader addBackpack selectRandom["B_Bergen_tna_F","B_Bergen_hex_F","B_Bergen_dgtl_F","B_Bergen_mcamo_F"];
	_trader linkItem "Exile_Headgear_GasMask";
	// events
	_trader addMPEventHandler ["MPHit","params['_unit','_caused'];
		if (isServer) then {
			_caused = [_caused] call LB_fn_getPlayerObj;
			if!(isNull _caused)then{
				[_caused,0.95] call LB_fn_changePlayerScore;
				[_caused, 'toastRequest', ['ErrorTitleOnly',['Attacked Trader! Lost 5% Respects!']]] call ExileServer_system_network_send_to;
			};
		};"];
	_trader addMPEventHandler ["MPKilled","params['_unit','_killer'];
		if (isServer) then {
			_killer = [_killer] call LB_fn_getPlayerObj;
			if!(isNull _killer)then{
				[_killer,0.7] call LB_fn_changePlayerScore;
				[_killer, 'toastRequest', ['ErrorTitleOnly',['Dammit! Trader KILLED!! Lost 30% Respects!!']]] call ExileServer_system_network_send_to;
				'Server : Fu*king! '+(name _killer)+' killed Trader.' remoteExecCall ['systemChat',-2];
			};
			_unit setVariable ['ExileTraderType','',true];
			_unit setVariable ['ExileDiedAt',time];
			{_unit removeWeaponGlobal _x;} forEach (weapons _unit);
			_unit setUnitLoadout 'Exile_Unit_Player';
			{deleteVehicle _x;}forEach (_unit getVariable ['LB_TT_OBJ',[]]);
			(_unit getVariable 'LB_TT') params ['_pos','_group'];
			(_group getVariable 'LB_TT_CFG') params ['_type','_inci','_mes'];
			[_pos,(selectRandom _type),_group,_inci,_mes] call LB_SpawnTravelingTrader;
		};"];
	//walk&sitdown&radio
	[_trader,_messages]spawn{
		params["_trader","_messages"];
		private["_cnt","_units","_player","_objs","_sound","_sitdown"];
		_sitdown = false;
		_sound = 0;
		while{alive _trader}do{
			// Radio message
			if!(_sitdown)then{
				_sound = _sound + 1;
				if(_sound > 12)then{// 1min
					{
						_sound = 0;
						_player = _x;
						if(isPlayer _player)then{
							// Assinged radio?
							if((assignedItems _player) find "ItemRadio" >= 0)then{
								selectRandom["RadioAmbient2","RadioAmbient3","RadioAmbient6","RadioAmbient8"] remoteExecCall ["playSound",_player];
							};
						};
					}forEach (allPlayers select {(_trader distance2D _x) < 500});
				};
			};
			// Check around
			_units = (getPos _trader) nearEntities [['Man'],7];// 7m
			_cnt = count _units;
			if(_cnt > 1)then{
				_player = _units select 1;
				if((isPlayer _player) and (currentMuzzle _player isEqualTo ""))then{
					if!(_sitdown)then{
						_sitdown = true;
						_trader disableAI "MOVE";
						_trader disableAI "CHECKVISIBLE";
						uiSleep 0.5;
						_trader setVariable ["ExileTraderType",(_trader getVariable "LB_TT_Trader"),true];
						_trader setDir (_trader getDir _player);
						_trader playActionNow "SitDown";
						// around objects
						_objs = [];
						_objs pushBack ([_trader,selectRandom["Chemlight_blue","Chemlight_green","Chemlight_red"],0,1,true] call LB_fn_putAroundObject);
						_objs pushBack ([_trader,"Land_Sleeping_bag_F",0,0,true] call LB_fn_putAroundObject);
						_objs pushBack ([_trader,"Exile_Cosmetic_PopTabs",25,1] call LB_fn_putAroundObject);
						_objs pushBack ([_trader,"Exile_Cosmetic_PopTabs",35,0.8] call LB_fn_putAroundObject);
						_objs pushBack ([_trader,"Campfire_burning_F",-45,1.7,true] call LB_fn_putAroundObject);
						_trader setVariable ['LB_TT_OBJ',_objs];
						// messages
						[_player,"toastRequest",["SuccessTitleOnly",[(selectRandom _messages)]]] call ExileServer_system_network_send_to;
					};
				};
			}else{
				if(_sitdown)then{
					_sitdown = false;
					_trader enableAI "MOVE";
					_trader enableAI "CHECKVISIBLE";
					{deleteVehicle _x;}forEach (_trader getVariable ['LB_TT_OBJ',[]]);
					_trader setVariable ['LB_TT_OBJ',[]];
					_trader setVariable ["ExileTraderType","",true];
				};
			};
			uiSleep 5;
		};
	};
_trader};
private _route = [];
if(_C_ttraders > 0)then{
	call LB_fn_logline;
	_cnt = 1;
	for[{_i=0},{_i<_C_ttraders},{_i=_i+1}]do{
		_className = selectRandom _C_tttype;
		_group = createGroup [_C_TraderSide,false];
		_group setCombatMode "BLUE";
		_group setBehaviour "CARELESS";
		_group allowFleeing 0;
		_group setVariable ["DMS_AllowFreezing",false,true];
		_group setVariable ["DMS_LockLocality",true];
		_group setVariable ["DMS_SpawnedGroup",false];
		_group setVariable ["LB_TT_CFG",[_C_tttype,_C_ttinci,_C_ttmessages]];
		
		_route = selectRandom _C_ttwp;
		_pos = _route select (_i % count(_route));
		format["Traveling Trader Spawned:%1 %2 %3",_cnt,_className,_pos call LB_fn_2pos] call LB_fn_log;
		[_pos,_className,_group,_C_ttinci,_C_ttmessages] call LB_SpawnTravelingTrader;
		// waypoints
		while {(count (waypoints _group)) > 0} do{
			deleteWaypoint ((waypoints _group) select 0);
		};
		for[{_j=0},{_j< count _route},{_j=_j+1}]do{
			_wp = _group addWaypoint [_route select ((_i+_j) % count(_route)),0];
			format["wp:%1",_route select ((_i+_j) % count(_route))] call LB_fn_log;
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "CARELESS";
			_wp setWaypointspeed "LIMITED"; 
			_wp setWaypointCompletionRadius 5;
		};
		_wp = _group addWaypoint [_pos,0];
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointspeed "LIMITED"; 
		_wp setWaypointCompletionRadius 5;
		_wp setWaypointType "CYCLE";
		_cnt = _cnt + 1;
	}; 
};

//-------------------------------
// Broodcast messages
if(count LB_Bcmessage > 0)then{
	missionNamespace setVariable ["LB_BCMS_CNT",0];
	[LB_BcmessageTime,{
		_cnt = missionNamespace getVariable "LB_BCMS_CNT";
		("Server : " + (LB_Bcmessage select _cnt)) remoteExecCall ["systemChat",-2];
		_cnt = _cnt + 1;
		if(_cnt >= count LB_Bcmessage)then{_cnt = 0};
		missionNamespace setVariable ["LB_BCMS_CNT",_cnt];
	},[LB_Bcmessage],true] call ExileServer_system_thread_addTask;
};

//-------------------------------
// Server status reporter
if(LB_StatusReporter > 0)then{
	"Status Reporter Started (1min)" call LB_fn_log;
	[LB_StatusReporter*60,{
		private _pl = count(allPlayers - entities "HeadlessClient_F");
		private _un = count(allUnits);
		private _dead = count(allDeadMen);
		private _gr = count(allGroups);
		diag_log format["[LOOTBOX]:: ** Players:%1 Units:%2 Dead:%3 Groups:%4 Time:%5h FPS:%6(av:%7) Started:%8min",_pl,_un,_dead,_gr,daytime toFixed 2,floor(diag_fpsMin),floor(diag_fps),(time/60)toFixed 2];
	},[],true] call ExileServer_system_thread_addTask;
};
"Finished! Have fun! :)" call LB_fn_log;
// going bed  orz
if (!isServer)exitWith{};
//if (!hereEarth)exitWith{};
/*-------------------------------
	"a3_exile_lootbox"
	Arma3:Exile-Serever Mod addon
	for Exile-MOD communities,Survivors
	putBoxes.sqf(´・ω・｀)ノ
-------------------------------*/
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
private["_C_blacklist","_C_bl_item","_C_bl_bandit","_C_bl_vehicle","_C_staticbox","_C_cbboards"];
_C_blacklist = LB_Blacklist;
_C_bl_item = LB_BLItembox;
_C_bl_bandit = LB_BLBandit;
_C_bl_vehicle = LB_BLVehicle;
_C_staticbox = LB_StaticBox;
_C_cbboards = LB_CBillboards;
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
//　Kick ass!
["Starting Loot boxes addon"] call LB_fnc_log;
uisleep LB_PendingTime;
private["_middle","_mapCenter","_maxDistance","_locCapital","_locVillage","_locMilitaryPos","_aiNames"];
_middle = floor(worldSize/2);
_mapCenter = [_middle,_middle,0];
_maxDistance = _middle * 2;
_locCapital = [];
_locVillage = [];
_locMilitaryPos = [];
_aiNames = ["Goemon","Nezumi","Tengu","Karaage","Takoyaki","Zunda","Horumon","Ikageso","Uiroh","Monja","Tekkamaki"];
// petit funcs.
fn_calc_poptab={
	floor(_this*0.3+random(_this*0.7))
};
fn_isMilitary={
	private _name=toLower _this;if((_name find "airport")>-1 or(_name find "airfield")>-1 or(_name find "military")>-1)exitWith{true};
false};
fn_addWaypoint={
	private ["_wp"];
	_wp = (_this select 0) addWaypoint [_this select 1, 5];
	_wp setWaypointBehaviour selectRandom["AWARE","COMBAT","STEALTH"];
	_wp setWaypointCombatMode "RED";
	_wp setWaypointCompletionRadius 5;
	_wp setWaypointType (_this select 2);
_wp};
fn_findEmptyAroundField={
	private ["_pos","_radius","_size","_spawned","_i","_ok","_ret"];
	_pos = param[0];
	_radius = param[1,50];
	_size = param[2,5];
	_spawned = param[3,nil];
	_ret = [];
	_ok=false;
	for [{_i=0},{_i<5 && !_ok},{_i=_i+1}] do{
		_pos = [_pos,0,_radius,_size,0,0.3,0,_spawned] call BIS_fnc_findSafePos;
		if(count _pos == 2)then{
			if !(isOnRoad _pos)then{
				if(count(_pos nearRoads 10) < 1)then{
					_ok=true;_ret=_pos;
				};
			};
		};
	};
_ret};// [x,y]

//-------------------------------
// Create new locations
{
	if !((_x select 0) isEqualTo "")then{
		private _loc = createLocation [_x select 0,_x select 2,_x select 3,_x select 3];
		_loc setPosition (_x select 2);
		_loc setName (_x select 1);
		_loc setText (_x select 1);
		_loc setSize [200,200];
		[format["create new location : %1:%2 %3",_x select 0,_x select 1,_x select 2]] call LB_fnc_log;
	};
}foreach _C_newloc;
//-------------------------------
// add blacklist
private _spawnedPositions = [];{_spawnedPositions pushBack _x;}foreach _C_blacklist;
//-------------------------------
//　all locations loop
private["_C_areaSize","_C_boxCount","_C_multiple","_C_intoBuildding","_C_RateSRare","_C_maxPoptab","_C_rateTrash","_C_banditAIs","_C_putMine","_C_putWiretrap","_C_strangeCount","_C_flamingCount","_C_firePlaces","_C_vehiclecount","_C_vehicletype","_C_lootGroups"];
private["_locations","_locItems","_locCount","_icnt","_noHouse","_bInDoor","_boxName","_pos","_vehicle","_ItemsList","_popTabs"];
private["_posMine","_mine","_mcnt"];
private["_temppos","_locationName","_locationType","_locationsize","_posBase","_buildings","_buildingCnt","_lconfig"];
private["_aicnt","_useLaunchers","_bclass","_group","_cgear","_unit","_wppos","_target","_road"];
private["_i","_j","_k","_cnt","_posStr"];
private["_vicnt","_ok","_bike","_className","_type","_size","_rndpos","_parts","_hitpointsData","_damege"];
private["_strenge","_className","_size","_flat","_siml","_temp","_tpos","_vectorDirUp","_model"];
private["_flcnt","_Fire"];

_locations = (nearestLocations[_mapCenter,_C_loc,_maxDistance]);
_locItems = count _locations;
_locCount = 0;
{
	// Wait for system busy
	if(LB_WaitSysBusy)then{waitUntil{sleep 1;diag_fps > 40};};

	_temppos = position _x;
	_locationName = text _x;
	_locationType = type _x;
	_locationsize = (size _x) select 0;
	_locCount = _locCount + 1;
	_posBase = [_temppos select 0,_temppos select 1,_temppos select 2];
	if(_locationType isEqualTo "NameCityCapital")then{
		_locCapital pushBack _x;
	};
	if(_locationType isEqualTo "NameVillage")then{
		_locVillage pushBack _x;
	};
	if(_locationName+_locationType call fn_isMilitary)then{
		_locMilitaryPos pushBack _temppos;
	};

	// Adjust base position
	_posBase = [[[_posBase,_locationsize / 2]],[]] call BIS_fnc_randomPos;
	_buildings = _posBase nearObjects ["house",_locationsize / 2];
	if(count _buildings >= 5)then{
		_posBase = getPos(selectRandom _buildings);
	};

	// Lookup location configs
	_lconfig = nil;
	{
		if(_x select 0 isEqualTo _locationName)exitWith{
			_lconfig = _x select 1;
		};
		if(_x select 0 isEqualTo _locationType)exitWith{
			_lconfig = _x select 1;
		};
	}foreach _C_locLoot;
	if(isNil {_lconfig})then{
		[format["** Nothing location config:(%1/%2) %3:%4",_locCount,_locItems,_locationType,_locationName]] call LB_fnc_log;
	}
	else{
		// Load location config
		_C_areaSize = _lconfig select 0;
		_C_boxCount = _lconfig select 1;
		_C_multiple = _lconfig select 2;
		_C_intoBuildding = _lconfig select 3;
		_C_RateSRare = _lconfig select 4;
		_C_maxPoptab = _lconfig select 5;
		_C_rateTrash = _lconfig select 6;
		_C_banditAIs = _lconfig select 7;
		_C_putMine = _lconfig select 8;
		_C_putWiretrap = _lconfig select 9;
		_C_strangeCount = _lconfig select 10;
		_C_flamingCount = _lconfig select 11;
		_C_firePlaces = _lconfig select 12;
		_C_vehiclecount = _lconfig select 13;
		_C_vehicletype = _lconfig select 14;
		_C_lootGroups = _lconfig select 15;

		// Adjust radius
		if(_C_areaSize == 0)then{
			_C_areaSize = (size _x) select 1;
			if((size _x) select 0 > (size _x) select 1)then{
				_C_areaSize = (size _x) select 0;
			};
		};
		// Find near buildings
		_buildings = [_posBase,_C_areaSize,_C_banditSniper] call LB_fnc_findBuildings;
		_buildingCnt = count(_buildings select 0);
		// Log
		[format["** Found!(%1/%2) %3:%4 %5 house:%6 radius:%7 box:%8",_locCount,_locItems,_locationType,_locationName,_posBase,_buildingCnt,_C_areaSize,_C_boxCount]] call LB_fnc_log;
		// random open doors
		if(_buildingCnt > 0)then{
			{
				if !(isNil "_x")then{
					if(random 1 > 0.8)then{this = _x;[_x,1,1] call BIS_fnc_Door;};
				};
			}forEach (_buildings select 0);
		};
		//-------------------------------
		// "loot boxes" loop!
		_icnt = _C_boxCount;
		for [{_j=0},{_j<20 && _icnt>0 && _buildingCnt > 0},{_j=_j+1}] do{
			_building = selectRandom (_buildings select 0);
			_ok = [getPos _building,_spawnedPositions] call LB_fnc_isSafePos;
			
			if(_ok and not(isNil "_building"))then{
				// decide place(near building)
				_noHouse = false;if(_buildingCnt < _icnt * 2)then{_noHouse = true;};
				_bInDoor = true;
				_boxName = "";
				_pos = [];
				if(random 1 < _C_intoBuildding and (not _noHouse))then{
					// Indoor
					_bpos = [_building] call LB_fnc_getBuildingPos;
					_pos = ASLToATL(AGLToASL(_bpos select 3));
					_boxName = selectRandom _C_boxobjclass_in;
				}else{
					// Outdoor(random "on field"or"near building")
					if(_noHouse)then{
						_pos = [_posBase,1,_C_areaSize,2,0,0.2,0,_spawnedPositions] call BIS_fnc_findSafePos;
					}
					else{
						_pos = [getPos _building,1,10,2,0,0.2,0,_spawnedPositions] call BIS_fnc_findSafePos;
					};
					if(count _pos isEqualTo 2 and not(isOnRoad _pos))then{
						_boxName = selectRandom _C_boxobjclass_out;
						_bInDoor = false;
					};
				};

				if !(_boxName isEqualTo "")then{
					// Put box
					_vehicle = createVehicle [_boxName,_pos,[],0,"CAN_COLLIDE"];
					_vehicle setDir (random 360);
					_vehicle allowDamage false;
					_vehicle enableRopeAttach false;
					_ItemsList = [selectRandom _C_lootGroups,[_C_multiple,_C_RateSRare,_C_rateTrash],true] call LB_fnc_collectItems;
					_popTabs = _C_maxPoptab call fn_calc_poptab;
					[_vehicle,_ItemsList,_popTabs,[]] call LB_fnc_addCargo;
					// Log
					[format["put %1/%2 %3 House:%4 %5",(_C_boxCount - _icnt + 1),_C_boxCount,_pos,_bInDoor,_boxName]] call LB_fnc_log;
					["LB_item#"+_locationName+str _icnt,_pos,_C_markertype,_C_markercolor,0.7] call LB_fnc_marker;
					// Add blacklist
					_spawnedPositions pushBack [[_pos select 0,_pos select 1,0],_C_bl_item];

					// Trap!
					if(random 1 < _C_putWiretrap)then{
						if !(_bInDoor)then{
							_pos = [_pos select 0,_pos select 1];
							_posMine = [_pos,1,3,1,0,0.2,0,[]] call BIS_fnc_findSafePos;
							if !(count _posMine isEqualTo 3)then{
								_mine = createMine [selectRandom _C_nearMine,_posMine,[],1];
								_C_banditSide revealMine _mine;
								["LB_Trap#"+_locationName+str _icnt,getPos _mine,_C_markertypeMine,_C_markercolorMine,0.7] call LB_fnc_marker;
								[format["trap: %1",getPos _mine]] call LB_fnc_log;
							};
						};
					};
					_icnt = _icnt - 1;
				};
			}
		};
		if(_icnt > 0)then{
			[format["%1/%2 canot found places",_C_boxCount - _icnt,_C_boxCount]] call LB_fnc_log;
		};
		//-------------------------------
		// Trap!(on road)
		_mcnt = _C_putMine;
		for [{_j=0},{_j<10 && _mcnt>0},{_j=_j+1}] do{
			_pos = [[[_posBase, _C_areaSize]],[]] call BIS_fnc_randomPos;
			_posMine = [_pos, _C_areaSize, []] call BIS_fnc_nearestRoad;
			_ok = [getPos _posMine,_spawnedPositions] call LB_fnc_isSafePos;
			if(_ok and !(isNull _posMine))then{
				_mine = createMine [selectRandom _C_roadMine, getPos _posMine , [], 0];
				_C_banditSide revealMine _mine;
				["LB_Mine#"+_locationName+str _j,getPos _mine,_C_markertypeMine,_C_markercolorMine,0.7] call LB_fnc_marker;
				[format["mine %1/%2 %3",_C_putMine - _mcnt + 1,_C_putMine,getPos _mine]] call LB_fnc_log;
				_spawnedPositions pushBack [[getPos _mine select 0,getPos _mine select 1,0],10];
				_mcnt = _mcnt - 1;
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
				if(_type isEqualTo (_x select 0))then{
					_className = selectRandom (_x select 1);
				};
			}foreach _C_vlist;
			if(_className isEqualTo "")then{
				[format["canot found vihecle type:%1",_type]] call LB_fnc_log;
			}else{
				// object size
				_size = 4;
				if(toLower(_type) find "air" >= 0 or toLower(_type) find "tank" >= 0 or toLower(_type) find "army" >= 0)then{
					_size = 20;
				};
				if((toLower(_className) find "_bike_") >= 0)then{
					_bike = true;
					_size = 2;
				};

				// find position
				_pos = [[[_posBase, _C_areaSize]],[]] call BIS_fnc_randomPos;
				_rndpos = false;
				if !(_buildingCnt < _vicnt * 2)then{
					// Find near buildings
					_building = nearestBuilding _pos;
					_pos = (getPos _building) findEmptyPosition [_size,_size * 5,_className];
				}else{
					// Put random on field
					_pos = _pos findEmptyPosition [_size,_size * 5,_className];
					_rndpos = true;
				};
				if(count(_pos) > 0)then{
					if !(isOnRoad _pos)then{
						_ok = [_pos,_spawnedPositions] call LB_fnc_isSafePos;
					};
				};
				if(_ok)then{
					_vehicle = [_className, [_pos select 0,_pos select 1, 0],random 360,true] call ExileServer_object_vehicle_createNonPersistentVehicle;
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
					_popTabs = _C_vpoptab call fn_calc_poptab;
					[_vehicle,_items,_popTabs,[]] call LB_fnc_addCargo;
					_vehicle addEventHandler ["Engine","_this call LB_eh_engine"];
					_vehicle setVariable ["LB_Attach",selectRandom["MiniGrenade","SmokeShell","SmokeShellOrange","SmokeShellRed"]];
					_vehicle setVariable ["LB_Started",false];

					_vicnt = _vicnt - 1;
					["LB_Vehicle#"+_locationName+str _vicnt,getPos _vehicle,_C_markertypeVI,_C_markercolorVI,0.7] call LB_fnc_marker;
					[format["Vehicle %1/%2 %3 on field:%4 %5",_C_vehiclecount - _vicnt,_C_vehiclecount,getPos _vehicle,_rndpos,_className]] call LB_fnc_log;
					_spawnedPositions pushBack [[getPos _vehicle select 0,getPos _vehicle select 1,0],_C_bl_vehicle];
				};
			};
		};
		if(_vicnt > 0)then{
			[format["Vehicle canot found places, last %1(%2)",_vicnt,_C_vehiclecount]] call LB_fnc_log;
		};
		//-------------------------------
		// Spawn bandit AIs
		if(_C_banditAIs > 0)then{
			_aicnt = _C_banditAIs;
			_useLaunchers = DMS_ai_use_launchers;
			for [{_j=0},{_j<10 && _aicnt>0},{_j=_j+1}] do{
				_pos = _posBase;
				_bclass = _C_banditClass;
				if !(_buildingCnt < _aicnt * 2)then{
					// in building
					_building = [];
					if(_locationName+_locationType call fn_isMilitary)then{
						// all
						_building = selectRandom (_buildings select 0);
					}else{
						// choice higher
						if((_buildings select 4) < 10 or count (_buildings select 1) < _C_banditAIs)then{
							_building = selectRandom (_buildings select 0);
						}else{
							_building = selectRandom (_buildings select 1);
							if(isNil"_building")then{
								_building = selectRandom (_buildings select 0);
							};
						};
					};
					// Sniper?
					if (random 1 > 0.9 and not(isNull(_buildings select 3)))then
					{
						_building = _buildings select 3;
						_bclass = "sniper";
					};
					
					// get nearest road position
					_bpos = [_building] call LB_fnc_getBuildingPos;
					_pos = _bpos select 2;
					if(count (_bpos select 6) isEqualTo 3)then{
						_pos = ASLToATL(AGLToASL(_bpos select 6));
					};
					if(_bclass isEqualTo "sniper")then{
						_pos = ASLToATL(AGLToASL(_bpos select 4));
					};
				}else{
					// Random on field
					_pos = [_posBase,1,_C_areaSize,3,0,0.2,0,_spawnedPositions] call BIS_fnc_findSafePos;
				};
				_ok = [_pos,_spawnedPositions] call LB_fnc_isSafePos;
				if(_ok)then{
					_group = createGroup [_C_banditSide,true];
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
					_cgear = "" call LB_fnc_selectAIGear;
					_unit = [_group,_pos,_bclass,_C_banditDifficulty,"bandit","soldier",_cgear] call DMS_fnc_SpawnAISoldier;
					uisleep 0.1;
					_items = [selectRandom _C_banditItemgrps,_C_banditItemcfg,false] call LB_fnc_collectItems;
					{
						[_unit,_x] call ExileClient_util_playerCargo_add;
					}forEach _items;
					_unit setVariable["ExileMoney",_C_banditmaxpoptab call fn_calc_poptab,true];
					_unit setName (selectRandom _aiNames);
					_unit allowFleeing (random 0.3);
					_unit allowDamage true;
					_unit setDamage 0;
					_unit enableAI "AUTOTARGET";
					_unit enableAI "TARGET";
					_unit enableAI "MOVE";
					reloadEnabled _unit;
					if(needReload _unit == 1)then{reload _unit};
					_unit addEventHandler ["Fired","_this call LB_eh_Fired"];
					_unit enableSimulationGlobal false;		// freeze!!

					_aicnt = _aicnt - 1;
					["LB_AI#"+_locationName+str _aicnt,_pos,_C_markertypeAI,_C_markercolorAI,0.7] call LB_fnc_marker;
					[format["AI %1/%2 %3 %4",_C_banditAIs-_aicnt,_C_banditAIs,_bclass,_pos]] call LB_fnc_log;
					_spawnedPositions pushBack [[_pos select 0,_pos select 1,0],_C_bl_bandit];

					if(random 1 >= _C_banditmove)then{
						_unit disableAI "PATH";
						["wp : freeze"] call LB_fnc_log;
					}else{
						// waypoint
						while{(count (waypoints _group)) > 0}do{
							deleteWaypoint ((waypoints _group) select 0);
						};

						_wppos = _pos;
						_wp = nil;
						_cnt = 0;
						// waypoint:to Vehicle
						_target = nearestObjects [_wppos,["Car"],_C_areaSize];
						if(count _target > 1)then{	// 2cars
							for [{_k=0},{_k<2},{_k=_k+1}] do{
								_wppos = getPos(selectRandom _target);
								if([_wppos,[]] call LB_fnc_isSafePos)then{
									_wp = [_group,_wppos,"MOVE"] call fn_addWaypoint;
									_cnt = _cnt + 1;
									[("LB_AI#"+_locationName+str _aicnt +"w"+str _cnt),_wppos,"waypoint",_C_markercolorAI,0.7] call LB_fnc_marker;
									[format["wp %1 %2 (vehicle)",_cnt,_wppos]] call LB_fnc_log;
								};
							};
						};
						// waypoint:to Road
						_road = [_wppos, _C_areaSize, []] call BIS_fnc_nearestRoad;
						if !(isNull _road)then{
							_wppos = getPos(_road);
							if([_wppos,[]] call LB_fnc_isSafePos)then{
								_wp = [_group,_wppos,"MOVE"] call fn_addWaypoint;
								_cnt = _cnt + 1;
								[("LB_AI#"+_locationName+str _aicnt +"w"+str _cnt),_wppos,"waypoint",_C_markercolorAI,0.7] call LB_fnc_marker;
								[format["wp %1 %2 (road)",_cnt,_wppos]] call LB_fnc_log;
							};
						};
						// waypoint:fuel
						_target = nearestTerrainObjects [_wppos,["Fuelstation"],_C_areaSize];
						if(count _target > 0)then{
							_wppos = getPos(selectRandom _target);
							if([_wppos,[]] call LB_fnc_isSafePos)then{
								_wp = [_group,_wppos,"MOVE"] call fn_addWaypoint;
								_cnt = _cnt + 1;
								[("LB_AI#"+_locationName+str _aicnt +"w"+str _cnt),_wppos,"waypoint",_C_markercolorAI,0.7] call LB_fnc_marker;
								[format["wp %1 %2 (fuel)",_cnt,_wppos]] call LB_fnc_log;
							};
						};
						// waypoint:if no-points(location adjusted point)
						if (_cnt < 2)then{
							_wppos = _posBase;
							_wp = [_group,_wppos,"MOVE"] call fn_addWaypoint;
							_cnt = _cnt + 1;
							[("LB_AI#"+_locationName+str _aicnt +"w"+str _cnt),_wppos,"waypoint",_C_markercolorAI,0.7] call LB_fnc_marker;
							[format["wp %1 %2 (base pos.)",_cnt,_wppos]] call LB_fnc_log;
						};
						// waypoint:return
						if (!isNil "_wp")then{
							_wp = [_group,_pos,"CYCLE"] call fn_addWaypoint;
							_cnt = _cnt + 1;
							[format["wp %1 %2 (cycle)",_cnt,_pos]] call LB_fnc_log;
						};
					};
				};
			};
			if(_aicnt > 0)then{
				[format["AI canot found places, last %1(%2)",_aicnt,_C_banditAIs]] call LB_fnc_log;
			};
			DMS_ai_use_launchers = _useLaunchers;
		};
		//-------------------------------
		// Fire places
		for "_j" from 1 to _C_firePlaces do{
			_className = selectRandom _C_fireplaceobj;
			_pos = [[[_posBase,_C_areaSize]],[]] call BIS_fnc_randomPos;
			_posStr = getPos(nearestBuilding _pos);
			_pos = [_posStr,150,2,_spawnedPositions]call fn_findEmptyAroundField;
			if!(_pos isEqualTo [])then{
				_vehicle = createVehicle [_className,_pos,[],0,"CAN_COLLIDE"];
				_vehicle setDir (random 360);
				_vehicle allowDamage false;
				_vehicle enableSimulationGlobal true;
				_vehicle enableRopeAttach false;
				_spawnedPositions pushBack [[_pos select 0,_pos select 1,0],2];
				["LB_FP#"+_locationName+str _j,_pos,_C_markertypeST,_C_markercolorST,0.7] call LB_fnc_marker;
			};
		};
		//-------------------------------
		// Strange object
		for "_j" from 1 to _C_strangeCount do{
			_strenge = selectRandom _C_strangeobj;
			_className = _strenge select 0;
			_size = _strenge select 1;
			_flat = _strenge select 2;
			_siml = _strenge select 3;

			_ok = false;
			_pos = [[[_posBase,_C_areaSize]],[]] call BIS_fnc_randomPos;
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
				_pos = [_posStr,300,_size,_spawnedPositions]call fn_findEmptyAroundField;
				if!(_pos isEqualTo [])then{_ok = true;};
			};
			if(_ok)then{
				if(_siml)then{
					_vehicle = createVehicle [_className,_pos,[],0,"CAN_COLLIDE"];
					_vehicle setDir (random 360);
					_vehicle allowDamage false;
					_vehicle enableSimulationGlobal _siml;
					_vehicle enableRopeAttach false;
				}else{
					[_className,_pos] call LB_fnc_putSimpleobj;
				};
				_spawnedPositions pushBack [[_pos select 0,_pos select 1,0],_size];
				["LB_ST#"+_locationName+str _j,_pos,_C_markertypeST,_C_markercolorST,0.7] call LB_fnc_marker;
			};
		};
		//-------------------------------
		// Flaming object
		_flcnt = _C_flamingCount;
		for [{_j=0},{_j<10 && _flcnt>0},{_j=_j+1}] do{
			_pos = [[[_posBase, _C_areaSize]],[]] call BIS_fnc_randomPos;
			_posStr = getPos(nearestBuilding _pos);
			_pos = [_posStr,200,5,_spawnedPositions]call fn_findEmptyAroundField;
			if!(_pos isEqualTo [])then{
				[selectRandom _C_flamingobj,_pos] call LB_fnc_putSimpleobj;
				// flaming
				_Fire = createVehicle ["test_EmptyObjectForFireBig",_pos,[],0,"CAN_COLLIDE"];
				["LB_FL#"+_locationName+str _flcnt,_pos,_C_markertypeST,_C_markercolorST,0.7] call LB_fnc_marker;
				_flcnt = _flcnt - 1;
				_spawnedPositions pushBack [[_pos select 0,_pos select 1,0],5];
			};
		};
	};
}forEach _locations;
//-------------------------------
// Static loot-boxes
_cnt = 0;
{
	_pos = _x select 0;
	_group = _x select 1;
	_boxName = selectRandom _C_boxobjclass_out;
	_vehicle = createVehicle [_boxName,_pos,[],0,"CAN_COLLIDE"];
	_vehicle setDir (random 360);
	_vehicle allowDamage false;
	_vehicle enableRopeAttach false;
	_ItemsList = [selectRandom _group,[_x select 2,_x select 3,_x select 4],true] call LB_fnc_collectItems;
	_popTabs = (_x select 5) call fn_calc_poptab;
	[_vehicle,_ItemsList,_popTabs,[]] call LB_fnc_addCargo;
	// log
	//[format["put static-box %1 %2",_pos,_boxName]] call LB_fnc_log;
	["LB_STBX#"+str _cnt,_pos,_C_markertype,_C_markercolor,0.7] call LB_fnc_marker;
	_cnt = _cnt + 1;
}forEach _C_staticbox;
//-------------------------------
// Traveler AIs
if(_C_traveler)then{
	_aicnt = 0;
	{
		_loc = _x;
		_pos = [[[position _loc, 200]],[]] call BIS_fnc_randomPos;
		_pos = _pos findEmptyPosition [0,50];
		_ok = false;
		if !(_pos isEqualTo [])then{
			_ok = [_pos,[]] call LB_fnc_isSafePos;
		};
		if!(_ok)then{
			_group = createGroup [_C_banditSide,true];
			_group setVariable ["DMS_LockLocality",nil];
			_group setVariable ["DMS_SpawnedGroup",true];
			_group setVariable ["DMS_Group_Side","bandit"];
			_group setVariable ["DMS_AllowFreezing",true];
			_group setVariable ["DMS_isGroupFrozen",true];
			_group setVariable ["LB_FireCount",time];
			_group setCombatMode "RED";
			_group setBehaviour selectRandom["AWARE"];
			_unit = objNull;
			_spawncnt = floor(random _C_travelersGrpMax) + 1;
			for [{_j=0},{_j<_spawncnt},{_j=_j+1}] do{
				_cgear = "" call LB_fnc_selectAIGear;
				_unit = [_group,_pos,_C_banditClass,"random","bandit","soldier",_cgear] call DMS_fnc_SpawnAISoldier;
				_items = [selectRandom _C_travelersItemGrp,_C_travelersItemCfg,false] call LB_fnc_collectItems;
				{
					[_unit,_x] call ExileClient_util_playerCargo_add;
				}forEach _items;
				_unit setVariable["ExileMoney",_C_travelersMaxTab call fn_calc_poptab,true];
				uisleep 0.1;
				_unit setName (selectRandom _aiNames);
				_unit allowFleeing (random 0.3);
				_unit allowDamage true;
				_unit setDamage 0;
				_unit enableAI "AUTOTARGET";
				_unit enableAI "TARGET";
				_unit enableAI "MOVE";
				reloadEnabled _unit;
				if(needReload _unit == 1)then{reload _unit};
				_unit addEventHandler ["Fired","_this call LB_eh_Fired"];
				_unit enableSimulationGlobal false;		// freeze!!
			};
			_aicnt = _aicnt + 1;
			["LB_TR#"+str _aicnt,_pos,_C_markertypeAItr,_C_markercolorAItr,0.7] call LB_fnc_marker;
			[format["TravelerSpawn %1 %2 %3 %4 AIs",_aicnt,text _loc,_pos,_spawncnt]] call LB_fnc_log;

			// waypoint:NameCity
			_ok = false;
			_wppos = [];
			_loc = "";
			for [{_j=0},{_j<5 && !_ok},{_j=_j+1}] do{
				_range = 4000;
				_loc_city = [];
				for [{_j=0},{_j<5},{_j=_j+1}] do{
					_loc_city = nearestLocations [_pos,["NameCity"],_range];
					if(count _loc_city < 1)then{_range = _range + 2000;};
				};
				_loc_city = _loc_city call ExileClient_util_array_shuffle;
				{
					_wppos = position _x;
					_loc=_x;
					if([_wppos,[]] call LB_fnc_isSafePos)exitWith{_ok=true;};
				}forEach _loc_city;
			};
			if(_ok)then{
				_wppos = position _loc;
				_wppos = [[[_wppos, 200]],[]] call BIS_fnc_randomPos;
				_wppos = _wppos findEmptyPosition [0,50];
				_wp = [_group,_wppos,"MOVE"] call fn_addWaypoint;
				[("LB_TR#"+(text _loc)+str _aicnt +"w1"),_wppos,"waypoint",_C_markercolorAItr,0.7] call LB_fnc_marker;
				[format["wp %1 %2",(text _loc),_wppos]] call LB_fnc_log;
				// waypoint:return
				if (!isNil "_wp")then{
					_wp = [_group,_pos,"CYCLE"] call _addWaypoint;
				};
			};
		};
	}forEach _locCapital;
};
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
// !! CUP-Terrain objests !! *if u wont delete or replace
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
if(_C_banditcitygrp > 0)then{
	_loc = selectRandom _locCapital;
	private _AIcnt = 0;
	private _locPos = [];
	if !(isnil "_loc")then{
		_buildings = [position _loc,300,50] call LB_fnc_findBuildings;
		if(count(_buildings select 0) > 10)then{
			if !(isNull(_buildings select 2))then{
				_locPos = getPos (_buildings select 2);
			}else{
				_locPos = getPos selectRandom (_buildings select 0);
			};
			_locPos = _locPos findEmptyPosition [0,50];
			["LB_BANDITCITY_CIRCLE",[_locPos select 0,_locPos select 1],"","colorUNKNOWN",1,"BDiagonal"] call LB_fnc_marker;
			["LB_BANDITCITY_MARK",[_locPos select 0,_locPos select 1],"ExileMissionCapturePointIcon","ColorRed",1,"Bandit city"] call LB_fnc_marker;//hd_warning

			// vehicle object(simple obejct)
			_cnt = 0;
			for [{_j=0},{_j<_C_banditcitygrp},{_j=_j+1}] do{
				_className = selectRandom _bc_vehicles;
				_pos = [_locPos,150,15,_spawnedPositions]call fn_findEmptyAroundField;
				if!(_pos isEqualTo [])then{
					[_className,_pos] call LB_fnc_putSimpleobj;
					_spawnedPositions pushBack [[_pos select 0,_pos select 1,0],5];
					_cnt = _cnt + 1;
				};
			};
			[format["Banbit city %1 Vehicles",_cnt]] call LB_fnc_log;
			// camp object(simple object)
			_cnt = 0;
			{
				_className = _x;
				_pos = [_locPos,200,5,_spawnedPositions]call fn_findEmptyAroundField;
				if!(_pos isEqualTo [])then{
					[_className,_pos]call LB_fnc_putSimpleobj;
					_spawnedPositions pushBack [[_pos select 0,_pos select 1,0],5];
					_cnt = _cnt + 1;
				};
			}forEach _bc_objects;
			[format["Banbit city %1 Objects",_cnt]] call LB_fnc_log;

			for [{_j=0},{_j<_C_banditcitygrp},{_j=_j+1}] do{	// spawn groups
				// make group
				_group = createGroup [_C_banditSide,true];
				_group setVariable ["DMS_LockLocality",nil];
				_group setVariable ["DMS_SpawnedGroup",true];
				_group setVariable ["DMS_Group_Side","bandit"];
				_group setVariable ["DMS_AllowFreezing",true];
				_group setVariable ["DMS_isGroupFrozen",true];
				_group setVariable ["LB_FireCount",time];
				_group setCombatMode "RED";
				_group setBehaviour selectRandom["CARELESS","SAFE","STEALTH"];
				for [{_k=0},{_k<3},{_k=_k+1}] do{	// 1group AIs
					_building = selectRandom (_buildings select 0);
					_bpos = [_building] call LB_fnc_getBuildingPos;
					_pos = ASLToATL(AGLToASL(_bpos select 1));
					if(count (_bpos select 2) isEqualTo 3)then{
						_pos = ASLToATL(AGLToASL(_bpos select 2));
					};
					if(count (_bpos select 6) isEqualTo 3)then{
						_pos = ASLToATL(AGLToASL(_bpos select 6));
					};
					_cgear = "" call LB_fnc_selectAIGear;
					_unit = [_group,_pos,_C_banditClass,_C_banditDifficulty,"bandit","soldier",_cgear] call DMS_fnc_SpawnAISoldier;
					uisleep 0.1;
					_items = [selectRandom _C_banditItemgrps,_C_banditItemcfg,false] call LB_fnc_collectItems;
					{
						[_unit,_x] call ExileClient_util_playerCargo_add;
					}forEach _items;
					_unit setVariable["ExileMoney",_C_banditmaxpoptab call fn_calc_poptab,true];
					_unit setName (selectRandom _aiNames);
					_unit allowFleeing (random 0.3);
					_unit allowDamage true;
					_unit setDamage 0;
					_unit enableAI "AUTOTARGET";
					_unit enableAI "TARGET";
					_unit enableAI "MOVE";
					reloadEnabled _unit;
					if(needReload _unit == 1)then{reload _unit};
					_unit addEventHandler ["Fired","_this call LB_eh_Fired"];
					_unit enableSimulationGlobal false;		// freeze!!
					_AIcnt = _AIcnt + 1;
					// log
					//[format["AI %1 %2",_AIcnt,_pos]] call LB_fnc_log;
				};
				for [{_k=0},{_k<10},{_k=_k+1}] do{
					_building = selectRandom (_buildings select 0);
					[_group,getPos _building,"MOVE"] call fn_addWaypoint;
				};
				// waypoint:return
				if (!isNil "_wp")then{
					_wp = [_group,_locPos,"CYCLE"] call fn_addWaypoint;
				};
			};
			[format["Banbit city %1 (%2 Groups %3 AIs)",text _loc,_C_banditcitygrp,_AIcnt]] call LB_fnc_log;
		};
	};
};
//-------------------------------
// Spawn Iron-man
if(count _locMilitaryPos > 0)then{
	_aicnt = 0;
	{
		_pos = _x select 0;
		_spawn = _x select 1;
		_ok = false;
		
		// random air-ports or military
		private _house = [];
		if(_pos isEqualTo [])then{
			_pos = selectRandom _locMilitaryPos;
			if(count _locMilitaryPos > 1)then{
				_locMilitaryPos deleteAt (_locMilitaryPos find _pos);
			};
			_house = nearestObjects [_pos, ["house"], 500];
			if(count _house > 0)then{
				_pos = getPos (selectRandom _house);
			};
		};

		if !(_pos isEqualTo [])then{
			_ok = [_pos,[]] call LB_fnc_isSafePos;
		};
		if(_ok)then{
			_group = createGroup [_C_banditSide,false];
			_group setVariable ["DMS_LockLocality",nil];
			_group setVariable ["DMS_SpawnedGroup",true];
			_group setVariable ["DMS_Group_Side","bandit"];
			_group setVariable ["DMS_AllowFreezing",true];
			_group setVariable ["DMS_isGroupFrozen",true];
			_group setVariable ["LB_FireCount",time];
			_group setCombatMode "RED";
			_group setBehaviour "SAFE";	//CARELESS
			_unit = objNull;
			for [{_j=0},{_j<_spawn},{_j=_j+1}] do{
				_unit = [_group,_pos findEmptyPosition [5,50]] call LB_fnc_spawnIronman;
			};
			[_group,_pos,300] call bis_fnc_taskPatrol;
/*
			[_group]spawn{
				{
					_x enableSimulationGlobal false;	// freeze!!
				}forEach(units (_this select 0));
			};
*/
			_aicnt = _aicnt + 1;
			["LB_IR#"+str _aicnt,_pos,_C_markertypeAItr,_C_markercolorAItr,0.7] call LB_fnc_marker;
			[format["IronMan %1/%2 %3 %4 AIs",_aicnt,count _C_ironman,_pos,_spawn]] call LB_fnc_log;
		};
	}forEach _C_ironman;
};
//-------------------------------
// Put Custom Billboard
if(count _C_cbboards > 0)then{
	_cnt = 0;
	{
		_vehicle = createVehicle [_x select 0,_x select 1,[],0,"CAN_COLLIDE"];
		_vehicle setDir (_x select 2);
		_vehicle allowDamage false;
		_vehicle enableSimulationGlobal false;
		_vehicle enableRopeAttach false;
		_vehicle setObjectTextureGlobal [0,_x select 3];
		[format["put custom obejct %1 %2 %3",_x select 0,_x select 1,_x select 3]] call LB_fnc_log;
		["LB_CB#"+str _cnt,_x select 1,_C_markertypeST,_C_markercolorST,0.7] call LB_fnc_marker;
		_cnt = _cnt + 1;
	}forEach _C_cbboards;
};
//-------------------------------
// Text on Map-screen
if(count _C_maptext > 0)then{
	_cnt = 0;
	{
		["LB_MAPTEXT#"+str _cnt,_x select 0,_x select 1,_x select 3,1,_x select 2,_x select 4] call LB_fnc_marker;
		_cnt = _cnt + 1;
	}forEach _C_maptext;
};
//-------------------------------
// Random Exile Obejct
// (Clean-water / ConcreteMixer / Trader)
private["_objs","_angle","_spawn_w","_spawn_c","_spawn_t","_ok","_trsp"];
if(count _C_rndexileobj > 0)then{
	_trsp = [];
	_objs = _C_rndexileobj call ExileClient_util_array_shuffle;
	_spawn_w = _C_cleanwatercnt;
	_spawn_c = _C_concretemixcnt;
	_spawn_t = _C_tradercnt;
	if(_spawn_w < 0)then{_spawn_w = 99;};
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
			[_className,AGLToASL(_pos),_angle]call LB_fnc_putSimpleobj;
			_spawn_w = _spawn_w - 1;
			_ok = true;
		};
		// Concrete Mixer
		if(_spawn_c > 0 and _className isEqualTo "Exile_ConcreteMixer")then{	// canot use simple obj.
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
			_group = createGroup SC_SurvivorSide;
			_group setCombatMode "BLUE";
			_group setVariable ["DMS_AllowFreezing",false,true];
			_group setVariable ["DMS_LockLocality",true];
			_group setVariable ["DMS_SpawnedGroup",false];
			_group setVariable ["DMS_Group_Side", "survivor"];
			enableSentences false;
			enableRadio false;
            _className createUnit [_pos,_group,"_trader = this;"];
			_trader reveal _attach;
			_attach disableCollisionWith _trader;
			_trader disableCollisionWith _attach;
			_trader attachTo [_attach, [(_pos select 0)-(_tpos select 0),(_pos select 1)-(_tpos select 1),-0.1]];
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
			_trader setFace "GreekHead_A3_08";
            removeGoggles _trader;
			removeAllItemsWithMagazines _trader;
			removeHeadgear _trader;
			removeUniform _trader;
			removeVest _trader;
			removeBackpackGlobal _trader;
			sleep 0.5;
			_trader addWeapon selectRandom["Exile_Weapon_AK47","srifle_LRR_camo_F","Exile_Weapon_LeeEnfield","Exile_Weapon_SVD"];
            _trader forceAddUniform "Exile_Uniform_BambiOverall";
			_trader addHeadgear selectRandom["H_TurbanO_blk","H_Booniehat_grn","H_Hat_checker","Exile_Headgear_SantaHat","Exile_Headgear_SafetyHelmet"];
            _trader addVest selectRandom["V_Press_F","V_TacVest_blk_POLICE","V_TacVestIR_blk","V_TacVest_camo"];
            _trader addBackpack selectRandom["B_Bergen_tna_F","B_Carryall_oli","B_Carryall_ghex_F"];
            _trader linkItem "Exile_Headgear_GasMask";
			_trader switchMove "AmovPsitMstpSnonWnonDnon_smoking";
			_trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
			_spawn_t = _spawn_t - 1;
			_ok = true;
		};
		_cnt = _cnt + 1;
		if(_ok)then{
			[format["put Exile-Object %1 %2",_className,_pos]] call LB_fnc_log;
			[format["LB_REOBJ%1",_cnt],[_pos select 0,_pos select 1],"hd_unknown","",0.3,""] call LB_fnc_marker;
		}else{
			if(random 1 > 0.7)then{
				// so bad..
				//["BloodPool_01_Large_New_F",AGLToASL(_pos)] call LB_fnc_putSimpleobj;
				["Land_HumanSkull_F",AGLToASL(_pos),_angle] call LB_fnc_putSimpleobj;
				[format["LB_REOBJ%1",_cnt],[_pos select 0,_pos select 1],"hd_unknown","",0.3,""] call LB_fnc_marker;
			};
		};
		// if u wont icon > "ExileConcreteMixerZoneIcon"
	}forEach _objs;
};
//-------------------------------
// Broodcast messages
private["_text"];
if(count LB_Bcmessage > 0)then{
	missionNamespace setVariable ["LB_BCMS_CNT",0];
	[LB_BcmessageTime,{
		_cnt = missionNamespace getVariable "LB_BCMS_CNT";
		_text = "Server : " + (LB_Bcmessage select _cnt);
		_text remoteExecCall ["systemChat",-2];
		_cnt = _cnt + 1;
		if(_cnt >= count LB_Bcmessage)then{_cnt = 0};
		missionNamespace setVariable ["LB_BCMS_CNT",_cnt];
	},[LB_Bcmessage],true]call ExileServer_system_thread_addTask;
};

["finished! have fun"] call LB_fnc_log;
// going bed  orz
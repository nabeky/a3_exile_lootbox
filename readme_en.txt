*English documents(UTF,tab:4)
*Version look to (config.cpp)
*Change log to End of doc.
*We are looking for some folks which can translate this document　;-)
	(Japanese => English,German,French,Russian etc..)
////////////////////////////////////////////////////////////////////////
//	LOOT BOX for Arma3 EXILE MOD,Communities,Survivors,Bohemia
//	"a3_exile_lootbox"
//	アイテム漁りに小さな幸せを・・　/ for beggar-man
//
//	Dev.&Auth.：nabek (blog.ahh.jp) 2018/4-
//	Discord Ch. https://discord.gg/b4FT278
//
//	Manual （英語 / English）
//
//		Index
//		* Overview (EN translated)
//		* Environment (EN translated)
//		* Description
//		* Setups
//		* Cooking method
//		* Documents
//		* Logging
//		* Errors and remedy
//		* Customize
//		* License & Supports
//		* Cockroaches?
//		* from Dev.nabek
//		* Change logs
////////////////////////////////////////////////////////////////////////

-------------------------------------------------------------------------------
## Overview

This is a server side addon mod for Arma3 Exile servers.
This addon is focused on providing additional experiences around "towns" and "cities" on your prefered map.
Majority of the functionality will work out of the box by just copying in to your server addon directory as it reads and utilizes map data to adjust itself.
There is no need to set anything inside your mp_mission.pbo for this addon to work.

This addon has been developed to try to get players to explore to towns and landmarks which oftenly are barren in default Exile game play.
For looting, this addon will create a lootbox somewhere outside, or indoors of random towns. (apart from Exile loot spawn system.)
The lootboxes oftenly have some random items, poptabs, trash which would benefit bambie players. (There is a module which will spawn landmines near these lootboxes.)
This addon has an inhouse vehicle spawning system. (apart from Exile vehicle spawning system.)
There are various additiona functioanlity this addon supports which should provide players with some nice experiences when playing.

I have tried to do my best in writing the code in an easily understand format but if you need to modify it, please do so.
There are no mods needed for this addon to work.
This addon relies on DMS for it's AI spawning functionality (even if you don't use the DMS mission system.)

# Changes mainly around the location system
  * Spawns loot boxes in random towns
    * Lootboxes will spawn either inside or outside houses in towns
    * Loot contents can be configured easily (Such as there are 3 tiers you can set the lootbox size to be depending on size of town.)
    * Capable of setting wiretrap mines around lootboxes for that extra entertainment  
  * Spawns random vehicles and aircrafts around in/near random towns
    * Vehicles can be customized to have different tiers of damage and item content
    * Vehicles will try to spawn near buildings, not out in the open fields
    * Capable of setting GPS and grenade traps around these vehicles for that extra entertainment
  * Spawns bandit AI in random towns
    * AI will spawn inside buildings and can garrison or wander around town
    * AI will also wander around near petrol stations, spawned vehicles and along roads
    * Depending on the latitude of location, there is a possibility of sniper attributed AI spawning
  * Spawns landmines around towns
    * landmines will be placed mainly on roads
  * Spawns unusual objects, objects with fire effects randomly in towns
    * You would be able to provide a bit of a different experience to players
    * You will be able to spawn trash, broken vehicles around towns
  * Buildings will have a random percentage the doors are open
    * Ability to erase players footstep marks on the ground
  * Places random campfires around the map
    * This will give a nice feeling to night time as well as provide lucky players with a fire to cook
  * Spawns traveling AI
    * AI will traven from town to town
    * Players will have higher possibility of encountering these traveling AI between locations
  * Spawns "Iron Miller" AI (does not die)
    * "Iron Miller" is a man with super health regeneration capability
    * "Iron Miller" will not drop any items or provide any respect
  * GPS Traps
    * When found by AI, your location will be marked on map
    * There is a percentage AI will mark your coordinates on map if you start a found vehicle spawned by this addon
    * (Above functionality only works for AI spawned by this addon)
  * Grenade Traps
    * There is a percentage a grenade trap goes off if you start a found vehicle spawned by this addon
    * (Above will either be smoke or mini grenades)
  * Town invasion by bandit AI
    * A random town will be invaded by bandit AI
    * This system will not have any reward boxes

# Others
  * This addon will work out of the box (default config requires cup core but can be removed)
    * This addon will read needed locational values from the map directly
    * This addon will work on different maps out of the box
    * (Above is true unless you customize it to have a static location value)
  * Ammo inside magazines will be randomized
    * Any spawned loot item with a magazine type system will have random values
  * Water source and concrete mixers can be placed (can be configured to be random)
    * Various Exile related objects can be set to spawn randomly
  * Function to add custom location names on the map
  * Function to add desired text on the map
    * Function to add map markers as well
    * (double-byte language text is hard to read)
  * Functionality to add custom signs
    * Signs can use graphic files of choice (as long as Arma engine understands it)
    * If the given object supports texture changes, it doesn't have to be a sign object
  * Supports sending out server messages
    * Supports sending canned messages to all players on the server at set interval time

Lootbox addon will execute and run along with other addons the server has (possible to configure so lootbox stops and waits if other addons are using up resource.)
Lootbox addon will continue to execute even if players has joined session
(Above is something to do with the Arma3 engine, other addons react similary)
* test results: on CUP Takistan (Windows/Core i5) around 3 minutes for addon to fully execute

-------------------------------------------------------------------------------
## Environment
Arma3 1.88.145285　64bit/32bit
Arma3 Dedicated Server
Windows 10 Home/Professional
Linux(Ubuntu 16.04LTS/17.10/18.04LTS)

MOD:Exile MOD Server 1.0.3a/1.0.4a(Pineapple)
Addon:DMS/Defent's Mission System　Server
	https://www.exilemod.com/topic/61-dms-defents-mission-system/

Below will be needed to unpack/pack the pbo.
	PBO Manager
	http://www.armaholic.com/page.php?id=16369
Great text editor to use to change config values and such
	Notepad+
	https://notepad-plus-plus.org/
	* Visual Code is a good one as well
Official BI tools are nice to have
	Arma3 Tools
	* Install through Steam
	* Arma Tools would be needed for such as when you want to make a custom sign

-------------------------------------------------------------------------------
## Description
[Map Locations]
Lootboxes and such shall be randomly placed based on map locations (towns, landmarks, etc..)
By default this addon works on 3 different tiers of locations (villages, cities, large cities)
Apart from location type, this addon can be customized to use location names (this customization will make the addon map specific)
When the location type is found within the given map, it will execute on all it finds so if you need to blacklist specifi locations, please customize the addon to your needs.
This addon functionality all bases on above mentioned location engine.

If you want to add other landmarks, you can use below as reference or look through your map.
https://community.bistudio.com/wiki/Location
	Location Type // Name
	NameVillage // Village
	NameCity // City
	NameCityCapital // Large City (Capital)
	NameLocal // Landmarks
	Mount // Mountains
	Airport // Airports
	etc..

	Technnical Background: 
	On any given correctly made map, there are different points where Type Names and Location Names are set.
	Thus, if you specify by location name instead of type, the addon will work on that one specific location.
	If the given location doesn't have a type name defined on the map, you would be able to use the landmarks instead (NameLocal) my finding this value from logfiles.
	(In terms of CUP Takistan, Hills, Brushes, Unnamed villages, pipelines, etc..)
	This addon will only create a requirement for the specific map information if above is utilized.

	To add randomness to the functionality, when the engine runs and finds a location to execute on, it will have a random sway in setting its center point.

	(Memo)
	Oftenly, military locations do not have location types thus this addon will try to find it on it's own.
	(Such as the military is near/within an Airport or a NameLocal, NameCityCapital as well)

[Creating new locations]
        Technnical Background:
	Location type uses what Arma3 uses as default.
	(such as font, size, icons)

[Lootbox locations]
Lootbox spawn mechanism tries to find a hidden location.
Spawn mechanism will be based randomly on below criteria.
  * Within realms of the specified locations within the map
  * Indoors OR outdoors of a structure within the realm
  * Indoors: Either OR locations within the structure
    * the furthest away location from entrance
    * Depending on structure, such as the most upper level
  * Outdoors: Random location around the given structure
  (If mechanism can not find any structures, it will not execute)
  
  Technnical Background:
    * For spawning the lootbox indoors, I am using values provided by "buildingPosition"

[Generating item lists]
This mechanism is used for Lootbox inventory, spawned vehicle inventory, Bandit AI inventory.
Item lists will be determined by several factors.
For each individual inventory, below is calculated and used.

Item -> Add Rare items? -> Possibility of changing items to trash (or remove) -> Shuffle -> Define and execute
  * Static Add (global which influences all inventory types)
  * Statuc quantity value (If value is defined to fluctuate, then random value from range)
  * 50% of defined list is set randomly
  * 1 item is selected from the Rare items list
  * Possibility of 1 item is selected from the Special Rate item list
  * Poptabs added randomly based on range specified
  
    Technical Background:
    I've tried to make mechanism average out as possible.
    Once defined and executed, the item order is set to be random as well.
    (Takes in to account of given inventory container capacity.)

[Trash filter]
Once initial item list is created, Trash filter will replace items with trash based on percentage.
(If setting Trash filter to = 1, then it means all items will be set to trash.)
With the same mechanism, it's possible to make it such as if Village, the percentage of trash is higher.
Instead of turning to trash, mechanism will also delete from initial set item list.

[Poptabs]
Poptabs will be added to given inventory container.
Poptabs will be calculated based on specified value as max value, then will generate the poptab amount with a 30% minimam value calculation.
Poptabs in vehicles will follow the same calculation

  Example: If specified value = 1000, then 1000 x 0.3 = 300 (minimum value)
           Thus amount of poptabs will be a random value between 300 to 1000

[Lootbox traps]
When lootbox is placed outdoors, there is a possibility of a wiretrap to be placed around the given lootbox
The Wiretrap will be placed randomly within 2m of the given lootbox
You would be able to change the trap type if wanted
    Technical Background:
    Depending on terrain slope, sometimes the traps will be burried underground
    (I've tried to make this not happen as much as possible, but it can still happen)

[Static Lootbox Spawns]
You will be able to set static locations for lootboxes apart from base spawn function according to locations
This function can be used for such situations as prizes inside mazes or on mountain tops, etc...
    Technical Background:
    coordinates can be defined by X/Y values
    Z value is "0" to specify to spawn on the terrain surface
    Example:[1800,2130,0]
    Note: you can not specify a static lootbox to spawn near spawn points or bases

[Traps and Landmines]
Once lootboxes finish spawning in a given location, the addon will start spawning traps and landmines randomly on roads around the area
This is meant for hardcore gameplay so be warned.
If your AI are set to be EAST faction, the AI will be able to see traps and landmine locations so they shouldn't step on them.
You will be able to change trap/Landmine types if you want
    Technical Background:
    Traps/Landmines will be placed around the middle of the road
    It'll only look like a small dot on the road so unless you are careful beforehand, they are hard to find and avoid.
    Traps/Landmines will spawn on any surface defined as a "road" by the map (such as, on airport landimg strips)

[GPS Trap]
Your location will be marked on the map when you are found by bandit AI, or mistakenly execute a vehicle trap
If a Bandit AI shoots you, you will always be marked on the map
As well, Bandit AI will report your location on global chat
Above functionality will only support AI spawned by this addon
(Town invasion AI, Traveling AI, Iron Man)
This function triggers based on gunfire, thus it will execute as well when firing upon zombies or allies
All players in the server will be able to see the AI map marker
Vehicle traps will have a percentage possibility of being marked on the map
Marked location is not exact and is generalized
    Technical Background:
    For vehicle traps, there is a 50% chance it will execute the trap, then it will select to either detonate a grenade trap or GPS trap.
    Map markers are refreshed every 1 minute but each AI group

[Grenade Trap]
2 seconds after a found vehicle's engine is started, the trap will detonate either a smoke grenade or a mini grenade
Function will have a 20% possibility of using mini grenades
    Technical Background:
    The even hook will only execute the 1st time and will then delete itself from happening again on the same vehicle.

[Unusual Objects]
You will be able to random spawn defined objects within defined area
By default, this function will spawn dead trees, statues, barrels, wrecked vehicles.
By placing wrecked vehicles, trash, old tires, dead bodies, you would be able to provide some  unique experiences to your server.
You will also be able to place buildings which can change the look of a given town
    Technical Background:
    This function will randomly try to place given object at an open area, but will try its best to place near a structure
    If in case the object is a flat type (such as oil spills, blood splatter, trash) it will place itself on roads as higher priority
    You can specify object size to try to avoid the object clipping in to other objects
    For sake of performance, I would suggest disabling simulation
    (by default, objects are generated with CreateSimpleObject attributes, which will reduce performance load by around 10%-20%)

[Camp Fires]
Camp fires will be placed for night time lighting or cooking
Camp fires will be placed randomly near structures
You can use this functionality for being nice to bambies (such as, use around spawn points or villages)

[Burning objects]
This function will randomly place specified objects with burning effects or smoking effects around towns
You can specify not only vehicles wrecks or heli wrecks, but objects like structures or stack of wood, etc..
This function can be used as dummy heli crashes or visible reference of town locations from afar.
    Technical Background:
    This function will try to avoid placing itself on top of roads
    This is to reduce Driving patrol AI from crashing in to the objects

[Bandit AI in towns]
This function will place bandit AI inside structures within towns (mostly around near windows or entrances/exits)
If the specified spawn location of the AI is above defined values, it can spawn snipers
You will be able to specify if these AI will patrol or not
If AI is set to patrol, they will patrol around nearby vehicles, roads, petrol stations within range
You can specify a seperate class all together to have custom loadouts
(As for AI skill settings, I'm having addon to reference what DMS specifies)
If in case there are no structures within realms of specified spawn point, they will be randomly placed within the area
If a player shoots against these AI, they will mark a general location of the player on the map (aka, GPS trap)
    Technical Background:
    AI strengh is set to random by DMS
    When a player is not near, the AI will use DMS AI Freeze function to reduce server load
    AI spawns will try to spawn at the most highest point within the area unless below
      * Location type is airfoeld/Airport/military base
      * if in case the latitude difference within the specified area is within 10m difference
    
    When placing AI inside structures, it uses buildingPosition data from the map
    Within above, it will also take in to consideration of spawning at a location which is within 100m of a road type
    Above is set to increase possibility of finding players
    
    This function will define 1 AI as 1 group
    (Arma3 is able to handle more than 200 groups but be careful in how you set this up)
  
    AI which are set to patrol will set waypoints to near vehicles, roads and petrol sations (max quantity of waypoints is 5)
    (all waypoints will be set within defined area around the spawn point)
    If in case set waypoint is less then defined value, it will use location base points
    At the end of waypoint 5, AI will then go back to spawnpoint and start over again
    
    If you specify a custom class, you will be able to customize AI equipment
    Inventory contents is defined by this addom
    (LB_LootAllFixedItems is not used)
    (item types which have associted quantity will have random quantity values)

[Vehicle Spawns]
Vehicels found by this function can be used by players
Vehicles will try to spawn in safe areas around structures and will have ability to have items or poptabs within its inventory
Vehicles are spawned to make look like someone parked there, instead of looking like it "spawned"
    Difference in spawn mechanism
      * Exile default will spawn randomly in an open area such as fields
      * This addon will spawn around near structures, or somewhere inside towns

You will also be able to set damage values for each part of the spawned vehicle
Petrol amount will be a random value but max and min value can be specified
If in case random value function is not used, it will use the max value specified
If in case a structure can not be found, it will fall back to spawn randomly within specified area
There is a possibility of grenade trap detonating (either smoke grenades or mini grenades) OR GPS trap executing 2 seconds after turning the engine on 
You can also randomly set it so the engine or lights are turned on
Bandit AI's in Town which are set to patrol will use these vehicles as waypoints
    Technical Background:
    If in case vehicle class includes "_bike", random damage will not applied
    For information regarding damage part locations, look at Reference section
    Depending on vehicle type, this function tries to adjust the amount of open space it needs and decides where it will spawn
    I will not suggest spawning plane types using this function (get Arma'd)

----------------------------------------------------------------
Written below has nothing to do with the Location Engine but will still need to figure town locations
----------------------------------------------------------------
[Bandit AI town invasions]
A random CapitalCity type will be invaded by bandit AI
You will be able to speficy the amount of groups (1 group has 3 AI)
This will not have any prizes like other mission type addons
Within the selected town, vehicles (which can not be used by player) and objects are spawned
The nearest location within defined area will be used
    Technical Background:
    Spawns will be selected randomly from within CapitalCity types
    player unusable vehicles will spawn based on quantity of each group
    (the vehicle is unusable since it's spawned in as SimpleObject attribute)

[Iron Miller]
Iron Miller is a man of steel, he has tolerance against anything mother nature throws at him and has super health regeneration capabilities
Even if you manage to kill him, you can't kill him enough and he will rise up from the dead again
If you manage to kill him, a smoke grenade will detonate at given location
Iron Miller is equipped with Prisoner Clothes, Santa Hat, a machinegun and grenades (despawns when killed)
He also has bipods and scopes
You can utilize him by specifying a static spawn location as well as spawn several of him as 1 group
If Iron Miller finds a player, he will mark the players location on map
If you manage to kill Iron Miller, all of his equiment despawns, as well no respect is added to player
Because of above, noone will like having to deal with Iron Man.
    Technical Background:
    Each time a damage event happens, his auto regeneration function executes
    Iron Miller patrols around within 300m of defined spawn point
    Iron Miller does not hide, he will start shooting at players as soon as he finds any
    Iron Miller equips below
      MMG_01_hex_F/acc_flashlight/optic_AMS_snd/bipod_02_F_hex
    Iron Miller function spawn can utilize the location engine

[Traveling AI]
This function will spawn AI which traven between towns
Traveling AI will spawn in every CapitalCity type town and will travel around near towns
(It will depend on map, but roughly around 1-1.5km range)
Because of above, traveling AI have a higher chance of encountering players which have gotten near towns
You are able to specify the quantity of AI within each group
Equipment generation uses what Bandit AI town invasions uses
Inventory items and poptabs can be set seperate
If AI find player, they will fire upon as well as mark general location of player on map
    Technical Background:
    This addon tweked around to be used on CUP Takistan, CUP Takistan map as 4 NameCityCapital types
    I would think other maps have around the same amount of NameCityCapital types available
    traveling waypoints will be set towards one of the near towns
    Most of the time there should be a road between spawn and waypoint so encounters would mostly be along roads
    This function relies on the Location Engine to decide which location to execute

----------------------------------------------------------------
Below does not rely on Location Engine and will work stand-alone
----------------------------------------------------------------
[Random placement of Exile objects]
This function will allow to randomly place meaningful Exile related objects (such as water servers, concrete mixers, etc..)
Once defining spawnable locations, defining quantity will allow the objects to randomly spawn
Objects spawned will show an icon on the map
If in case possibility is random, then mapmarkers are sometimes dummies
Above function will allow user to not having to rely on exile_3den.pbo tool to place these objects
    Technical Background:
    If in case the default object is customized, use the object name as is to specify

[Custom Signs]
This functionality allows to place custom signs in defined locations
You would be able to brand these signs with your server info and such if wanted
You will be able to read graphic files in from within your mission pbo to be displayed
Use Eden editor to note down the X/Y location and rotation value
(rotation value will be "z" value)
Even if not a sign object, any object which allows swapping textures will work
    Technical Background:
    graphic images must be saved inside your mission pbo
    You may use jpg or paa file formats for your graphic
    height and width of image should always be 2^x (such as 64/238/256/512)
    Using around 512*256, 512*512 would be on the safer side
    * If possible keeping graphic size under 20kb would be better
    enableSimulationGlobal/enableRopeAttach/allowDamage will all be set to false when signs are generated
    There are objects which you can't change textures (I would suggest using normal signs/billboards)
    If in case an object which can use several different textures, you would only be able to use 1 custom graphic

[Writing on the Map]
This function will allow you to write and use icons on desired location on map
This function will allow drawing Ellipses as well
Color and Size can be defined
    Technical Background:
    This uses the default base map marker functionality so if you place too many, it'll lag
    Changing the font will not be supported

[Sending Server Messages]
This function will allow to send canned messages to players at a set interval
Several different messages can be set
Please use this functionality for server announcements and such
    Technical Background:
    This function will push messages globally to all players on the server at the time
    This function is able to specify intervals in seconds but actual push would depend on server load as well
    Due to Arma3's language rendering limitations, using double-byte languages in this function will not recommended as it would look ugly
    Due to this function triggering against systemChat, if scrolled too much the message might disappear quite fast

-------------------------------------------------------------------------------
## Install & Setups
Unpack a3_exile_lootbox.pbo and do whatever needed to tweak
※You will need PBO Manager or something to unpack and repack
※This readme（readme_en.txt）is unneeded for execution of addon so you may delete if you want
Repack a3_exile_lootbox.pbo

Place the addon pbo inside within Exile's @ExileServer/addons/ directory
Exile will automatically load the addon at startup
Depending on your edits, you will need to edit your mission file as well
Run server and verify no problems are observed from your server rpt logs

Within your DMS config.sqf, turn below to false
If below is false, and no other AI addon would be effected, LootBox AI will freeze accordingly same as how DMS AI freeze when a player is not near (This will help in server performance)
DMS_ai_freeze_Only_DMS_AI = false;

[Configurations]
There are several files within what's distributed by this addon, when configuring settings, you will need to unpack the pbo.
All basic configurations can be changed within the [config.sqf] file

	Notable configurations (Locational)
	* Map Locations
	* Generating item lists
	* Traps and Landmines
	* Bandit AI
	* Unusual Objects
	* Burning objects
	* Vehicle Spawns
	* Creating new locations
	* Traveling AI
	* Iron Miller
	* Bandit Cities

	Notable configurations (non-Locational)
	* Custom Billboards
	* Exile Object placements
	* Map Marker text
	* Sever Messages

As per default, majority of the configurations are made for a hardcore experience
Please figure out where in your server this add-on will be utilized and configure accordingly
This add-on should still run on any map without any first time configuration setup needed

 // Still translating below... (yukihito23) //
 
[設定方法]
Arma3スクリプティングの記法に合わせて、注意して編集してください。
多くの部分は、一般的プログラム言語と同様の記法となってます。
間違って記述した際は、スクリプトエラーとしてログに報告されます。

	o []や{}や""などは必ず対になるようにしてください
	o コードの行末は必ず";"セミコロンで終わらなければなりません
	o 配列[]に関する設定部分では、要素間を","で区切って下さい
	（但し、最後要素の後ろには、書く必要がありません）
	o コード内にダブルバイト文字（日本語他）は利用できません
	（但しコメント内は自由に記述できます）
	o 文字コードは"UTF-8"で、改行コードは、サーバのOSに合わせてください
	（Windows：CR/LF、Linux：LF）
	o オブジェクトを指定する際は、正式なクラス名を記述してください
	o 個数を設定する部分は、必ずしも、その数分だけ適用されるものではありません
	（エラーなどで、処理が飛ばされる場合があるため。よって希望最大値となります）
	o 確立設定の項目は、0.00～1.00を記述します。1が100%となります

	[主要なファイル]
	config.sqf	//Configuration file
	putBoxes.sqf	//Function
	./functions/	汎用的なスクリプトファイル
	readme_jp.txt	このファイル、運用開始時は削除しても結構です
	※他ファイルはおまじないのようなモノ

[./config.sqfファイル]
LB_DebugMode		デバッグモード
LB_OutputLog		ログ出力するか？
LB_PendingTime		起動時の待機秒
※起動時に他アドオンと問題がある場合、起動時間をずらしてください

(1)マーカー設定
LB_MapMarker		マップ上にマークするか？
LB_MapMarkerColor	マーカー色
LB_MapMarkerType	マーカータイプ
LB_MapMarkerColorMine	（トラップ）
LB_MapMarkerTypeMine
LB_MapMarkerColorAI		（バンディットＡＩ）
LB_MapMarkerTypeAI
LB_MapMarkerColorAITr	（トラベラーＡＩ）
LB_MapMarkerTypeAITr
LB_MapMarkerColorST		（奇妙／炎上オブジェクト）
LB_MapMarkerTypeST
LB_MapMarkerColorVehicle（車両）
LB_MapMarkerTypeVehicle
※設定値は、参考資料をご覧ください

(2)コンテナオブジェクト設定
LB_BoxObjClass_indoor[]	アイテムボックスの種類（屋外用）
LB_BoxObjClass_outdoor[]アイテムボックスの種類（屋内用）
※利用するコンテナオブジェクトを記述してください
※他アドオンの動作に支障をきたす場合があるため、事前に調査ください
（Exile_Container_SupplyBoxはヘリクラの場所決めに影響有り）

(3)ロケーションタイプ設定
LB_Locations[]		対象のロケーションタイプ
※対象となるマップロケーションタイプを指定してください
※デフォルトでは、登録されている全て町が対象となります
※優先順位があるので、個別設定は先に記述してください
※任意の町やランドマークを対象にする際は、ここに"NameLocal"を追加する必要があります
※位置情報はマップデータから取得します
※参考：https://community.bistudio.com/wiki/Location

(4)新ロケーション設定
LB_NewLocation[]	新しいロケーション設定
	1:ロケーションタイプ
	1:ロケーション名
	2:位置
	3:範囲
※任意の場所を動作対象とする場合に記述してください
（実際にロケーションとして登録されますので、他アドインの動作に注意してください）

(5)ブラックリスト設定
LB_Blacklist[]		任意の対象外エリア（[x,y,z],範囲）
※Z軸は、0を指定してください
LB_BLTrader			トレーダーからの半径(m)
LB_BLSpawnZone		スポーンゾーンからの半径(m)
LB_BLTerritory		拠点からの半径(m)
LB_BLItembox		他要素との最小距離
LB_BLBandit			他要素との最小距離
LB_BLVehicle		他要素との最小距離
※奇妙オブジェクトはブラックリストとは関係無く動作します
※車両湧きも関係しますので、スポーンゾーン設定にご注意ください

(6)ゴミアイテム設定
LB_TrashItems[]		ゴミアイテムのリスト
※貴サーバ環境にて、ゴミアイテムと思われるリストを記述してください
※空""の場合は、置換では無く削除として機能します

(7)スペシャルレアアイテム設定
LB_SRareItems[]		スペシャルレアのアイテムリスト
※貴サーバ環境にて、極上レアアイテムと思われるリストを記述してください

(8)アイテム群設定
LB_LootGroups[		アイテムリスト区分
	""				アイテムリスト区分名
	[
		[...]		固定湧きアイテム（倍率指定可）
		[...]		５０％湧きアイテム（ランダムで半分抽出）	
		[...]		レアアイテム(ランダムで１つ)
	]
]
※当アドオンの最も重要な項目となります
※クレイトボックスの容量を超えない様に注意してください
※アサルト（特にスナイパー系）は、想像以上にサイズが大きいので注意

(9)ロケーション毎設定
LB_LocationLoot[	ロケーション毎の湧き設定
	[
		""			1:対象ロケーション又は地名
		[...]
					2:範囲(m)
					3:アイテムボックスの数
					4:固定湧きの倍数（１～ｘ倍：ランダム）
					5:外・建物湧きの割合（０～１）％
					6:スペシャルレア・アイテムの湧き割合（０～１）％
					7:ポップタブの最大値（30%～ランダム）
					8:ゴミアイテムで占める割合（０～１）％
					9:バンディットAIの数（建物内湧き）
					10:道路上の地雷の個数
					11:ワイヤートラップの設置確立（０～１）％
					12:奇妙オブジェクトの設置数（０～ｘ）
					13:車両の数
					14:車両のタイプ（複数）
					15:アイテム区分の指定（複数）
	]
]
※ロケーションタイプ名の他、LocalNameの地名でも構いません
※地名を使う場合は、LB_Locationsに"NameLocal"を追加してください
※アイテムボックスやAI、車両などは様々な条件で湧かない場合があるため、多めな値をお勧めします
※多くのAIを配置する事は避けて下さい（Arma3制限のため）最大20
※ロケーション毎、車両の湧き最大数は10となっています

(10)固定アイテムボックス
LB_StaticBox		固定湧きの設定
	1:場所
	2:アイテム区分の指定（複数）
	3:固定湧きの倍数（１～ｘ倍：ランダム）
	4:スペシャルレア・アイテムの湧き割合（０～１）％
	5:ゴミアイテムで占める割合（０～１）％
	6:ポップタブの最大値（30%～ランダム）
※設定内容は、他アイテムボックス項目と同様となります

(11)バンディットＡＩ設定
LB_BanditSide		AIのサイド（east/west/resistance/civilian）
LB_BanditDifficulty	AIの難易度（DMS設定参照）
LB_BanditClass		AIの種類（カスタム又はDMS設定）
LB_BanditSniper		この高さ以上の場合スナイパー(m)
LB_BanditMove		移動可能なAI率（０～１）％
※DMSアドオンにてＡＩを生成しますので、DMS側設定に依存します
※高い場所の建物で、近隣の道路が見える場所を優先的に選択します
（但し、軍事施設や空港は建物が少ないため例外となります）
※最も高い場所が、優先的にスナイパーとなります。町１人のみ
（現段階では、適切なスナイパー位置に立ちません）
※ＡＩは基本的にその場所を離れませんが、攻撃された場合などは例外となります
[カスタムクラス時の装備設定]
ランダムで選択されます。
所持アイテムは、他アイテムと同様の設定ですが、固定湧きは無効となります。
他アドオンとの差別化を計る上、初期系、サブマシンガンをお勧めします。
LB_BanditUniforms[]
LB_BanditVests[]
LB_BanditHeadgear[]
LB_BanditWeapon[]
LB_BanditWeaponAttach[]	50%未装備
LB_BanditPistol[]
LB_BanditPistolAttach[]	50%未装備
LB_BanditAssignedItems[]
LB_BanditLauncher[]		30%未装備
LB_BanditBackpack[]		20%未装備
LB_BanditItem[]			※機能しますが、お勧めしません

LB_BanditItemGroups	格納アイテムグループ
LB_BanditItemCfg	所持アイテムリスト設定[]
	1:固定湧きの倍数（１～ｘ倍：ランダム）
	2:スペシャルレア・アイテムの湧き割合（０～１）％
	3:ゴミアイテムで占める割合（０～１）％
	※該当するアイテムボックス設定と同等となります
LB_BanditMaxPoptab	最大ポップタブ（30%～ランダム）

LB_Traveler			トラベラーAIの有無

(12)トラップ設定
LB_NearMine			アイテムボックス近くの爆発物の種類
LB_RoadMine			道路上の爆発物の種類
※複数記述でき、その場合ランダムで選択されます

(13)車両湧き設定（自転車／航空機含む）
LB_VRandomFuel		燃料ランダム(true/false)
LB_VFuelLow			最小燃料(0-1)
LB_VFuelMax			最大燃料(0-1)
LB_VBrokenParts		完全に壊れてる部位[]（複数）
LB_VDamageChance	故障割合(0-1)
LB_VDamageLow		最小ダメージ(0-1)
LB_VDamageMax		最大ダメージ(0-1)
LB_EngineOn			エンジンON(0-1)
LB_LightOn			ライトON(0-1)※Arma3バグ含
LB_VItemGroup[]		格納アイテムグループ
LB_VItemConfig		アイテムリスト設定[]
	1:固定湧きの倍数（１～ｘ倍：ランダム）
	2:スペシャルレア・アイテムの湧き割合（０～１）％
	3:ゴミアイテムで占める割合（０～１）％
	※該当するアイテムボックス設定と同等となります
LB_VPoptabMax		格納ポップタブ（30%～ランダム）
LB_Vehicles			車両オブジェクトタイプ定義[]（複数）
	1:タイプ定義名
	2:車両クラス（複数）
※Server側車両湧きや自転車湧きと併用して頂いて構いません
※Server側の車両湧きと置き換えも可能ですが、船湧きは対応してません
※通常は約10mの空間、車両タイプ名が、"poor"は5m、"air/tank/army"だと20mとなります
※自転車／クアッドバイク等は、ダメージ設定対象外となります（"_Bike_"を含む車両）
※壊れてる部位は、部位名の部分一致で調べます

(14)キャンプファイヤ設定
LB_FirePlaceObjs[]	オブジェクト

(15)奇妙オブジェクト設定
LB_StrangeObjs[]	奇妙なオブジェクトのリスト
	1:オブジェクトクラス名
	2:おおよその大きさ（半径m）
	3:道路上に設置可能か？（true/false）
	4:シミュレーションを行うか？（true/false）
※オブジェクトクラス名は、Edenエディタで調べられます（log:コピーペースト可）
※大きさ指定は、その範囲だけ空き地があれば設置可能という意味になります
※シミュレーションは、機能や動作を伴うオブジェクトの場合trueにしてください（扉やファイヤ等）
※デフォルトでは、CUP Terrains MODのオブジェクトが記述されてるので、不要な場合は削除してください

(16)炎上オブジェクト設定
LB_FlamingObjs[]	炎上させるオブジェクトのリスト

(17)トラベラー設定
LB_TravelerGrpMaxAI			１グループのＡＩ数
LB_TravelerItemGrp[]		格納アイテムグループ
LB_TravelerItemCfg			アイテムリスト設定[]
LB_TravelerPoptabMax		最大ポップタブ（30%～ランダム）

(18)アイアンマン設定
アイアンマンを設置します
LB_IronMan[]
	1:場所			[]で空港か軍事施設でランダム湧き
	2:AI数

(19)Exileオブジェクトランダム設置
LB_RandomExileObj[]
	1:オブジェクト名（Land_WaterCooler_01_new_F/Exile_ConcreteMixer）
	1:場所
	2:角度（0-359）　*EdenエディタのRotation-Z値
LB_CleanWaterCount	設置数（-1で全てとなります）
LB_ConcreteMixCount	設置数（-1で全てとなります）
※設置数の指定により、ランダムで選択されます

(20)カスタム看板設定
任意の場所にカスタム看板を設置します
LB_CBillboards[]	任意設置カスタム看板設定
	1:オブジェクト
	2:場所
	3:角度（0-359）　*EdenエディタのRotation-Z値
	4:画像
※EDENエディタで位置と角度をメモしてください
※画像ファイルは、ミッションファイルに格納してください
※看板を目的としていますが、他オブジェクトも変更可能となってます
※テクスチャーを変更できるオブジェクトは決められています
※テクスチャーサイズは、２のべき乗で、jpeg又はpaaである必要があります

(21)マップ文字入れ設定
LB_Maptext[]		マップ文字設定
	1:マップ位置[x,y]
	2:マーカー名（円形描画時は""）
	3:文字又は、円形のブラシ名
	4:色
	5:サイズ（縦横スケール値） *[縦,横]

(22)サーバーメッセージ配信
LB_Bcmessage[]		メッセージ本文
LB_BcmessageTime	配信間隔（秒）

(23)バンディットシティ
LB_BCGroups			グループ数（1グループ3AI）

■■ 参考資料 / Documents
[マップマーカー色]
https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3
[マップマーカータイプ]
https://community.bistudio.com/wiki/cfgMarkers
[ロケーションタイプ]
https://community.bistudio.com/wiki/Location
[爆発物]
ATMine/APERSMine/APERSBoundingMine/SLAMDirectionalMine/APERSTripMine
SatchelCharge_F/DemoCharge_F/Claymore_F/IEDUrbanBig_F/IEDLandBig_F/IEDUrbanSmall_F/IEDLandSmall_F
UnderwaterMine/UnderwaterMineAB/UnderwaterMinePDM
https://community.bistudio.com/wiki/Arma_CfgVehicles_Other
※検索するとオブジェクト画像が見れます(Ctrl+F)
[アイテム種類]
EXILEミッションファイルのconfig.cppを参考に記述してください。
（トレーダー辺りが一覧で見易いかと思います）
[車両ダメージ基本部位]
HitEngine (engine #1)／HitEngine2 (engine #2)／HitEngine3 (engine #3)／HitHRotor (main rotor)／HitVRotor (tail rotor)／HitBatteries (electrical systems)／HitLight (landing light)／HitHydraulics (entire hydraulics system)／HitTransmission (engine transmission)／HitGear (landing gear)／HitFuel (all fuel tanks)／HitHStabilizerL1 (first left horizontal stabilizer)／HitHStabilizerR1 (first right horizontal stabilizer)／HitVStabilizer1 (first vertical stabilizer)／HitTail (tail boom)／HitPitotTube (all pitot tubes)／HitStaticPort (all static ports)／HitStarter1 (starter for engine #1)／HitStarter2 (starter for engine #2)／HitStarter3 (starter for engine #3)／HitAvionics／HitHull／HitMissiles／HitRGlass／HitLGlass／HitGlass1／HitGlass2／HitGlass3／HitGlass4／HitGlass5／HitGlass6
※オブジェクトによって部位は変わります
[人間ダメージ部位]
HitFace／HitNeck／HitHead／HitPelvis／HitAbdomen／HitDiaphragm／HitChest／HitBody／HitArms／HitHands／HitLegs
neck／head／pelvis／spine1／spine2／spine3／body／hands／legs
※当アドオンには関係ない資料
[Arma3内蔵サウンドファイル]
Arma 3: SoundFiles
https://community.bistudio.com/wiki/Arma_3:_SoundFiles
※座標
ASL：Z軸が、水面基準
ATL：Z軸が、地形基準（Z軸は基本使用しない）、橋などは浮いてる扱い
AGL：Z軸が、地形基準（地面に接しない場合など、建物の上とかオブジェクトの上等）
EDENのプロパティでは、AGL座標で表示されているため、海に設置する場合は注意
内部コマンドによっては、それぞれを使い分けないといけない。

-------------------------------------------------------------------------------
■■ ログ内容 / Logging
（情報が若干古めですが、残してます）
ログ出力の先頭は、「[LOOTBOX]::」で始まるようになってます。
かなりの量のログが出力されますので、必要に応じてログ出力を無効にしてください。
ほとんどが、サーバ起動時のログとなりますが、イベント発生時に出力される事があります。

正常な場合以下のログ出力の後、メイン処理に移ります。
コード上に文法エラーがある場合、ここでエラーとなります。
 "[LOOTBOX]:: Loot boxes v1.10 (02-04-2018) starting"
 "[LOOTBOX]:: Loading Config"
 "[LOOTBOX]:: Initialised"
 "[LOOTBOX]:: Starting Loot boxes"

まず最初に、ロケーション作成が実行されます。
 "[LOOTBOX]:: create new location : NameCity:Scrap Yard [5200,11300,0]"

ロケーション設定が見つからなかった場合、以下が出力されます。
マップ上の全ての地名が出力されますので、特定地を対象にしたい場合は、参考にできます。
（空港の扱いはマップによって違うようです）
以下は、"NameLocal"というタイプ名で、"Darbang pass"という地名となります。

 "[LOOTBOX]:: nothing location config : NameLocal:Darbang pass"
 
ロケーションが見つかった場合、場所名と、適用されるロケーション設定値が出力され、
ここから、作成されるアイテムボックス分だけ、以下が繰り返されます。

 "[LOOTBOX]:: found NameCity:Anar [5910.59,5687.44] radius:200 box:5"
	（アイテムボックスが置かれた場合）
 "[LOOTBOX]:: (items:21 trash:6 s-rare:true)"
　"[LOOTBOX]:: put 1/5 [5931.98,7181] House:true Exile_Container_Storagecrate"
	（場所が見つからなかった場合）
　"[LOOTBOX]:: 1/5 canot found places"
※見つからない理由としては、スポーンゾーン／トレーダー／拠点近くの場合があります。

同時にトラップワイヤーが設置された場合は、場所が出力されます。
 "[LOOTBOX]:: trap [5247.08,6070.86]"
 
地雷が設置された場合は、以下のようになります。
 "[LOOTBOX]:: mine 1/2 [5296.96,11317.8,0.0228882]"

バンディットAIを設置した場合は、以下のようになります。
"wp"は、登録したウェイポイント先となります（車両、道路、ガソリンスタンド等）
 "[LOOTBOX]:: AI 2/3 custom [6394.32,11317.6,3.0638]"
 "[LOOTBOX]:: wp 1 [6566.41,10703.9,0.165947] (vehicle)"
 "[LOOTBOX]:: wp 2 [5888.28,11888.3,0.0886993] (vehicle)"
 "[LOOTBOX]:: wp 3 [5924.98,11892.8,0] (road)"
 "[LOOTBOX]:: wp 4 [6394.32,11317.6,3.0638] (cycle)"
建物に立て籠もり状態の場合は、以下のようになります。
　"[LOOTBOX]:: wp : freeze"

車両を設置した場合は、以下のようになります。
 "[LOOTBOX]:: Vehicle 2/4 [1985.16,7764.84,0.164642] rnd:false Exile_Bike_MountainBike"
※"rnd"は、条件が合わなかったために、フィールド上にランダムに置かれたか？と示します
 
トラベラーAIを配置した場合、以下が出力されます。
続けて、ウェイポイント先の町名となります。
　"[LOOTBOX]:: TravelerSpawn 3 Rasman [6080.47,11182,0] 2 AIs"
 "[LOOTBOX]:: wp Nur [1905.47,11777.3,0]"

アイアンマンを設置した場合、以下が出力されます。
 "[LOOTBOX]:: IronMan 1 [100.781,100.781,0] 1 AIs"
 
カスタム看板を設置した場合、以下が出力されます。
 "[LOOTBOX]:: put custom obejct Land_Billboard_F [0,0,0] bill0.jpg"
 
以下のログで完了となります。
 "[LOOTBOX]:: finished! have fun"
 
奇妙オブジェクトに関しては、ゲームとは直接関与しませんので、ログ出力されません。
アイテムの中身もログ出力する場合は、以下のコメントを外してください。

functions/addCargo.sqf
//[format["content:%1",_content]] call LB_fnc_log;
この様に出力されます。
 "[LOOTBOX]:: content:Exile_Item_PlasticBottleFreshWater,Exile_Item_RabbitSteak_Raw,Exile_Item_PlasticBottleFreshWater,Exile_Item_Catfood,Exile_Item_Bullets_556,Exile_Item_Catfood,U_C_Poor_1,Exile_Item_FuelCanisterEmpty,Exile_Item_Dogfood,Exile_Item_InstantCoffee,Exile_Item_InstantCoffee,Exile_Item_InstantCoffee,Exile_Item_MountainDupe,Exile_Item_MountainDupe,Exile_Item_Moobar,Exile_Item_GloriousKnakworst,Exile_Item_Noodles,"

これらログ出力は、LB_OutputLogにて、OFFに出来ます。

-------------------------------------------------------------------------------
■■ ログエラーについて / Errors and remedy
（情報が若干古めですが、残してます）
必ずログファイルを確認して、エラー記述が無いように留意してください。
サーバアドオン起動時は、他のアドオンも並列で動作していますので、同時にログに出力されています。
文法エラーなどの場合は、どのアドオンでエラーになっているのか、判断が難しいので注意してください。

[config.sqf記述ミス]
設定ファイルの記述ミスにより、スクリプトが続行不能になった場合に、以下が出力されます。

"[LOOTBOX]:: failed to read config.sqf ;-("

[オブジェクトモデルの設定]
ログファイルに以下のようなエラーが出力された場合は、ミッション内のmission.sqmのaddons[]に追加する必要があります（使用モデルの追加）
当アドオンに限らず、必要な設定となります。
※LB_StrangeObjsの設定反映時のエラー

Warning Message: You cannot play/edit this mission; it is dependent on downloadable content that has been deleted.
cup_a1_editorobjects

デフォルト設定の場合、以下が必要です（いずれもCUP Terrains MOD）
cup_editor_plants_config
cup_a1_editorobjects
cup_a2_editorobjects

-------------------------------------------------------------------------------
■■ 改造について / Customize
ほとんどの動作部分において、設定が可能なように作られていますが、希望の動作や機能が欲しい場合、お好きなように改造してください。
省略せず、できるだけ分かりやすいように記述したつもりですので、コメント等から箇所を特定できるかと思います。
相談、アイデア等がありましたら、お気軽にご連絡ください。

putBoxes.sqf			メインスクリプト
config.sqf				設定ファイル
initServer.sqf			初期化
config.cpp				アドオン定義
functions/
	addCargo.sqf		コンテナオブジェクト格納
	collectItems.sqf	アイテムリスト生成
	findBuildings.sqf	周囲の建物オブジェクト取得
	getBuildingPos.sqf	建物内のポジション取得
	selectAIGear.sqf	AI装備設定
	isSafePos.sqf		セーフエリアチェック
	log.sqf				ログ出力
	marker.sqf			マップマーカー
	selectAIGear.sqf	AI装備選択
	spawnIronman.sqf	アイロンマン生成
	putSimpleobj		静的オブジェクト生成
	event/				イベント関連
		eh_ContainerOpened.sqf（未使用）
		eh_Dammaged.sqf	ＡＩダメージ時（未使用）
		eh_Engine.sqf	車両エンジンON時
		eh_Fired.sqf	ＡＩ発砲時
		eh_mpKilled.sqf	ＡＩデッド時

o アイアンマンの装備
	selectAIGear.sqf
o グレネードトラップの確立
	eh_Engine.sqf

-------------------------------------------------------------------------------
■■ ライセンス・サポートについて / License & Supports
完全無欠のオープンとなっておりますので、ご自由にご利用ください。
スクリプトコードは、改造も容易ではないかと思います。
ただ、著作の権利を主張するのだけは勘弁してください。
サポートは、当方NGOでもボランティアでも慈善事業のつもりでも御座いませんので、基本的には受け付けません・・が、その時の気分で対応させて頂きます。
その辺はご了承ください。
ご利用の際は、一声頂ければ幸いです。モチベーションのアップと、さらなるバージョンアップへの布石となります。

-------------------------------------------------------------------------------
■■ 既知の問題・バグ / Cockroaches?
o 済：同じ場所に複数個、設置される場合がある
o 済：アイテムボックスから取り出せない
o 済：変な場所にアイテムボックスが湧く
o 済：AI装備がおかしくなる（DMS側の問題？）
	サーバ起動時の負荷が、若干関係してます
o --:アイアンマンの装備が安定しない
o --:処理に時間が掛かる
	安全な場所にオブジェクトを設置するため、その計算に時間が掛かってます
	オブジェクトのサイズ等を小さくする事で、回避可能になります
	（StrangeObjectなら、サイズ指定の数値）

-------------------------------------------------------------------------------
■■ たぶん開発者らしいnabekから / from Dev.nabek
遊びまくったEXILEとMODコミュニティに、小さな恩返しのつもりでアドオンを開発しました。
無論、私のサーバで実現したかった事のひとつが、これだった訳でもありますけども。
かなり後出しになってしまいましたが、世界のどこかのサーバで稼働してたら嬉しい。
この文書を、各国語版にしたいのですが、（無報酬ですが）ご協力していただけたら、幸いです。
（独語・仏語・英語・ロシア語辺りがあれば完璧なんだろうけども）

ご連絡の際は、ブログの方にコメントください。
当アドオンの開発日記も書いてます。
blog.ahh.jp (use tag search:arma3)

当アドオンを利用してくれてる猛者サーバさんもいらっしゃってるようで嬉しい限りです。
当アドオンに入れるかどうか迷ってるんですが、新しいアイデアもいくつかあります。
TODO:
	o 自販機
		誰にも見られずにエロ本が買える?!
	o 大きな町の外れに、スラム街を設置
		スラム街だけでのミッションを置くとか
	o　町バンディット戦車
		驚異のバンディットAI
	o 済：サーバ独自のマップロケーション設置の支援
	o 済：カスタム看板設置の支援
	o 色々なマップでの動作確認
		済：Takistan
		－：Altis
		－：Stratis
		－：Malden
		－：Tanoa
		済：Chenarus
		－：bornholm
		－：Esseker
		－：Taunus
		－：taviana
		－：tavi
		（ご報告お待ちしてます！！）

当方管理のExileサーバもよろしくなッ！（未稼働2019/1現在）
m9(　ﾟдﾟ)！！

	[サーバ名]
	[JP]鯖味噌:Saba-Miso Exile|PvP|Takistan
	[マップ]
	Takistan　（CUP Terrains mod）
	[タイプ]
	ハードコア過ぎるサバイバル、PvP
	[稼働時間]
	JST 18:00 - 24:00

※サーバ名は変更されるかもしれません
※2000円激貧PCで運用しております（詳細はブログで）
※AMD FM1-A6-3650　4Cores 3.6Ghz!!

以上です。お疲れ様でした。とても疲れた。
(；´Д｀)3...give me smoke

-------------------------------------------------------------------------------
■■ 更新履歴 / Change logs
2019/02/13 V1.4
バンディットシティ機能の追加、ランダムExileオブジェクト機能増加（コンクリートミキサー、トレーダー）
Ammoマガジンの残弾数をランダム（マッチ等の残数アイテム全て）、ゴミアイテムによるアイテム削除機能の追加
建物のドアをランダムで開く、アイアンマンAI湧きポイント調整、バンディットのデフォ設定見直し
町＆トラベラーAIのウェイポイントをセーフゾーン内に設定しないように修正
マップテキスト機能に円形ドロー追加、コンクリートミキサー設置機能、マップ上テキスト配置に文字のみを追加
箱に、Exile_Item_OldChestKitを追加、バンディットAIに臆病度をランダムで適用（0-0.3）
設定デフォルト値の調整、エロ本（はずれ）LOOT設定の追加、ソースコードの整理、高速化、当文書加筆

2018/05/17 V1.3
アイアンマン（無敵AI）機能追加、GPSトラップ機能追加、グレネードトラップ機能追加、サーバーメッセージ配信機能追加
キャンプファイヤー設置機能追加、マップ文字入れ機能追加、水汲み場設置機能追加
"Exile_Magazine_10Rnd_9x39"（スナイパー用）を固定湧きにしていたので移動
ロケーション数と処理位置をログ出力、Readmeの加筆修正

2018/04/21 V1.2
車両湧きで、稀に接触があるのを修正、奇妙オブジェクトの負荷率低下（SimpleObject化）
AI動作バグ取り、AIパトロール機能の追加＆調整、炎上オブジェクト機能の追加、ログを見やすく若干修正
アイテムボックス生成時バグ修正、オリジナルロケーション作成機能の追加
地雷設置バグ修正、カスタム看板機能の追加、アイテムボックス固定湧き機能の追加
ＡＩカスタム装備の追加（selectAIGear.sqfファイルの追加）
デフォルト設定値の見直し、全ファイル改行コードをLFに更新
トラベラーAI機能の追加

2018/04/10 V1.1 据え置き
デフォルト設定値の記述ミス、Readmeの加筆修正

2018/04/03 V1.1
AIリーダー忘れ、スナイパー設定追加、ロケーション位置自動調整、ログ出力周り改変、config見やすく改変、起動待機の追加
コンテナ許容量エラーチェック、コンテナへアイテム追加時コード書き直し、奇妙オブジェクトシミュレーションフラグ追加
ポップタブ計算方法変更、セーフエリアの除外追加（トレーダー／スポーン／各拠点）、アイテム50%集計の改変
車両湧きの追加、負荷が掛かりそうな処理後にウェイト挿入、アイテムボックス及びＡＩの沸き場所の調整、各湧き要素の位置調整
総当たりデバッグ作業

orz..

*English documents(UTF,tab:4)
*Versionings: look at (config.cpp)
*Change log at End of doc.
*We are looking for someone who can translate this document　;-)
(Japanese => German,French,Russian etc..)

|	LOOT BOX for Arma3 EXILE MOD(Server-Addon)
|		to Arma3 All Communities,Survivors,Bohemia
|	アイテム漁りに小さな幸せを・・　/ for beggar-man
|	"a3_exile_lootbox"
|	*if u want support? blog.ahh.jp (Japanese only)
|	*included documents "readme_en.txt" but japanese only.
|	*currently working on "readme_en.txt" for english (yukihito23)
|	*If anyone is interested in translating!(French,German etc.)
|
|	Dev&Auth.：nabek 2018/4-
|	Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)
|	Discord : https://discord.gg/b4FT278
|	GitHub : https://github.com/nabeky/a3_exile_lootbox
|	Blog : http://blog.ahh.jp/?tag=arma3
|	Server : [JP]鯖味噌:Saba-Miso Exile|PvP|Takistan
|	
|	Special Thanks!
|		yukihito23, Losty
|
|	Manual （English）
|		Index
|		* Overview (EN translated)
|		* Environment (EN translated)
|		* Description (EN translated)
|		* Installation (EN translated)
|		* Settings
|		* License & Supports (EN translated)
|		* from Dev.nabek (EN translated)
|		* Documents (EN translated)
|		* Change logs (EN translated)
|дﾟ)
-------------------------------------------------------------------------------
## Overview

This is a server side addon mod for Arma3 Exile servers.
This addon is focused on providing additional experiences around "towns" and "cities" on your prefered map.
Majority of the functionality will work out of the box by just copying in to your server addon directory as it reads and utilizes map data to adjust itself.
There is no need to set anything inside your mp_mission.pbo for this addon to work.

This addon has been developed to try to get players to explore to towns and landmarks which oftenly are barren in default Exile game play.
For looting, this addon will create a lootbox somewhere outside, or indoors of random towns. (apart from Exile loot spawn system.)
The lootboxes oftenly have some random items, poptabs, trash which would benefit bambie players. (There is also a module which will spawn landmines near these lootboxes so be aware!)
This addon has it's own vehicle spawning system which tries to spawn vehicles in a further natural way. (apart from Exile vehicle spawning system.)
There are various additiona functioanlity this addon supports which should provide players with some nice experiences when playing.

I have tried to do my best in writing the code in an easily understand format but if you need to modify it, please do so.
This addon only requires DMS to execute (for it's AI spawning functionality.)

# Changes mainly around the location engine
  * Locational variables will be read directly from the map
    * add-on will auto evaluate what map you're using and run
	* Even if map is changed, it will understand
	* above excludes in case a specific coordinate for a map is specified
  * Spawns loot boxes in random towns
    * Lootboxes will spawn either inside or outside houses in towns
    * Loot contents can be configured easily (Such as there are 3 tiers you can set the lootbox size to be depending on size of town.)
    * Capable of setting wiretrap mines around lootboxes for that extra entertainment
  * Magazine type items will now have a random value
    * Items such as ammo magazines, matches, grenades will have random remaining quantity
  * Spawns random vehicles and aircrafts around in/near random towns
    * Vehicles can be customized to have random damage and item content inside inventory
    * Vehicles will try its best to spawn near buildings, not out in the open fields
    * Capable of setting GPS and grenade traps around these vehicles for that extra entertainment
  * Spawns bandit AI in random towns
    * AI will spawn inside buildings and can garrison or wander around town
    * AI will also patrol near petrol stations, spawned vehicles and along roads
    * Depending on the latitude of location, there is a possibility of a sniper attributed AI spawning
  * Spawns landmines around towns
    * landmines will be placed mainly on roads
  * Spawns unusual objects, objects with fire effects randomly in towns
    * You would be able to provide a bit of a different experience for players
    * You will be able to spawn trash, broken vehicles around towns
  * Buildings will have a random percentage the doors are open
    * Ability to make it harder to track down other players
  * Places random campfires around the map
    * This will give a nice feeling to night time as well as provide lucky players with a fire to cook
  * Spawns traveling AI
    * AI will traven from town to town
    * Players will have higher possibility of encountering these traveling AI between locations
  * Spawns "Iron Miller" AI (Invinsible)
	* "Iron Miller" doesn't like any of you, you would be best staying away from him
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
  * Broken gas stations (NEW! v1.5)
    * Random gas stations on the map will be "broken"
	* Auto refuel won't work but crafting will still work
  * Traveling Trader (NEW! v1.5)
    * Trader will be traveling across the map on foot


Lootbox addon will execute and run along with other addons the server has (possible to configure so lootbox stops and waits if other addons are using up resource.)
Lootbox addon will continue to execute even if players has joined session
(Above is something to do with the Arma3 engine, other addons react similary)
* test results: on CUP Takistan (Windows/Ryzen 1400) around 1 minute 50 seconds for addon to fully execute

-------------------------------------------------------------------------------
## Environment
Arma3 1.92.145539　(64bit/32bit)
Arma3 Dedicated Server
Windows 10 Home/Professional
Linux(Ubuntu 16.04LTS/17.10/18.04LTS)

Required MOD:
	Exile MOD Server 1.0.3a/1.0.4a(Pineapple)
	https://www.exilemod.com/
Required Addon:DMS/Defent's Mission System　Server
	https://www.exilemod.com/topic/61-dms-defents-mission-system/

Below will be needed to unpack/pack the pbo.
	PBO Manager
	http://www.armaholic.com/page.php?id=16369
Great text editor to use to change config values and such
	Notepad+
	https://notepad-plus-plus.org/
	* Visual Code is a good alternative as well
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
If a player shoots at these AI, they will mark a general location of the player on the map (aka, GPS trap)
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

[Bandit AI town invasions]
A random CapitalCity will be invaded by bandit AI
You will be able to speficy the amount of groups (1 group has 3 AI)
This will not have any lootboxes like other mission type addons
Within the selected town, vehicles (which can not be used by player) and objects are spawned
The lowest latitude point within the realm will be utilized for this spawn
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

[Broken Gas Stations]
Gas stations on the map can be set to be broken from auto refuel with a percentage
if specifying as "0", then this function will not run
if specifying as "1", then all gas stations will be broken from auto refuel
Auto Refuel will be broken but crafting will still work
    Technical Background:
	The function will execute based on possibility of value you define

[Traveling Trader]
The Traveling Trader is set to walk from waypoint to waypoint.
Waypoint selection order is set randomly
If several different traders are set, they will start from different waypoints.
When a player gets near with their weapon down, the traveling trader will react to trades.
If in case player has a radio equiped, they will hear noise broadcasting through their radio when a traveling trader is within 500m.
The Traveling Trader is set to me immortal but due to arma engine, sometimes this does not fully work,
in this situation if a player kills the trader, the player will receive a penalty.
If player attacks trader = -5% of respect
If player kills trader = -30% respect
+ if trader is killed, then the killer player name will be broadcasted within server
    Technical Background:
	The Traveling Trader is set side as WEST so the AI should ignore him, though there might need to be some adjustments made in sides for other sides which may coexist on the map (such as zombies)

-------------------------------------------------------------------------------
## Installation
Unpack a3_exile_lootbox.pbo and do whatever needed to tweak
※You will need PBO Manager or something to unpack and repack
※This readme（readme_en.txt）is unneeded for execution of addon so you may delete if you want
Repack a3_exile_lootbox.pbo

Place the addon pbo inside within Exile's @ExileServer/addons/ directory
Exile will automatically load the addon at startup
Depending on your edits, you will need to edit your mission file as well
Run server and verify no problems are observed from your server rpt logs

-------------------------------------------------------------------------------
## Settings
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
 
[Setups]
Please the usual Arma3 script syntax and proceed with care.
Majority of add-on follows similar rules to basic programing language.
If in case something is wrong, the add-on will generate errors.

	* [], {}, "" will always be in sets
	* and the end of a row, always be sure to have a ";" (semicolon)
	* for sections which are inside [] (brackets), always be sure to separate with commas (,)
	* Double-Byte characters may not be used within the code. (It's ok for comments)
	* Encoding is set to "UTF-8".
	* As for end of line code, please relate to the OS you are using. （Windows：CR/LF、Linux：LF）
	* When specifying an object, call against it's correct classname
	* Locations specifying a value does not mean it will always use that value
	(If an error may happen, the execution may be skipped, thus defiled value is expected max value)
	* for percentage values use in format of 0.00 - 1.00 (1 = 100&)


	[core files]
	config.sqf				// Configuration file
	putBoxes.sqf			// Function
	./functions/			// commonly used script directory
	readme_en.txt			// This file may be deleted when actually using

[./config.sqfファイル]
LB_DebugMode				// Debug mode On/Off
LB_OutputLog				// Generate logs? yes/no
LB_PendingTime				// Delay time(seconds) for execution at server start
* If in case there are other performance heavy add-ons which run at startup, you can smooth out the startup sequence by setting delay for this add-on

(1)Marker Settings
LB_MapMarker				// Display markers on map Yes/No
LB_MapMarkerColor			// Marker Colors
LB_MapMarkerType			// Marker Types
LB_MapMarkerColorMine		// traps
LB_MapMarkerTypeMine
LB_MapMarkerColorAI			// Bandit AI's
LB_MapMarkerTypeAI
LB_MapMarkerColorAITr		// Traveler AI's
LB_MapMarkerTypeAITr
LB_MapMarkerColorST			// Random/Burning Objects
LB_MapMarkerTypeST
LB_MapMarkerColorVehicle	// Spawned Vehicles
LB_MapMarkerTypeVehicle
* View default values for examples

(2)Container Object Settings
LB_BoxObjClass_indoor[]		// Item Box types (outdoors)
LB_BoxObjClass_outdoor[]	// Item Box types (indoors)
* Specify what container object shall be utilized
* Depending on what is specified, it may get in the way of other add-ons or scripts
(Using "Exile_Container_SupplyBox" seems to interfere with supply drop locations）

 // Still translating below... (yukihito23) //

(3)Location Type Settings
LB_Locations[]				//Target Location Type
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

-------------------------------------------------------------------------------
## License & Support
This work is protected by Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0) and obtaining, copying, using any of the content will mean you agree to the license included.
  * This work is protected by the specified license and the Dev & Author "nabek" has not given up his rights.
  * This work is not allowed to be used for commercial purposes.
  * The Dev & Author "nabek" is "NOT" obligated to provide support for this work.
  * The Dev & Author "nabek", "may" provide support if asked nicely and he feels like doing so.
  * If using, it would be nice if Dev & Author "nabek" can be notified so he can keep his motivation up for future updates. (Please note, Dev & Author "nabek" does NOT utilize English as his first language.)

[Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)]
You are free to:
Share — copy and redistribute the material in any medium or format
Adapt — remix, transform, and build upon the material
The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:
Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
NonCommercial — You may not use the material for commercial purposes.
No additional restrictions — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

Notices:
You do not have to comply with the license for elements of the material in the public domain or where your use is permitted by an applicable exception or limitation.
No warranties are given. The license may not give you all of the permissions necessary for your intended use. For example, other rights such as publicity, privacy, or moral rights may limit how you use the material.

Summary Format: https://creativecommons.org/licenses/by-nc/4.0/
Full Format: https://creativecommons.org/licenses/by-nc/4.0/legalcode

-------------------------------------------------------------------------------
## from Dev.nabek
I have made this add-on as a small return gift to the Exile community for the endless hours I have played and enjoyed this game mode.
This add-on was originally developed for my own Exile Server but I wish to release this to the public so other server owners are able to utilize it. I would be happy if this add-on is used somewhere in the world =)

I would like to ask if anyone is interested in translating this document (for free), such as to German, French, Russian, etc..)

You can contact Dev & Author "nabek" from below blog
(I also write updates about this add-on, if interested)
blog.ahh.jp (use tag search:arma3)

Discord (Saba-Miso Server)
https://discord.gg/q96R9pe

I'm glad there are already several server owners which seem interested in this add-on so far!
Below maybe some new features I "may" introduce

TODO:
	* Vending Machines
		* Able to get your redgull fix anytime
	* Placement of slums near large towns
		* Maybe generate missions inside these slums
	* Confirmed maps this add-on will work
		Takistan (Done!)
		Altis
		Stratis
		Malden
		Tanoa
		Chenarus (Done!)
		bornholm
		Esseker
		Taunus
		taviana
		tavi
		(If any other maps have been confirmed, please let me know.)

if interested in my server, you can find it from below.
m9(　ﾟдﾟ)！！

	[Server Name]
	[JP]鯖味噌:Saba-Miso Exile|PvP|Takistan
	[Map]
	Takistan　（CUP Terrains mod）
	[Type]
	Seriously Hardcore survival, PvP
	[Operation Hours]
	Japan Standard Time 18:00 - 24:00

* Sever name may change in the future
* Server is running on a 20 dollar machine
* AMD FM1-A6-3650　4Cores 3.6Ghz!!

I would like to thank the following for translations, ideas and technical advice.
	* yukihito23
	* Losty

I'm also searching for anyone which would like to join me. (of course, in Japanese language)
(debugging, ideas, coding, etc...)

Aaaaaand, that's it. I'm tried, I mean...really tired.
(；´Д｀)3...needing some smokes

-------------------------------------------------------------------------------
## Documents
[Map Marker Coloing]
https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3

[Map Marker Types]
https://community.bistudio.com/wiki/cfgMarkers

[Location Types]
https://community.bistudio.com/wiki/Location

[Explosives]
ATMine/APERSMine/APERSBoundingMine/SLAMDirectionalMine/APERSTripMine
SatchelCharge_F/DemoCharge_F/Claymore_F/IEDUrbanBig_F/IEDLandBig_F/IEDUrbanSmall_F/IEDLandSmall_F
UnderwaterMine/UnderwaterMineAB/UnderwaterMinePDM
https://community.bistudio.com/wiki/Arma_CfgVehicles_Other
* Easy to find things by doing a search(Ctrl+F)

[Items]
Please have a look inside the Exile config.cpp file.
(somewhere around traders might be easy to view)

[Vehicle Damage]
HitEngine (engine #1)／HitEngine2 (engine #2)／HitEngine3 (engine #3)／HitHRotor (main rotor)／HitVRotor (tail rotor)／HitBatteries (electrical systems)／HitLight (landing light)／HitHydraulics (entire hydraulics system)／HitTransmission (engine transmission)／HitGear (landing gear)／HitFuel (all fuel tanks)／HitHStabilizerL1 (first left horizontal stabilizer)／HitHStabilizerR1 (first right horizontal stabilizer)／HitVStabilizer1 (first vertical stabilizer)／HitTail (tail boom)／HitPitotTube (all pitot tubes)／HitStaticPort (all static ports)／HitStarter1 (starter for engine #1)／HitStarter2 (starter for engine #2)／HitStarter3 (starter for engine #3)／HitAvionics／HitHull／HitMissiles／HitRGlass／HitLGlass／HitGlass1／HitGlass2／HitGlass3／HitGlass4／HitGlass5／HitGlass6
* parts differ depending on object

[Human Damage]
HitFace／HitNeck／HitHead／HitPelvis／HitAbdomen／HitDiaphragm／HitChest／HitBody／HitArms／HitHands／HitLegs
neck／head／pelvis／spine1／spine2／spine3／body／hands／legs
 * Really doens't have anything to do with this add-on for now.

[Arma3 Sound Files]
Arma 3: SoundFiles
https://community.bistudio.com/wiki/Arma_3:_SoundFiles

-------------------------------------------------------------------------------
## Change logs
2019/05/18 V1.5
Specified license
Added function for random broken gas stations
Added function for bandit AI's to respawn
Modified AI spawn locations a bit
Added static loot-box functionality to have some random values
Added StatusReporter functionality to provide set timer logs
Removed some default config settings requiring CUP
Optimized code
Rearranged Code
Cleaned around in logs
Deleted unneeded code
Merged a lot of code to main

2019/02/13 V1.4
Added Bandid City functionality
Added more random Exile related object spawns (concrete mixers, traders, lockers)
Added functionality to randomize contents of magazine type items
Added functionality to have extra trash layer in item spawns
Added functionality to randomly open building doors
Modified Iron Miller spawn points a bit
Relooked at bandit AI default settings
Modified so traveling AI don't come near safe zones
Added a new draw method for draw to map functionality
Added functionality to place concrete mixers
Added fear factor to bandit AI (random 0 to 0.3)
Relooked at default settings again
Added trash loot
Cleaned code
Optimized code
Added/Modified readme
Changed "Iron Man" to "Iron Miller"

2018/05/17 V1.3
Added "Iron Man" functionality
Added GPS Trap functionality
Added Grenade trap functionality
Added server message functionality
Added camp fire functionality
Added draw to map functionality
Added water source object placement functionality
Made "Exile_Magazine_10Rnd_9x39" to a static spawn so moved it around
Added functionality to log location engine related results
Added/Modified readme

2018/04/21 V1.2
Fixed some situations of vehicles touching other objects at spawn time, optimized random object spawner module (made objects in to SimpleObjects)
Fixed some bugs around AI movement, Added functionality for AI Patrole, Added burning objets, modified logs for better readability.
Fixed bug which may happen at time of loot-box spawn, Added functionality for original location creation function
Fixed bug around landmines, added functionality to place custom signs, added functionality to spawn loot-boxes at set coordinates.
Added custom AI equipment (selectAIGear.sqf)
Modified default settings
Added traveling AI functionality

2018/04/10 V1.1
Fixed default settings value bugs
Added/Modified readme

2018/04/03 V1.1
Forgot about AI leaders..., added sniper settings, added stuff around location engine, cleaned config, added wait time for boot execution. Added container capacity error check, rewite on code to add items to container, simulation flag for random objects module, changed poptab calculations, added blacklist for safe areas (traders, spawn, bases), changed function around item handling, added vehicle spawn module, added wait for functions which may take longer execution time, modified loot box and AI spawn locations, modified around spawning functionality, debug debug and debug....

orz..
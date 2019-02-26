*English documents(UTF,tab:4)
*Version look to (config.cpp)
*Change log to End of doc.
*We are looking for someone who translates this document　;-)
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
    * Lootbox will randomly spawn either outside or inside houses
    * Loot contents can be configured easily (Such as there are 3 tiers you can set the lootbox size to be depending on size of town.)
    * Capable of setting wiretrap mines around loot boxes for that extra entertainment  
  * Spawns random vehicles and aircrafts around in/near random towns
    * Vehicles can be customized to have different tiers of damage and items
    * Vehicles will mainly spawn near buildings, not on roads our out in the open
    * Capable of setting GPR and grenade traps around these vehicles for that extra entertainment
  * Spawns bandit AI in random towns
    * AI will spawn inside buildings and can garrison or wander around town
    * AI will also wander around near petrol stations, spawned vehicles and on roads
    * Depending on the latitude of location, there is a possibility of sniper AI spawning
  * Spawns landmines around towns
    * landmines will be placed mainly on roads
  * Spawns defined objects, objects with fire effects in random towns
    * You would be able to provide a bit of a differente experience to players
    * You will be able to spawn trash, broken vehicles around towns
  * Buildings will have a random percentage the doors are open
    * Erases other players footstep marks on the ground
  * Places random campfires around the map
    * This will give a nice feeling to night time as well as provide lucky players with a fire to cook
  * Spawns traveling AI
    * AI will traven from town to town
    * Players will have higher possibility of encountering these traveling AI between locations
  * Spawns a so-called "Iron-Man" AI (does not die)
    * "Iron Man" is a bandit with high self-healing capability
    * "Iron Man" will not drop any items or provide any respect
  * GPS Traps
    * When found by AI, your location will be marked on map
    * There is a certail percentage AI will mark map if you turn on a found vehicle
    * (Above functionality only works for AI spawned by this addon)
  * Grenade Traps
    * There is a certail percentage a grenade trap goes off if you turn on a found vehicle
    * (Above will either be smoke or mini grenades)
  * Town invasion by bandit AI
    * A random town will be invaded by bandit AI
    * This system will not have any loot rewards

# Others
  * This addon will work out of the box
    * This addon will read needed values from the map directly
    * This addon will work on different maps without problem
    * (Above is true unless you customize it to have a static location value)
  * Ammo inside magazines will be random
    * Any spawned loot item with a magazine type system will become random
  * Water source and concrete mixers can be placed (can be configured to be random)
    * Various Exile related objects can be set to spawn randomly
  * Function to add custom location names on the map
  * Function to add desired text on the map
    * Function to add map markers as well
    * (double-byte language text is hard to read)
  * Functionality to add custom signs
    * Signs can use graphic files you want to use
    * If the given object supports texture changes, it doesn't have to be a sign object
  * Supports sending out server messages
    * Supports sending canned messages to all players on the server at set interval time

Lootbox addon will execute and run along with other addons the server has (possible to configure so lootbox stops and waits if other addons are using up resource.)
Lootbox addon will still keep running even if players log in to the server after restart
(Above is something to do with the Arma3 engine, other addons react the same)
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

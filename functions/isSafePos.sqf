/*
	1:position
	2:black list([z,y,z],radius)
	
	return:boolean
*/
params ["_pos","_blacklist"];

if(_pos isEqualTo [])exitWith{false};
private _isInRange = false;
{
	if (((_x#0) distance2D _pos) < _x#1) exitWith{_isInRange = true;};
}forEach _blacklist;
if(_isInRange) exitWith{false};

if([_pos, LB_BLTrader] call ExileClient_util_world_isTraderZoneInRange) exitwith {false};
if([_pos, LB_BLSpawnZone] call ExileClient_util_world_isSpawnZoneInRange) exitwith {false};
if([_pos, LB_BLTerritory] call ExileClient_util_world_isTerritoryInRange) exitwith {false};

true
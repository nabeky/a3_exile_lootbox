/*
	1:position
	2:black list([z,y,z],radius)
	
	return:boolean
*/
private ["_pos","_blacklist","_isInRange"];

_pos = _this select 0;
_blacklist = _this select 1;

_isInRange = false;
{
	if (((_x select 0) distance2D _pos) < _x select 1) exitWith
	{
		_isInRange = true;
	};
}forEach _blacklist;
if(_isInRange) exitWith{false};

if([_pos, LB_BLTrader] call ExileClient_util_world_isTraderZoneInRange) exitwith {false};
if([_pos, LB_BLSpawnZone] call ExileClient_util_world_isSpawnZoneInRange) exitwith {false};
if([_pos, LB_BLTerritory] call ExileClient_util_world_isTerritoryInRange) exitwith {false};

true
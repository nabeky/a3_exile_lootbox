// use:Iron-Man(clear body&respawn)

//[format["MPKilled %1",_this]] call LB_fnc_log;

private["_arg","_unit","_pos","_group"];
_arg = _this;
_unit = _arg select 0;
_unit removeAllMPEventHandlers "mpkilled";
_unit removeAllEventHandlers "fired";
_unit removeAllEventHandlers "dammaged";
_unit removeAllMPEventHandlers  "mphit";
[_unit] join grpNull;

_pos = getPos _unit;
"SmokeShell" createVehicle _pos;

// delete
{_unit removeWeaponGlobal _x;} forEach (weapons _unit);
{_unit unlinkItem _x;} forEach (assignedItems _unit);
{_unit removeItem _x;} forEach (items _unit);
removeAllItemsWithMagazines _unit;
removeHeadgear _unit;
removeUniform _unit;
removeVest _unit;
removeBackpackGlobal _unit;
[_unit]spawn{uisleep 2;deleteVehicle (_this select 0);};
//_unit enableSimulationGlobal true;
//_unit setVariable ["ExileDiedAt",time];
_group = _unit getVariable "LB_Group";

// respawn
//_group = createGroup [LB_BanditSide,true];
_group setVariable ["DMS_LockLocality",nil];
_group setVariable ["DMS_SpawnedGroup",true]; 
_group setVariable ["DMS_Group_Side","bandit"];
_group setVariable ["DMS_AllowFreezing",true];
_group setVariable ["DMS_isGroupFrozen",true];
_group setVariable ["LB_FireCount",time];

_group move _pos;
[_group,_pos,300] call bis_fnc_taskPatrol;
_group setCombatMode "RED";
_group setBehaviour "COMBAT";

[_group,_pos]spawn{uisleep 2;_unit = [_this select 0,_this select 1] call LB_fnc_spawnIronman;};
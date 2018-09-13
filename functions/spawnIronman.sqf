/*
	1:group
	2:position
	
	return:
	_unit
*/
private ["_group","_pos","_cgear","_unit"];

_group = _this select 0;
_pos = _this select 1;

_cgear = "IRON" call LB_fnc_selectAIGear;
_unit = [_group,_pos,"custom","hardcore","bandit","soldier",_cgear] call DMS_fnc_SpawnAISoldier;
_unit setVariable ["LB_Group",_group];
_unit setVariable ["DMS_AI_Money",0];	// no poptabs
_unit setVariable ["DMS_AI_Respect",0];	// no respects
_unit allowFleeing 0;
_unit setDamage 0;
_unit addMPEventHandler ["mpkilled","_this call LB_eh_mpkilled"];
_unit addEventHandler ["Fired","_this call LB_eh_fired"];
_unit addEventHandler ["HandleDamage",{0}];
_unit addEventHandler ["Dammaged","(_this select 0) setDammage 0"];
//[_unit] joinSilent grpNull;
[_unit] joinSilent _group;
_unit allowDamage false;
_unit setName "Iron-man";
reloadEnabled _unit;
if(needReload _unit == 1)then{reload _unit};
//removeUniform _unit;	// wut!?
//removeVest _unit;	// wut!?
_unit
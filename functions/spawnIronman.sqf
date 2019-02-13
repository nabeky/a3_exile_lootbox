/*
	1:group
	2:position
	
	return:
	_unit
*/
private ["_group","_pos","_unit"];

_group = _this select 0;
_pos = _this select 1;

_unit = [_group,_pos,"custom","hardcore","bandit","soldier",
	"IRON" call LB_fnc_selectAIGear] call DMS_fnc_SpawnAISoldier;
//[0.5,{
//	params["_unit","_group"];
	_unit setVariable ["LB_Group",_group];
	_unit setVariable ["BIS_enableRandomization", false];
	_unit setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_unit setVariable ["DMS_AI_Money",0];	// no poptabs
	_unit setVariable ["DMS_AI_Respect",0];	// no respects
	_unit allowFleeing 0;
	_unit setDamage 0;
	_unit addMPEventHandler ["mpkilled","_this call LB_eh_mpkilled"];
	_unit addMPEventHandler ["MPHit", "(_this select 0) setDammage 0"];
	_unit removeAllEventHandlers "HandleDamage";
	_unit removeAllEventHandlers "Dammaged";
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
//	},
//	[_unit,_group],
//	false,
//	false
//] call ExileServer_system_thread_addTask;
	
_unit
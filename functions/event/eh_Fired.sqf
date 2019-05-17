// use:Bandit map-mark

params ["_unit"];
private _grp = group _unit;
if(time - (_grp getVariable "LB_FireCount") < 60)exitWith{};
_grp setVariable ["LB_FireCount",time];

_unit spawn{
	params ["_unit"];
	private _grp = group _unit;
	private _pos = _unit getPos [100+floor(random 50),getDir _unit];
	["LB_GPS#"+(groupId _grp),_pos,"mil_dot_noShadow","ColorBlack",0.7] call LB_fnc_marker;
	//format["GPS trap %1 %2",_pos,groupId _grp] call LB_fn_log;
	"Bandit : " + selectRandom [
		"Encountered a f**ker!",
		"Who is that?!",
		"What the f**k!!",
		"Kill that guy!",
		"Is that a Survivor?"
		] remoteExecCall ["systemChat",-2];
};
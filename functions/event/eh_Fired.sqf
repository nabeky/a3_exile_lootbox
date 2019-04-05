// use:Bandit map-mark

//[format["Fired %1",_this]] call LB_fnc_log;

_arg = _this;

_unit = _arg select 0;
_grp = group _unit;
_time = _grp getVariable "LB_FireCount";
if(time - _time < 60)exitWith{};
_grp setVariable ["LB_FireCount",time];

[_unit]spawn
{
	_unit = _this select 0;
	_grp = group _unit;

	_pos = _unit getPos [100+floor(random 50),getDir _unit];
	_name = groupId _grp;
	["LB_GPS#"+_name,_pos,"mil_dot_noShadow","ColorBlack",0.7] call LB_fnc_marker;
	[format["GPS trap %1 %2",_pos,_name]] call LB_fnc_log;
	"Bandit : " + selectRandom [
		"Encountered a f**ker!",
		"Who is that?!",
		"What the f**k!!",
		"Kill that guy!",
		"Is that a Survivor?"
		] remoteExecCall ["systemChat",-2];
};

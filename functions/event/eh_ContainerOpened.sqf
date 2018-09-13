// use:Item-box trap
// this code broken.. ;-(

[format["ContainerOpened %1",_this]] call LB_fnc_log;

_arg = _this;
_box = _arg select 0;
_attach = _box getVariable "LB_Attach";
_indoor = _box getVariable "LB_InDoor";
_opened = _box getVariable "LB_Opened";

if(_opened)exitWith{};
_box setVariable ["LB_Opened",true];
_box removeAllEventHandlers "ContainerOpened";

if(random 1 > 0.3)exitWith{};
_pos = getPos _box;
_name = str(_pos select 0)+"_"+str(_pos select 1);
["LB_GPS#"+_name,_pos,"mil_dot_noShadow","ColorBlack",0.7] call LB_fnc_marker;
[format["GPS trap %1",_pos]] call LB_fnc_log;

[_box] spawn
{
	sleep 2;
	_attach createvehicle position _box;
};
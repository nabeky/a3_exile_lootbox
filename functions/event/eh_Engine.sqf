// use:Vehicle trap

//[format["Engine %1",_this]] call LB_fnc_log;

_arg = _this;
_vehicle = _arg select 0;
_state = _arg select 1;
_attach = _vehicle getVariable "LB_Attach";
_started = _vehicle getVariable "LB_Started";

if !(_state)exitWith{};
_vehicle setVariable ["LB_Started",true];
_vehicle removeAllEventHandlers "Engine";

if(random 1 > 0.5)exitWith{};
_pos = getPos _vehicle;
if(random 1 > 0.5)then
{
	_name = str(_pos select 0)+"_"+str(_pos select 1);
	["LB_GPS#"+_name,_pos,"mil_dot_noShadow","ColorBlack",0.7] call LB_fnc_marker;
	[format["GPS trap %1",_pos]] call LB_fnc_log;
}
else
{
	[format["Granade trap %1",_pos]] call LB_fnc_log;
	[_vehicle,_attach] spawn
	{
		sleep 2;
		(_this select 1) createVehicle position (_this select 0);
	};
};

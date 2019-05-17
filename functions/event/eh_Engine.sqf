// use:Vehicle trap

//[format["Engine %1",_this]] call LB_fnc_log;

params ["_vehicle","_state"];

if!(_state)exitWith{};

_vehicle removeAllEventHandlers "Engine";
if(random 1 > 0.5)exitWith{};

_vehicle setVariable ["LB_Started",true];
private _attach = _vehicle getVariable "LB_Attach";
private _started = _vehicle getVariable "LB_Started";
private _pos = getPos _vehicle;
if(random 1 > 0.5)then{
	[format["LB_GPS#%1_%2",_pos#0,_pos#1],_pos,"mil_dot_noShadow","ColorBlack",0.7] call LB_fnc_marker;
	//[format["GPS trap %1",_pos]] call LB_fnc_log;
}else{
	[format["Granade trap %1",_pos]] call LB_fnc_log;
	[_vehicle,_attach] spawn{
		sleep 2;
		(_this#1) createVehicle position (_this#0);
	};
};

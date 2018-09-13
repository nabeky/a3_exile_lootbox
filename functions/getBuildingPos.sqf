/*
	1:building object
	*BIS_fnc_isBuildingEnterable is True object
	
	return:
	0:[] all positions
	1:entrance position(no.1)
	2:nearest position (from entrance no.1)
	3:furthest position (from entrance no.1)
	4:higher position
	5:lowest position
	6:nearest road position(100m radius:Nothing [])
	
	*use to ASLToATL(AGLToASL( ))
*/
private ["_c_bl"];
_c_bl = _this select 0;

private ["_r_allpos","_r_exitpos","_r_nearpos","_r_furthpos","_r_highpos","_r_lowpos","_r_nearroad"];
_r_nearpos = [];
_r_furthpos = [];
_r_highpos = [];
_r_lowpos = [];
_r_nearroad = [];

private ["_di","_neardis","_furthdis","_higher","_lower","_roaddis","_pos","_road"];
_neardis = 100;
_furthdis = -100;
_lower = 100;
_higher = -100;
_roaddis = 100;

_r_allpos = _c_bl buildingPos -1;
_r_exitpos = _c_bl buildingExit 0;
if(isNil"_r_exitpos" or _r_exitpos isEqualTo [0,0,0])then
{
	_r_exitpos = _r_allpos select 0;// orz..
};
{
	if(_x select 2 < _lower)then
	{
		_lower =_x select 2;
		_r_lowpos = _x;
	};
	if(_x select 2 > _furthdis)then
	{
		_furthdis = _x select 2;
		_r_highpos = _x;
	};
	_di = _r_exitpos distance _x;
	if(_di < _neardis)then
	{
		_neardis = _di;
		_r_nearpos = _x;
	};
	if(_di > _furthdis)then
	{
		_furthdis = _di;
		_r_furthpos = _x;
	};
	_pos = ASLToATL(AGLToASL(_x));
	_road = [_pos, 100, []] call BIS_fnc_nearestRoad;
	if !(isNull _road)then
	{
		_di = getPos _road distance _pos;
		if(_di < _roaddis)then
		{
			_roaddis = _di;
			_r_nearroad = _x;
		};
	};
}foreach _r_allpos;

//[format["getBuildingPos(%1 %2 %3 %4 %5 %6)",_r_exitpos,_r_nearpos,_r_furthpos,_r_lowpos,_r_highpos,_r_nearroad]] call LB_fnc_log;

[_r_allpos,_r_exitpos,_r_nearpos,_r_furthpos,_r_lowpos,_r_highpos,_r_nearroad]
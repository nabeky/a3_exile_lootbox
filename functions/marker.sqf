/*
	1:marker name(uniq)
	2:position
	3:marker type
	4:marker color
	5:alpha
	6:text
	7:size[w,h]
	
	return:
	-
*/
private ["_name","_pos","_type","_color","_alpha","_text","_size","_Marker"];

_this call
{
	_name = param[0,""];
	_pos = param[1,[0,0,0]];
	_type = param[2,"Empty"];
	_color = param[3,"ColorWhite"];
	_alpha = param[4,0.7];
	_text = param[5,""];
	_size = param[6,[1,1]];
};

if(_name isEqualTo "") exitWith{};
if !(LB_MapMarker)then
{
	if !((_name find "LB_GPS#") > -1)exitWith {};
};

_Marker = _name;
if((getMarkerType _name) isEqualTo "")then
{
	_Marker = createMarker [_name,_pos];
};
_Marker setMarkerPos _pos;
_Marker setMarkerType _type;
_Marker setMarkerShape "ICON";
_Marker setMarkerColor _color;
_Marker setMarkerBrush "SolidFull";
_Marker setMarkerText _text;
_Marker setMarkerAlpha _alpha;
_Marker setMarkerSize _size;
_Marker
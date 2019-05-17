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
private ["_name","_pos","_type","_color","_alpha","_text","_size","_Marker","_ok"];

_this call{
	_name = param[0,""];
	_pos = param[1,[0,0,0]];
	_type = param[2,"Empty"];
	_color = param[3,"ColorWhite"];
	_alpha = param[4,0.7];
	_text = param[5,""];
	_size = param[6,[]];
};

if(_name isEqualTo "")exitWith{};
_ok = true;
if !(LB_MapMarker)then
{
	_ok = false;
	if ((_name find "LB_GPS#") > -1)then{_ok = true;};
	if ((_name find "LB_BANDITCITY") > -1)then{_ok = true;};
	if ((_name find "LB_REOBJ") > -1)then{_ok = true;};
	if ((_name find "LB_MAPTEXT") > -1)then{_ok = true;};
	if ((_name find "LB_BFUEL") > -1)then{_ok = true;};
};
if !(_ok)exitWith{};

_Marker = _name;
if((getMarkerType _name) isEqualTo "")then
{
	_Marker = createMarker [_name,_pos];
};
//_Marker setMarkerPos _pos;

if(_type isEqualTo "")then{
	// Ellipse
	_Marker setMarkerShape "ELLIPSE";
	if!(_color isEqualTo "")then{_Marker setMarkerColor _color;};
	if!(_text isEqualTo "")then{_Marker setMarkerBrush _text;};
	_Marker setMarkerAlpha _alpha;
	if!(_size isEqualTo [])then{_Marker setMarkerSize _size;};
}else{
	// Marker icon
	_Marker setMarkerType _type;
	_Marker setMarkerShape "ICON";
	if!(_color isEqualTo "")then{_Marker setMarkerColor _color;};
	_Marker setMarkerBrush "SolidFull";
	if!(_text isEqualTo "")then{_Marker setMarkerText _text;};
	_Marker setMarkerAlpha _alpha;
	if!(_size isEqualTo [])then{_Marker setMarkerSize _size;};
};
_Marker
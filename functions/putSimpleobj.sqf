/*
	1:object class name
	2:position(ASL)
	3:angle
	
	return:
	-
*/
private ["_className","_pos","_spawned","_temp","_tpos","_vectorDirUp","_model","_vehicle","_angle"];

_this call
{
	_className = param[0,""];
	_pos = param[1,[0,0,0]];
	_angle = param[2,nil];
};
if(isnil"_angle")then{
	_angle = floor(random 360);
};

_temp = _className createVehicleLocal _pos;
_temp setDir _angle;
_tpos = getPosWorld _temp;
_vectorDirUp = [vectorDir _temp, vectorUp _temp];
_model = getModelInfo _temp select 1;
deleteVehicle _temp;

if((count _pos) > 2)then{
	_vehicle = createSimpleObject [_model, _pos];
}else{
	_vehicle = createSimpleObject [_model, _tpos];
};
if!(isNil"_vehicle")then{
	_vehicle setVectorDirAndUp _vectorDirUp;
};

_vehicle
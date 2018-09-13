/*
	1:cargo
	2:items
	3:poptabs
	4:trash items(fill mode)
*/
private["_cargo","_items","_poptabs","_trash","_content"];

_cargo = _this select 0;
_items = _this select 1;
_poptabs = _this select 2;
_trash = _this select 3;

clearMagazineCargoGlobal _cargo;
clearWeaponCargoGlobal _cargo;
clearItemCargoGlobal _cargo;
clearBackpackCargoGlobal _cargo;
_cargo setVariable ["ExileMoney",0,true];

_content = "";
{
	if !(_cargo canAdd _x)exitWith{};
	_itemType = _x call BIS_fnc_itemType;
	switch(_itemType select 0)do{
		case "Weapon":{_cargo addWeaponCargoGlobal [_x, 1]};
		case "Magazine":{_cargo addMagazineCargoGlobal [_x, 1]};
		case "Backpack":{_cargo addBackpackCargoGlobal [_x, 1]};
		case "Item";
		case "Equipment";
		default {_cargo addItemCargoGlobal [_x, 1]};
	};
	_content = _content + _x + ",";
} foreach _items;

// fill mode
if(count _trash > 0)then
{
	while{_cargo canAdd _x}do
	{
		_cargo addItemCargoGlobal [selectRandom _trash, 1];
	};
};

//[format["content:%1",_content]] call LB_fnc_log;

_cargo setVariable ["ExileMoney", _poptabs, true];
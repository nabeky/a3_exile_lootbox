/*
	1:cargo
	2:items (item random-count)
	3:poptabs
	4:trash items(fill mode)
*/
params ["_cargo","_items","_poptabs","_trash"];

private["_content","_ammoCount","_name"];

clearMagazineCargoGlobal _cargo;
clearWeaponCargoGlobal _cargo;
clearItemCargoGlobal _cargo;
clearBackpackCargoGlobal _cargo;
_cargo setVariable ["ExileMoney",0,true];

//_content = "";
{
	if !(_cargo canAdd _x)exitWith{};
	_itemType = _x call BIS_fnc_itemType;
	switch(_itemType select 0)do{
		case "Weapon":{_cargo addWeaponCargoGlobal [_x, 1]};
		case "Magazine":
		{
			_ammoCount = getNumber(configFile >> "CfgMagazines" >> _x >> "count");
			if(_ammoCount > 1)then{
				_cargo addMagazineAmmoCargo [_x, 1,floor(random _ammoCount)+1];
			}else{
				_cargo addMagazineCargoGlobal [_x, 1]; 
			};
		};
		case "Backpack":{_cargo addBackpackCargoGlobal [_x, 1]};
		case "Item";
		case "Equipment";
		default {_cargo addItemCargoGlobal [_x, 1]};
	};
//	_content = _content + _x + ",";
} foreach _items;

// fill mode
if(count _trash > 0)then{
	while{_name = selectRandom _trash;_cargo canAdd _name}do{
		_cargo addItemCargoGlobal [_name,1];
	};
};
//[format["content:%1",_content]] call LB_fnc_log;

_cargo setVariable ["ExileMoney", _poptabs, true];
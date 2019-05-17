/*
	1:item group name
	2:
	[
		1:static-item multiple
		2:special-rare rate
		3:trash rate
	]
	3:enable fixed item(bool)

	return
	0:array:item list
*/
params ["_gname","_itemconfig","_ffixed"];
_itemconfig params ["_smulti","_srare","_trash"];

private["_lootGroup","_ItemsList","_val","_item","_cnt","_rst","_j"];

// loot item list
_lootGroup = nil;
{
	if(_x#0 isEqualTo _gname)exitWith{_lootGroup = _x#1;};
}foreach LB_LootGroups;
if(isNil {_lootGroup})exitWith{
	[format["nothing loot group name : %1",_gname]] call LB_fnc_log;
[]};
_lootGroup params ["_C_lootStatic","_C_loot50p","_C_lootRare"];

_ItemsList = [];
// add items(fixed)
if(_ffixed)then{
	_ItemsList append LB_LootAllFixedItems;
};

// add items(static)
if(count _C_lootStatic > 0)then{
	for "_j" from 1 to (floor(random _smulti)+1) do{
		_ItemsList append _C_lootStatic;
	};
};

// add items(50%)
_cnt = count _C_loot50p;
if(_cnt > 0)then{
	_rst = [];
	for "_j" from 1 to (floor(_cnt / 2)) do{
		_val = floor(random _cnt);
		while{(_rst pushBackUnique _val) isEqualTo -1}do{
			_val = (_val + 1) % _cnt;
		};
	};
	{
		_ItemsList pushBack (_C_loot50p select _x);
	}foreach _rst;
};

// add items(rare)
if(count _C_lootRare > 0)then{
	_ItemsList pushBack (selectRandom _C_lootRare);
};

// add special rare
_srareOn = false;
if(random 1 < _srare) then{
	_ItemsList pushBack (selectRandom LB_SRareItems);
	_srareOn = true;
};

// shuffle list
_ItemsList = _ItemsList call ExileClient_util_array_shuffle;

// replace trash
_rst = [];
_cnt = count _ItemsList;
for "_j" from 1 to (floor(_cnt * _trash)) do{
	_val = floor(random _cnt);
	while{(_rst pushBackUnique _val) isEqualTo -1}do{
		_val = (_val + 1) % _cnt;
	};
};
{
	_item = selectRandom LB_TrashItems;
	if!(_item isEqualTo "")then{
		_ItemsList set [_x,_item];	// replace
	};
}foreach _rst;

//format["(items:%1 trash:%2 s-rare:%3)",count _ItemsList,(floor((count _ItemsList) * _trash)),_srareOn] call LB_fn_log;
//format["items:%1",_ItemsList] call LB_fn_log;

_ItemsList
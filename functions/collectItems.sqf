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
private["_gname","_itemconfig","_smulti","_srare","_trash","_ffixed","_automag","_lootGroup"];
private["_C_lootStatic","_C_loot50p","_C_lootRare","_ItemsList","_retlist"];
private["_val","_mul","_item","_cnt","_cntStep","_rst","_sst","_j"];

_gname = _this select 0;
_itemconfig = _this select 1;
_smulti = _itemconfig select 0;
_srare =  _itemconfig select 1;
_trash =  _itemconfig select 2;
_ffixed = _this select 2;

// loot item list
_lootGroup = nil;
{
	if(_x select 0 isEqualTo _gname)exitWith
	{
		_lootGroup = _x select 1;
	};
}foreach LB_LootGroups;
if(isNil {_lootGroup})exitWith
{
	[format["nothing loot group name : %1",_gname]] call LB_fnc_log;
	[];
};

_C_lootStatic = _lootGroup select 0;
_C_loot50p = _lootGroup select 1;
_C_lootRare = _lootGroup select 2;

_ItemsList = [];
// add items(fixed)
if(_ffixed)then
{
	{
		_ItemsList pushBack _x;
	} foreach LB_LootAllFixedItems;
};

// add items(static)
{
	_mul = floor(random _smulti) + 1;
	for "_j" from 1 to _mul do
	{
		_ItemsList pushBack _x;
	};
} foreach _C_lootStatic;

// add items(50%)
_cnt = floor((count _C_loot50p) / 2);
_rst = [];
for "_j" from 1 to _cnt do
{
	_val = floor(random (count _C_loot50p));
	while{(_rst pushBackUnique _val) isEqualTo -1}do
	{
		_val = (_val + 1) mod (count _C_loot50p);
	};
};
{
	_ItemsList pushBack (_C_loot50p select _x);
}foreach _rst;

// add items(rare)
if((count _C_lootRare > 0))then
{
	_item = selectRandom _C_lootRare;
	_ItemsList pushBack _item;
};

// add special rare
_srareOn = false;
if(random 1 < _srare) then
{
	_item = selectRandom LB_SRareItems;
	_ItemsList pushBack _item;
	_srareOn = true;
};

// shuffle list
for "_j" from 1 to floor((count _ItemsList) / 2) do
{
	_vl = floor(random (count _ItemsList))+1;
	_cnt = floor(random ((count _ItemsList) - _vl))+1;
	_rst = _ItemsList select [_vl,_cnt];
	_ItemsList deleteRange [_vl,_cnt];
	_ItemsList = _rst + _ItemsList;
	if(random 1 >= 0.5)then{
		reverse _ItemsList;
	};
};

// replace trash
_cnt = floor((count _ItemsList) * _trash);
_rst = [];
for "_j" from 1 to _cnt do
{
	_val = floor(random (count _ItemsList));
	while{(_rst pushBackUnique _val) isEqualTo -1}do
	{
		_val = (_val + 1) mod (count _ItemsList);
	};
};
{
	_ItemsList set [_x, selectRandom LB_TrashItems];	// replace
}foreach _rst;

_retlist = [];
{
	if!(_x isEqualTo "")then{
		_retlist pushBack _x;
	};
}foreach _ItemsList;

//[format["(items:%1 trash:%2 s-rare:%3)",count _ItemsList,_cnt,_srareOn]] call LB_fnc_log;

_retlist
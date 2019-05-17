/*
	1:"" or type
	*DMS "custom class" spec.

	return:
	[] Custom gear(DMS_fnc_SpawnAISoldier)
*/
private["_arg","_uniform","_vest","_headgear","_weapon","_weaponAttachments","_magazines","_pistol","_pistolAttachments","_assignedItems","_launcher","_backpack"];
private["_AIItem","_AIUniforms","_AIVests","_AIHeadgear","_AIWeapon","_AIAttach","_AIHGun","_AIHgunAttach","_AIAssign","_AILauncher","_AIBackpack"];
private["_ironman","_j"];
_arg = toUpper _this;

_ironman = false;

// Iron-Miller
if(_arg isEqualTo "IRON")then
{
	_ironman = true;
	_AIUniforms = ["Exile_Uniform_BambiOverall"];
	_AIVests = ["V_PlateCarrierGL_mtp"];
	_AIHeadgear = ["Exile_Headgear_SantaHat"];
	_AIBackpack = ["B_Carryall_oli"];
	_AIWeapon = ["MMG_01_hex_F"];
	_AIAttach = ["acc_flashlight","optic_AMS_snd","bipod_02_F_hex"];//muzzle_snds_93mmg_tan
	_magazines = [["HandGrenade",2]];
	_AIHGun = [];
	_AIHgunAttach = [];
	_AIAssign = [];//["Exile_Headgear_GasMask"];
	_AIItem = [];
	_AILauncher = [];
}else{
	_AIUniforms = LB_BanditUniforms;
	_AIVests = LB_BanditVests;
	_AIHeadgear = LB_BanditHeadgear;
	_AIWeapon = LB_BanditWeapon;
	_AIAttach = LB_BanditWeaponAttach;
	_AIHGun = LB_BanditPistol;
	_AIHgunAttach = LB_BanditPistolAttach;
	_AIAssign = LB_BanditAssignedItems;
	_AILauncher = LB_BanditLauncher;
	_AIBackpack = LB_BanditBackpack;
	_AIItem = LB_BanditItem;
	_magazines = [];
};

if(count _AIItem > 0)then{
	for "_j" from 1 to round((count _AIItem)/2) do{
		_magazines pushBack [selectRandom _AIItem,1];
	};
};

_uniform = "";
_vest = "";
_headgear = "";
_weapon = "";
_pistol = "";
_weaponAttachments = [];
_pistolAttachments = [];
_launcher = "";
_backpack = "";
if(count _AIUniforms > 0)then {_uniform = selectRandom _AIUniforms;};
if(count _AIVests > 0)then {_vest = selectRandom _AIVests;};
if(count _AIHeadgear > 0)then {_headgear = selectRandom _AIHeadgear;};
if(count _AIWeapon > 0)then {_weapon = selectRandom _AIWeapon;};
if(count _AIAttach > 0)then {_weaponAttachments = [selectRandom _AIAttach];};
if(count _AIHGun > 0)then {_pistol = selectRandom _AIHGun;};
if(count _AIHgunAttach > 0)then {_pistolAttachments  = [selectRandom _AIHgunAttach];};
if(count _AILauncher > 0)then {_launcher = selectRandom _AILauncher;};
if(count _AIBackpack > 0)then {_backpack = selectRandom _AIBackpack;};
_assignedItems = _AIAssign;

if !(_ironman)then{
	if(random 1 < 0.5)then {_weaponAttachments = [""];};
	if(random 1 < 0.5)then {_pistolAttachments = [""];};
	if(random 1 < 0.2)then {_backpack = "";};
	if(random 1 < 0.4 OR isNil "_launcher")then {_launcher = "";};
};

if(_weapon != "")then{
	_mags = getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines");
	_magazines pushBack [selectRandom _mags,3+round(random 3)];
};
if(_pistol != "")then{
	_mags = getArray(configFile >> "CfgWeapons" >> _pistol >> "magazines");
	_magazines pushBack [selectRandom _mags,2+round(random 3)];
};
if(_launcher != "")then{
	_mags = getArray(configFile >> "CfgWeapons" >> _launcher >> "magazines");
	_magazines pushBack [selectRandom _mags,1];
};
[
_weapon,
_weaponAttachments,
_magazines,
_pistol,
_pistolAttachments,
_assignedItems,
_launcher,
_headgear,
_uniform,
_vest,
_backpack
]
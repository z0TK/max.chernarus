_fort = _this select 3;

//_fort setflagtexture "\ca\ca_e\data\flag_ger_co.paa"; //this pushes my freekin filepath globaly!
//changeflag = _fort;
//publicVariable "changeflag"; //other clients

_pos = getposATL _fort;
_marker = format ["icon%1",_fort];
_marker setMarkerColor "ColorGreen";
_marker setMarkerSize [.8,.8];

_patrols = _fort getVariable "marks";

_trig = _fort getVariable "trig";
hint str _trig;
{
  _statements = triggerStatements _x;
  _fact = "BAF";
  _skill = [5,10];
  _spRadius = 100;
  _num = 1;

  _spawn = format [
    "[%1,'%2','%3',%4,%5,%6] spawn upsSpawner;[thisTrigger] spawn trigdelay",
    _pos, _fact, _patrols select 0, _skill, _spRadius, _num
  ];
  _statements set [1,_spawn];
  _x setTriggerStatements _statements;
} foreach _trig;

[player, nil, rSIDECHAT, format ["%1 is ours",_fort]] call RE;
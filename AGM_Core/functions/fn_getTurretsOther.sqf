/*
 * Author: commy2
 *
 * Get the turret indices of other turrets (not gunner, commander, copilot or ffv).
 *
 * Argument:
 * 0: Vehicle type (String)
 *
 * Return value:
 * Turret index of the vehicles gunner. Empty array means no other turrets. (Array)
 */

private ["_vehicle", "_turrets", "_turret", "_config"];

_vehicle = _this select 0;

_turrets = [_vehicle] call AGM_Core_fnc_getTurrets;

_turret = [];
{
  _config = configFile >> "CfgVehicles" >> _vehicle;

  _config = [_config, _x] call AGM_Core_fnc_getTurretConfigPath;

  if (  getNumber (_config >> "isCopilot") != 1
    && {getNumber (_config >> "primaryGunner") != 1}
    && {getNumber (_config >> "primaryObserver") != 1}
    && {getNumber (_config >> "isPersonTurret") != 1}
  ) then {
    _turret pushBack _x;
  };
} forEach _turrets;
_turret

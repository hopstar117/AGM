/*
 * Author: KoffeinFlummi
 *
 * Weapon Resting Initialization
 *
 */

BWA3_weaponRested = false;
BWA3_restedPosition = [0,0,0];

0 spawn {
  waituntil {!isNull (findDisplay 46)};
  (findDisplay 46) displayAddEventHandler ["KeyDown", {_this call BWA3_Resting_fnc_keyInput;}];
};
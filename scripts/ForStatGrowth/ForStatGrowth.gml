global.haruStats = [
    {strength: 4, hp: 15, mp: 5},//level 1
    {strength: 5, hp: 17, mp: 6},//level 2
    {strength: 6, hp: 20, mp: 8},//level 3
    {strength: 7, hp: 22, mp: 10},//level 4
    {strength: 9, hp: 24, mp: 12},//level 5
    {strength: 10, hp: 26, mp: 14},//level 6
    {strength: 11, hp: 31, mp: 16},//level 7
    {strength: 13, hp: 38, mp: 18},//level 8
    {strength: 14, hp: 46, mp: 21},//level 9
    {strength: 15, hp: 50, mp: 25}//level 10
];

global.mayaStats = [
    {strength: 2, hp: 10, mp: 20},//level 1
    {strength: 3, hp: 10, mp: 23},//level 2
    {strength: 3, hp: 16, mp: 23},//level 3
    {strength: 4, hp: 16, mp: 26},//level 4
    {strength: 5, hp: 18, mp: 26},//level 5
    {strength: 5, hp: 18, mp: 29},//level 6
    {strength: 5, hp: 20, mp: 29},//level 7
    {strength: 5, hp: 20, mp: 32},//level 8
    {strength: 6, hp: 20, mp: 32},//level 9
    {strength: 6, hp: 20, mp: 50}//level 10
];

function ApplyLevelStats(_unit){
    var _index = clamp(_unit.level - 1, 0, 9);
    var _stats;
    var runes;
    
    if (_unit.name == "Haru") {
        _stats = global.haruStats[_index];
        runes = global.haru_runes;
    }
    else if (_unit.name == "Maya") {
        _stats = global.mayaStats[_index];
        runes = global.maya_runes;
    }
    else {
        return;
    }
    
    // === Get rune bonuses ===
    var bonus_hp = 0;
    var bonus_str = 0;
    var bonus_mp = 0;
    
    if (runes[0] > 0) bonus_hp = global.rune_stats.red[clamp(runes[0] - 1, 0, 4)];
    if (runes[1] > 0) bonus_str = global.rune_stats.yellow[clamp(runes[1] - 1, 0, 4)];
    if (runes[2] > 0) bonus_mp = global.rune_stats.blue[clamp(runes[2] - 1, 0, 4)];
    
    // === Apply base stats + rune bonuses ===
    _unit.strength = _stats.strength + bonus_str;
    _unit.hpmax = _stats.hp + bonus_hp;
    _unit.mpmax = _stats.mp + bonus_mp;
    
    // Keep HP/MP within valid range
    _unit.hp = clamp(_unit.hp, 0, _unit.hpmax);
    _unit.mp = clamp(_unit.mp, 0, _unit.mpmax);
    
    // Debug output to verify it's working
    show_debug_message(_unit.name + " stats updated:");
    show_debug_message("Level: " + string(_unit.level) + ", Base STR: " + string(_stats.strength) + " + Rune: " + string(bonus_str) + " = " + string(_unit.strength));
    show_debug_message("Runes: " + string(runes[0]) + "," + string(runes[1]) + "," + string(runes[2]));
}












//function ApplyLevelStats(_unit) {
    //var _index = clamp(_unit.level - 1, 0, 9);
    //var _stats;
//
    //if (_unit.name == "Haru") {
        //_stats = global.haruStats[_index];
    //}
    //else if (_unit.name == "Maya") {
        //_stats = global.mayaStats[_index];
    //}
    //else {
        //return;
    //}
//
    //// Default final stats = base stats only (no runes yet)
    //_unit.strength = _stats.strength;
    //_unit.hpmax    = _stats.hp;
    //_unit.mpmax    = _stats.mp;
//
    //// Fully restore on level up
    //_unit.hp = _unit.hpmax;
    //_unit.mp = _unit.mpmax;
//}

//global.gold = 10000;

// Haru and Maya rune levels: [Red, Yellow, Blue]
if (!variable_global_exists("haru_runes")) global.haru_runes = [0, 0, 0];
if (!variable_global_exists("maya_runes")) global.maya_runes = [0, 0, 0];

// Stat bonuses per rune level
global.rune_stats = {
    red:    [2, 4, 6, 8, 10], //for hp
    yellow: [3, 6, 9, 12, 15], //for attack
    blue:   [2, 4, 6, 8, 10]  //for mana
};


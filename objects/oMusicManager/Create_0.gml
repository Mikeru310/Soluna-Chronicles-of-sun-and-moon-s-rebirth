// =====================================================
// oMusicSystem - CREATE EVENT (COMPLETE VERSION)
// Place in your MAIN MENU room, set to PERSISTENT
// =====================================================

// Initialize ALL globals FIRST (before checking them!)
if (!variable_global_exists("in_battle")) global.in_battle = false;
if (!variable_global_exists("current_music")) global.current_music = noone;
if (!variable_global_exists("previous_music")) global.previous_music = noone;
if (!variable_global_exists("music_id")) global.music_id = -1;

// ⭐⭐⭐ AUDIO SETTINGS (ADD MASTER_VOLUME) ⭐⭐⭐
if (!variable_global_exists("music_volume")) global.music_volume = 0.8;
if (!variable_global_exists("sound_volume")) global.sound_volume = 1.0;
if (!variable_global_exists("master_volume")) global.master_volume = 1.0;
if (!variable_global_exists("music_enabled")) global.music_enabled = true;
if (!variable_global_exists("sound_enabled")) global.sound_enabled = true;

// Define ALL your music assets
global.music_forest = Final_Quest___Peaceful_Town;
global.music_plain = Final_Quest___World_Map;
global.music_swamp = Final_Quest___Adventurer_s_End;
global.music_mountain = Final_Quest___Peaceful_Village;
global.music_cave = Final_Quest___Dangerous_Dungeon;
global.music_battle = Final_Quest___Battle_Approacing_New;
global.music_menu = Final_Quest___Gentle_Moments;
global.music_interior = Final_Quest___Gentlest_Moments;
global.music_boss_battle = Final_Quest___Big_Battle;
global.music_game_over = Final_Quest___Game_Over_Intro;


shop_music = Shop_song;

// Make this object persistent
persistent = true;



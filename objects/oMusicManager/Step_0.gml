/// oMusicSystem - Step Event

// Don't play music during battles
if (global.in_battle) exit;

// ⭐ Don't play music during cutscenes (check if obj_cutscene exists)
if (instance_exists(obj_cutscene)) exit;

// ⭐ SPECIAL CASE: Game Over room has its own music handling
if (room == rm_GameOver) exit;

// Detect which music should be playing based on room name
var room_name = room_get_name(room);
var target_music = noone;

// Determine target music based on room
if (string_pos("FOREST", room_name) > 0) {
    if (string_pos("CAVE", room_name) > 0) {
        target_music = global.music_cave;
    } else {
        target_music = global.music_forest;
    }
}
else if (string_pos("PLAIN", room_name) > 0) {
    target_music = global.music_plain;
}
else if (string_pos("SWAMP", room_name) > 0) {
    target_music = global.music_swamp;
}
else if (string_pos("MOUNTAIN", room_name) > 0) {
    target_music = global.music_mountain;
}
else if (string_pos("INTERIOR", room_name) > 0 || string_pos("HOUSE", room_name) > 0 || string_pos("SHOP", room_name) > 0) {
    target_music = global.music_interior;
}
else if (room == rm_mainmenu1) {
    target_music = global.music_menu;
}

// If we've determined a target music and it's not currently playing, start it
if (target_music != noone && global.current_music != target_music) {
    
    // Stop current music
    if (global.current_music != noone && audio_is_playing(global.current_music)) {
        audio_stop_sound(global.current_music);
    }
    
    // Start new music
    global.music_id = audio_play_sound(target_music, 10, true);
    audio_sound_gain(target_music, global.music_volume * global.master_volume, 0);
    global.current_music = target_music;
    
    show_debug_message("🎵 Music System: Started " + audio_get_name(target_music));
}
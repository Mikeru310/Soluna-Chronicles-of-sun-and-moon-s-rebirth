if (!variable_global_exists("cutscenes_played")) {
    global.cutscenes_played = [];
}

// ⭐ INITIALIZE AUDIO GLOBALS IF THEY DON'T EXIST
if (!variable_global_exists("music_volume")) global.music_volume = 0.8;
if (!variable_global_exists("sound_volume")) global.sound_volume = 1.0;
if (!variable_global_exists("master_volume")) global.master_volume = 1.0;
if (!variable_global_exists("current_music")) global.current_music = noone;
if (!variable_global_exists("previous_music")) global.previous_music = noone;

// If this trigger was already used, remove it immediately
if (array_contains(global.cutscenes_played, trigger_id)) {
    instance_destroy();
    exit;
}



if (!global.bosses[0]) {
    show_debug_message("❌ Boss 1 not defeated yet - cutscene won't trigger");
    instance_destroy();
    exit;
}

// ═══════════════════════════════════════════════════════
// ⭐⭐⭐ STOP ALL MUSIC FOR CAVE CUTSCENE ⭐⭐⭐
// ═══════════════════════════════════════════════════════
if (global.in_battle) {
    global.in_battle = false;
    show_debug_message("⚠️ Battle flag still active - cleaning up");
}

// Force stop ALL music (battle, boss, and cave music)
if (audio_is_playing(global.music_battle)) {
    audio_stop_sound(global.music_battle);
    show_debug_message("🛑 Stopped normal battle music");
}

if (audio_is_playing(global.music_boss_battle)) {
    audio_stop_sound(global.music_boss_battle);
    show_debug_message("🛑 Stopped BOSS battle music");
}

if (audio_is_playing(global.music_cave)) {
    audio_stop_sound(global.music_cave);
    show_debug_message("🛑 Stopped cave music");
}

// Stop ANY currently playing music
if (global.current_music != noone && audio_is_playing(global.current_music)) {
    audio_stop_sound(global.current_music);
    show_debug_message("🛑 Stopped current music: " + audio_get_name(global.current_music));
}

// Clear music state - cutscene will be SILENT
global.current_music = noone;
show_debug_message("🔇 Scene 4 cutscene - ALL MUSIC STOPPED (silent)");

// ═══════════════════════════════════════════════════════

// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {
    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);
    // Pass the trigger ID to the cutscene controller
    controller.trigger_id = trigger_id;
    controller.cutscene_steps = [
         // ⭐ Make sure cave music is stopped (should already be stopped, but just in case)
         {type:"stop music"},
         {type:"move camera", move_x:0, move_y:80, speed:1},
         {type:"create actor", actor:Actor_elder, x_pos:253, y_pos:220},
         {type:"dialogue", text_id:"scene 4 dialogue 1"},
         {type:"move character", actor:Actor_elder, move_x:253, move_y:159, speed:1},
         {type:"move character", actor:Actor_elder, move_x:106, move_y:159, speed:1},
         {type:"move character", actor:Actor_elder, move_x:106, move_y:100, speed:1},
         {type:"wait", time:0.5},
         {type:"dialogue", text_id:"scene 4 dialogue 2"},
         {type:"wait", time:0.5},
         {type:"move multiple characters", actors:[{actor:obj_player, move_x:92, move_y:114, speed:3, move_sprite:right_idle_haru}, {actor:Actor_elder, move_x:137, move_y:114, speed:1}]},
         {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
         {type:"dialogue", text_id:"scene 4 dialogue 3"},
         {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
         {type:"dialogue", text_id:"scene 4 dialogue 4"},
         {type:"move character", actor:obj_player, move_x:92, move_y:144, speed:1, move_sprite:going_down_haru},
         {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
         {type:"dialogue", text_id:"scene 4 dialogue 5"},
         {type:"move character", actor:Actor_elder, move_x:137, move_y:144, speed:1},
         {type:"move character", actor:Actor_elder, move_x:108, move_y:144, speed:1},
         {type:"wait", time:0.7},
         {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
         {type:"dialogue", text_id:"scene 4 dialogue 6"},
         {type:"wait", time:1},
         {type:"dialogue", text_id:"scene 4 dialogue 7"},
         {type:"wait", time:0.5},
         {type:"dialogue", text_id:"scene 4 dialogue 8"},
         {type:"wait", time:0.5},
         {type:"dialogue", text_id:"scene 4 dialogue 9"},
         {type:"wait", time:0.5},
         {type:"dialogue", text_id:"scene 4 dialogue 10"},
         {type:"move character", actor:Actor_elder, move_x:125, move_y:144, speed:1},
         {type:"dialogue", text_id:"scene 4 dialogue 11"},
         {type:"wait", time:1},
         {type:"dialogue", text_id:"scene 4 dialogue 12"},
         {type:"wait", time:0.5},
         {type:"dialogue", text_id:"scene 4 dialogue 13"},
         {type:"wait", time:0.5},
         {type:"dialogue", text_id:"scene 4 dialogue 14"},
         {type:"move character", actor:Actor_elder, move_x:157, move_y:144, speed:1},
        // ----------------------------------------------------------
        // ⭐ MAIN QUEST PROGRESS – SCENE 4 = FINAL STAGE (4)
        // ----------------------------------------------------------
        {type:"main quest progress", stage:4},
         {type:"dialogue", text_id:"scene 4 dialogue 15"},
         
         // ⭐⭐⭐ When moving to interior, START interior music ⭐⭐⭐
         {type:"play music", music:global.music_interior}
         // Add your room transition here if needed:
         // {type:"change room", room:rm_interior}
    ];
    
    controller.active = true;
    // remove the trigger from the room
    instance_destroy();
}
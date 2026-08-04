if (!variable_global_exists("cutscenes_played")) {
    global.cutscenes_played = [];
}


global.scene8_cutscene = true;


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

// ⭐ CHECK: Only trigger this cutscene if boss 1 is defeated
if (!variable_global_exists("bosses")) {
    global.bosses = [false, false, false, false]; // Initialize if needed
}
//if (!global.bosses[0]) {
    //instance_destroy();
    //exit;
//}

// ⭐ STOP BATTLE MUSIC AND PLAY PLAIN MUSIC
global.in_battle = false;

// Stop any currently playing music (battle or otherwise)
if (audio_is_playing(global.music_id)) {
    audio_stop_sound(global.music_id);
}


// Stop battle music specifically (if using a separate battle music variable)
if (variable_global_exists("music_boss_battle") && audio_is_playing(global.music_boss_battle)) {
    audio_stop_sound(global.music_boss_battle);
}

// ⭐ START PLAIN MUSIC (replace with your actual sound asset name)
global.music_id = audio_play_sound(Final_Quest___World_Map, 1, true);
audio_sound_gain(global.music_id, global.music_volume * global.master_volume, 0);

// Set asset, not instance
global.current_music = Final_Quest___World_Map;
global.previous_music = Final_Quest___World_Map;


// Continue with cutscene...

//if (!global.bosses[0]) exit;
// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {
    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);

    // Pass the trigger ID to the cutscene controller
    controller.trigger_id = trigger_id;  //<-- this line allows the cutscene to know it's from "trigger_id"

    controller.cutscene_steps = [
         
        {type:"move camera", move_x:100, move_y:1250, speed:2},
        {type:"move multiple characters", actors:[{actor:obj_player, move_x:224, move_y:1334, speed:1, move_sprite:going_left_sides_haru}, {actor:obj_follower, move_x:288, move_y:1334, speed:1, move_sprite:going_left_sides_haru}]},
        {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
        {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1}, 
        {type:"move camera", move_x:100, move_y:650, speed:2},
        {type:"wait", time:0.9},
        {type:"move character", actor:obj_player, move_x:224, move_y:896, speed:8},
        {type:"move character", actor:obj_follower, move_x:288, move_y:896, speed:8},
        {type:"move multiple characters", actors:[{actor:obj_player, move_x:224, move_y:812, speed:1, move_sprite:going_up_haru}, {actor:obj_follower, move_x:288, move_y:812, speed:1, move_sprite:going_up_maya}]},
        {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
        {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
        {type:"dialogue", text_id:"scene 7 dialogue 2"},
        {type:"enter battle", enemies:[global.enemies.Lucian_The_Herald], bg: bg_grasslandsBattle, tutorial:false},
        {type:"dialogue", text_id:"scene 7 dialogue 3"}, 
         // ⭐⭐ PLACE QUEST UPDATE HERE ⭐⭐ 
        {type:"main quest progress", stage:9 }
         //cutscene done
         
         
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

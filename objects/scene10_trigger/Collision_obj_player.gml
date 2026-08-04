if (!variable_global_exists("cutscenes_played")) {
    global.cutscenes_played = [];
}

// If this trigger was already used, remove it immediately
if (array_contains(global.cutscenes_played, trigger_id)) {
    instance_destroy();
    exit;
}

//if (!global.bosses[0]) exit;

// ═══════════════════════════════════════════════════════
// FIX: STOP ALL MUSIC (BATTLE + BACKGROUND) FOR CUTSCENE
// ═══════════════════════════════════════════════════════
global.in_battle = false;

// Stop battle music
if (audio_is_playing(global.music_battle)) {
    audio_stop_sound(global.music_battle);
}
//if (!global.bosses[0]) exit;
// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {
    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);

    // Pass the trigger ID to the cutscene controller
    controller.trigger_id = trigger_id;  //<-- this line allows the cutscene to know it's from "trigger_id"

    controller.cutscene_steps = [
    {type:"move camera", move_x:370, move_y:750, speed:3},
    {type:"move multiple characters", actors:[{actor:obj_player, move_x:490, move_y:769, speed:2, move_sprite:going_down_haru}, {actor:obj_follower, move_x:533, move_y:781, speed:2, move_sprite:going_down_maya}]},
    {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
    {type:"set sprite", actor:obj_follower, sprite:idle_front_maya, image_speed:1},
    {type:"dialogue", text_id:"scene 10 dialogue 2"},
    {type:"wait", time:0.8},
    {type:"dialogue", text_id:"scene 10 dialogue 3"},
    {type:"wait", time:0.8},
    {type:"dialogue", text_id:"scene 10 dialogue 4"},
    {type:"enter battle", enemies:[global.enemies.Dusk_reaper], bg:spr_Swamp_Battle_background, tutorial: false},
    {type:"dialogue", text_id:"scene 10 dialogue 5"},
    {type:"delete actor", actor:actor_DuskReaper},
    {type:"wait", time:0.8},
    {type:"dialogue", text_id:"scene 10 dialogue 6"},
    {type:"wait", time:0.8},
    {type:"dialogue", text_id:"scene 10 dialogue 7"},
    // ⭐⭐ PLACE QUEST UPDATE HERE ⭐⭐ 
    { type:"main quest progress", stage:12 }       
         //cutscene done
         
         
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

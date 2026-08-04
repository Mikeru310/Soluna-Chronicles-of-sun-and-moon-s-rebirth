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
                  
                  {type:"move camera", move_x:350, move_y:428, speed:2},
                  {type:"move multiple characters", actors:[{actor:obj_player, move_x:478, move_y:523, speed:1, move_sprite:going_up_haru}, {actor:obj_follower, move_x:541, move_y:523, speed:1, move_sprite:going_up_maya}]},
                  {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
                  {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
                  {type:"dialogue", text_id:"scene 12 dialogue 1"},
                  {type:"move character", actor:obj_follower, move_x:540, move_y:491, speed:1, move_sprite:going_up_maya},
                  {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
                  {type:"wait", time:0.8},
                  {type:"shake actor", actor:obj_follower, duration:0.5, intensity:1.5},
                  {type:"set sprite", actor:obj_follower, sprite:down_maya, image_speed:1},
                  {type:"dialogue", text_id:"scene 12 dialogue 2"},
                  {type:"move character", actor:obj_player, move_x:540, move_y:523, speed:2, move_sprite:going_right_sides_haru},
                  {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
                  {
                   type: "play appear spawn",
                   x_pos: 508,
                   y_pos: 523,
                   sprite: appear_fairy,    
                   speed: 7,                  
                   layer: "Instances",         
                   spawn_object: actor_airy     
                   },
                  {type:"set sprite", actor:obj_player, sprite:left_idle_haru, image_speed:1},
                  {type:"dialogue", text_id:"scene 12 dialogue 3"},
                  {type:"move character", actor:actor_airy, move_x:508, move_y:441, speed:1, move_sprite:fairy},
                  {type:"set sprite", actor:actor_airy, sprite:fairy, image_speed:1},
                  {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
                  {type:"dialogue", text_id:"scene 12 dialogue 4"},
                  {type:"wait", time:0.8},
                  {type:"dialogue", text_id:"scene 12 dialogue 5"},
                  {type: "camera shake", duration:0.8, intensity:4},
                  {type:"fade out", speed:0.03, hold:1},
                  {type:"detach follower"},
                  {type:"delete actor", actor:obj_follower},
                  {type:"create actor", actor:actor_corruptedMaya, x_pos:510, y_pos:476},
                  {type:"move character", actor:obj_player, speed:3, move_x:512, move_y:523, move_sprite:back_haru},
                  {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
                  {type:"fade in", speed:0.03},
                  {type:"dialogue", text_id:"scene 12 dialogue 6"},
                  {type:"wait", time:0.8},
                  {type:"dialogue", text_id:"scene 12 dialogue 7"},
                  {type:"wait", time:0.8},
                  {type:"dialogue", text_id:"scene 12 dialogue 8"},
                  {type:"enter battle", enemies:[global.enemies.Maya_VesselOfCalamity], bg:spr_Mountain_Battle_background, tutorial:false},
                  {type:"delete actor", actor:actor_airy},
                  {type:"delete actor", actor:actor_corruptedMaya},
                  {type:"create actor", actor:obj_follower, x_pos:510, y_pos:476},
                  {type:"set sprite", actor:obj_follower, sprite:down_maya, image_speed:1},
                  {type:"move character", actor:obj_player, move_x:512, move_y:492, speed:1, move_sprite:going_up_haru},
                  {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
                  {type:"dialogue", text_id:"scene 12 dialogue 9"},
                  {type:"set sprite", actor:obj_follower, sprite:idle_front_maya, image_speed:1},
                  {type:"dialogue", text_id:"scene 12 dialogue 10"},
                  {type:"fade out", speed:0.03, hold:1},
                  {type:"move camera", move_x:350, move_y:180, speed:9},
                  {type:"move multiple characters", actors:[{actor:obj_player, move_x:496, move_y:368, speed:9, move_sprite:going_up_haru}, {actor:obj_follower, move_x:528, move_y:368, speed:9, move_sprite:going_up_maya}]},
                  {type:"fade in", speed:0.03}, 
                  {type:"move multiple characters", actors:[{actor:obj_player, move_x:496, move_y:277, speed:1, move_sprite:going_up_haru}, {actor:obj_follower, move_x:528, move_y:277, speed:1, move_sprite:going_up_maya}]},
                  {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
                  {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:0.7},
                  {type:"dialogue", text_id:"scene 12 dialogue 11"},
                  {type:"wait", time:0.8},
                  {type:"dialogue", text_id:"scene 12 dialogue 12"},
                  {type:"wait", time:0.8},
                  {type:"bounce", actor:obj_player, height:4, speed:0.2},
                  {type:"dialogue", text_id:"scene 12 dialogue 13"},
                  {type:"set sprite", actor:obj_follower, sprite:left_idle_maya, image_speed:0.8},
                  {type:"dialogue", text_id:"scene 12 dialogue 14"},
                  {type:"bounce", actor:obj_player, height:4, speed:0.2},
                  {type:"dialogue", text_id:"scene 12 dialogue 15"},
                  {type:"move character", actor:obj_follower, move_x:528, move_y:249, speed:1, move_sprite:going_up_maya},
                  {type:"set sprite", actor:obj_follower, sprite:idle_front_maya, image_speed:1},
                  {type:"dialogue", text_id:"scene 12 dialogue 16"},
                  {type:"wait", time:0.8},
                  {type:"dialogue", text_id:"scene 12 dialogue 17"},
                  {type:"dialogue", text_id:"scene 12 dialogue 18"},
                  { type: "pulse glow", actor: obj_follower, color: c_yellow, speed:0.4 },
                  {type:"wait", time:0.8},
                  {type:"dialogue", text_id:"scene 12 dialogue 19"},
                  {type:"disintegrate actor", actor: obj_follower},
                    // ⭐⭐ PLACE QUEST UPDATE HERE ⭐⭐ 
                  { type:"main quest progress", stage:14 },
                  {type:"wait", time:1},
                  {type:"dialogue", text_id:"scene 12 dialogue 20"},
                  {type:"move character", actor:obj_player, move_x:528, move_y:277, speed:1, move_sprite:going_right_sides_haru},
                  {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
                  {type:"dialogue", text_id:"scene 12 dialogue 21"},
                  {type:"fade out", speed:0.03, hold:1},
                  {
                               type: "change room",
                               room_name:rm_FOREST_ACT_1_1,
                               actor: obj_player,
                               x_pos: 245,
                               y_pos: 716
                  }
                  
                     


                  
         
                  
         
         
         //cutscene done
         
         
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

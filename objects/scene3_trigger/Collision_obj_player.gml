// 🔹 Make sure the list exists (prevents crash)
if (!variable_global_exists("cutscenes_played")) {
    global.cutscenes_played = [];
}

// If this trigger was already used, remove it immediately
if (array_contains(global.cutscenes_played, trigger_id)) {
    instance_destroy();
    exit;
}

// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {
    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);

    // Pass the trigger ID to the cutscene controller
    controller.trigger_id = trigger_id;  //<-- this line allows the cutscene to know it's from "trigger_id"

    controller.cutscene_steps = [
         
                           {type:"move multiple characters", actors:[{actor:obj_player, move_x:95, move_y:92, speed:1, move_sprite:going_right_sides_haru}, {actor:obj_follower, move_x:70, move_y:144, speed:1, move_sprite:going_right_sides_maya}]},
                           {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
                           {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
                           {type:"dialogue", text_id:"scene 3 dialogue 1"},
                           {type:"bounce", actor:obj_player, height:7, speed:0.2},
                           {type:"dialogue", text_id:"scene 3 dialogue 2"},
                           {type:"move character", actor:obj_player, move_x:128, move_y:92, speed:1, move_sprite:going_right_sides_haru},
                           {type:"move character", actor:obj_player, move_x:128, move_y:121, speed:1, move_sprite:going_down_haru},
                           {type:"move character", actor:obj_player, move_x:145, move_y:121, speed:1, move_sprite:going_right_sides_haru},
                           {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
                           {type:"dialogue", text_id:"scene 3 dialogue 3"},
                           {type:"move character", actor:obj_follower, move_x:196, move_y:162, speed:1, move_sprite:going_right_sides_maya},
                           {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
                           {type:"dialogue", text_id:"scene 3 dialogue 4"},
                           {type:"bounce", actor:obj_player, height:7, speed:0.2},
                           {type:"wait", time:1},
                           {type:"bounce", actor:obj_player, height:7, speed:0.2},
                           {type:"wait", time:1},
                           {type:"bounce", actor:obj_player, height:7, speed:0.2},
                           {type:"dialogue", text_id:"scene 3 dialogue 5"},
                           {type:"set sprite", actor:obj_ruin_titan_boss, sprite:ruin_titan, image_speed:1},
                           {type: "camera shake", duration:0.8, intensity:4},
                           {type:"move character", actor:obj_player, move_x:115, move_y:121, speed:4, move_sprite:going_left_sides_haru},
                           {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
                           {type:"move character", actor:obj_follower, move_x:100, move_y:162, speed:4, move_sprite:going_left_sides_maya},
                           {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
                           {type:"dialogue", text_id:"scene 3 boss start"},
                           {type:"camera shake", duration:0.8, intensity:8},
                           {type:"enter battle", enemies:[global.enemies.Ruined_Titan], bg:bg_cave_background, tutorial:false},
                           {type:"delete actor", actor:obj_ruin_titan_boss},
                           {type:"wait", time:1},
                           {type:"dialogue", text_id:"scene 3 dialogue 6"},
                           {type:"move character", actor:obj_player, move_x:76, move_y:121, speed:1, move_sprite:going_left_sides_haru},
                           {type:"set sprite", actor:obj_player, sprite:left_idle_haru, image_speed:1},
                           {type:"wait", time:1},
                           {type:"dialogue", text_id:"scene 3 dialogue 7"},
                           {type:"move character", actor:obj_follower, move_x:197, move_y:162, speed:2, move_sprite:right_idle_maya},
                           {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
                           {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
                           {type:"dialogue", text_id:"scene 3 dialogue 8"},
                           {type:"set sprite", actor:obj_follower, sprite:faint_maya_1},
                           {type:"wait", time:0.5},
                           {type:"bounce", actor:obj_player, height:7, speed:0.2},
                           {type:"dialogue", text_id:"scene 3 dialogue 9"},
                           {type:"move character", actor:obj_player, move_x:76, move_y:162, speed:3, move_sprite:going_down_haru},
                           {type:"move character", actor:obj_player, move_x:144, move_y:162, speed:3, move_sprite:going_right_sides_haru},
                           {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
                           {type:"dialogue", text_id:"scene 3 dialogue 10"},
                           {type:"wait", time:1},
                           {type:"dialogue", text_id:"scene 3 ending"},
                           {type:"detach follower"},                                                                        
                           {type:"delete actor", actor:obj_follower},
                           {type:"fade out", speed:0.03, hold:1},
                           
                           {
                               type: "change room",
                               room_name: rm_Haru_Interior1,
                               actor: obj_player,
                               x_pos: 39,
                               y_pos: 112
                           },
                           {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
                           
                           {type:"fade in", speed:0.03}, 
                           
                           
                           
                           
                           
                           
                           
                           
                  
                  
                  
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

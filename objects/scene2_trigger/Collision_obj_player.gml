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
         
         
                  {type:"create actor", actor:actor_Merchant, x_pos:973, y_pos:725},
                  {type:"create actor", actor:actor_Guard, x_pos:1000, y_pos:693},
                  {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
                  {type:"set sprite", actor:obj_follower, sprite:idle_front_maya, image_speed:1},
                  {type:"move camera", move_x:600, move_y:650, speed:2},
                  {type:"wait", time:1},
                  {type:"move character", actor:obj_follower, move_x:692, move_y:572, speed:4},
                  {type:"move character", actor:obj_player, move_x:660, move_y:572, speed:4},
                  {type:"move multiple characters", actors:[{actor:obj_player, move_x:661, move_y:743, speed:1, move_sprite:going_down_haru}, {actor:obj_follower, move_x:693, move_y:711, speed:1, move_sprite:going_down_maya}]},
                  {type:"move multiple characters", actors:[{actor:obj_player, move_x:761, move_y:740, speed:1, move_sprite:going_right_sides_haru}, {actor:obj_follower, move_x:805, move_y:711, speed:1, move_sprite:going_right_sides_maya}]},
                  {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
                  {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
                  {type:"dialogue", text_id:"scene 2 dialogue 1"},
                  {type:"move character", actor:actor_Merchant, move_x:843, move_y:725, speed:1, move_sprite:male_npc_going_sides},
                  {type:"set sprite", actor:actor_Merchant, sprite:male_front_npc, image_speed:1},
                  {type:"dialogue", text_id:"scene 2 dialogue 2"},
                  {type:"move character", actor:obj_player, move_x:843, move_y:743, speed:1, move_sprite:going_right_sides_haru},
                  {type:"set sprite", actor:obj_player, sprite:back_haru},
                  {type:"dialogue", text_id:"scene 2 dialogue 3"},
                  {type:"move character", actor:obj_follower, move_x:817, move_y:725, speed:1, move_sprite:going_right_sides_maya},
                  {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
                  {type:"dialogue", text_id:"scene 2 dialogue 4"},
                  { type:"bounce", actor:obj_follower, height:4, speed:0.2},
                  {type:"dialogue", text_id:"scene 2 dialogue 5"},
                  { type:"bounce", actor:actor_Merchant, height:7, speed:0.2},
                  {type:"dialogue", text_id:"scene 2 dialogue 6"},
                  {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
                  {type:"move camera", move_x:650, move_y:650, speed:1},
                  {type:"dialogue", text_id:"scene 2 dialogue 7"},
                  {type:"move character", actor:actor_Guard, move_x:850, move_y:693, speed:2, move_sprite:going_sides_corrupted_knght},
                  {type:"set sprite", actor:actor_Guard, sprite:front_idle_corrupted_knight, image_speed:1},
                  {type:"dialogue", text_id:"scene 2 dialogue 8"},
                  {type:"bounce", actor:actor_Guard, height:7, speed:0.2},
                  {type:"dialogue", text_id:"scene 2 dialogue 9"},
                  {type:"set sprite", actor:obj_follower, sprite:idle_front_maya, image_speed:1},
                  {type:"move character", actor:obj_follower, move_x:817, move_y:743, speed:1, move_sprite:going_down_maya},
                  {type:"set sprite", actor:obj_follower, sprite:idle_front_maya, image_speed:1},
                  {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
                // ⭐ MAIN QUEST PROGRESS UPDATE FOR SCENE 2 ⭐
        // ------------------------------------------------ 
                  {type:"main quest progress", stage:2},
                  {type:"dialogue", text_id:"scene 2 ending dialogue"}
                  
                  
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

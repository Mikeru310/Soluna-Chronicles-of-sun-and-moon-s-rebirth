// Give each trigger a unique ID
// You can change this per instance in the room editor if needed
trigger_id = "cutscene intro";
visible = false;


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
         controller.trigger_id = trigger_id;
    controller.cutscene_steps = [
         
         {type:"move camera", move_x:700, move_y:50, speed:999},
         {type:"wait", time:3},
         {type:"dialogue", text_id:"dialogue 1"},
         {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
         {type:"dialogue", text_id:"dialogue 2"},
         {type:"wait", time:2}, //this step should've manipulate granpa's sprite but lacking any movement sprite -Mikeru
         {type:"dialogue", text_id:"dialogue 3"},
         {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
         {type:"wait", time:2},
         {type:"dialogue", text_id:"dialogue 4"},
         {type:"wait", time:2},
         {type:"dialogue", text_id:"dialogue 5"},
         {type:"move character", actor:obj_player, move_x:796, move_y:113, speed:3, move_sprite:going_right_sides_haru},
         {type:"move character", actor:obj_NPC3, move_x:938, move_y:113, speed:3, move_sprite:grandpa_haru_idle_right},
         {type:"dialogue", text_id:"dialogue 6"},
         {type:"enter battle", enemies:[global.enemies.Tutorial_Slime], bg:Spr_BBG_FOREST_1, tutorial: true},
         {type:"wait", time:5},
         {type:"dialogue", text_id:"dialogue 7"},
         {type:"move character", actor:obj_player, move_x:837, move_y:113, speed:1, move_sprite:going_right_sides_haru},
         {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
         {type:"move character", actor:obj_NPC3, move_x:867, move_y:113, speed:1, move_sprite:grandpa_haru_idle},
         {type:"wait", time:1},
         {type:"dialogue", text_id:"dialogue 8"},
         {type:"move character", actor:obj_player, move_x:837, move_y:141, speed:1, move_sprite:going_down_haru},
         {type:"wait", time:1},
         {type:"move character", actor:obj_player, move_x:860, move_y:141, speed:1, move_sprite:going_right_sides_haru},
         {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
        {type:"set sprite", actor:obj_NPC3, sprite:grandpa_haru_front, image_speed:1},
         {type:"dialogue", text_id:"dialogue 9"},
         {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
         
         // ⭐ START MAIN QUEST ⭐ 
        {type:"main quest progress", stage:0}
         
         
         
         
         
         
         
         
         
         
         //{ type:"move camera", move_x:127, move_y:671, speed:2},
        //{ type:"dialogue", text_id:"NPC5" },
        //{ type:"path", actor:obj_player, path:pthTest1, speed:1, end_action:path_action_stop, absolute:false },
        //{ type:"dialogue", text_id:"NPC5" },
        //{ type:"path", actor:obj_player, path:pthTest2, speed:1, end_action:path_action_stop, absolute:false },
        //{ type:"dialogue", text_id:"NPC5" },
         //{type:"move character", actor:beta_npc8_obj, move_x:256, move_y:847, speed:1}
         //
         
         //{type:"move character", actor:obj_player, move_x: 520, move_y: 620, speed:1}
    ];
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

// 🔹 Make sure the list exists (prevents crash)
if (!variable_global_exists("cutscenes_played")) {
    global.cutscenes_played = [];
}

// If this trigger was already used, remove it immediately
if (array_contains(global.cutscenes_played, trigger_id)) {
    instance_destroy();
    exit;
}

//if (!global.bosses[0]) exit;
// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {
    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);

    // Pass the trigger ID to the cutscene controller
    controller.trigger_id = trigger_id;  //<-- this line allows the cutscene to know it's from "trigger_id"

    controller.cutscene_steps = [
         
         //cutscene start
         {type:"move multiple characters", actors:[{actor:obj_player, move_x:1260, move_y:183, speed:1, move_sprite:going_right_sides_haru}, {actor:obj_follower, move_x:1228, move_y:183, speed:1, move_sprite:going_right_sides_maya}]},
         {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
         {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
         {type:"dialogue", text_id:"scene 6 dialogue 1"},
         {type:"move character", actor:obj_follower, move_x:1228, move_y:209, speed:1, move_sprite:going_down_maya},
         {type:"move character", actor:obj_follower, move_x:1261, move_y:209, speed:1, move_sprite:going_right_sides_maya},
         {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
         {type:"dialogue", text_id:"scene 6 dialogue 2"},
         {type:"detach follower"},
         {type:"move character", actor:obj_follower, move_x:1300, move_y:209, speed:1, move_sprite:going_right_sides_maya},
         {type:"move character", actor:obj_follower, move_x:1667, move_y:209, speed:20, move_sprite:going_right_sides_maya},
        // ⭐⭐ PLACE QUEST UPDATE HERE ⭐⭐
         {type:"main quest progress", stage:6 },
         {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1}
        
         //{type: "bounce", actor:obj_follower, height:4, speed:0.2},
         
         
         
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

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
         {type:"create actor", actor:actor_airy, x_pos:1761, y_pos:151},
         {type:"create actor", actor:slime1, x_pos:1734, y_pos:157},
         //{type:"create actor", actor:slime2, x_pos:1768, y_pos:182},
         {type:"create actor", actor:slime3, x_pos:1805, y_pos:159},
         {type:"move camera", move_x:1580, move_y:120, speed:3},
         {type:"move character", actor:obj_player, move_x:1628, move_y:183, speed:1, move_sprite:going_right_sides_haru},
         {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
         {type:"dialogue", text_id:"scene 6 dialogue 3"},
         {type:"enter battle", enemies:[global.enemies.purple_slime, global.enemies.purple_slime], bg:bg_grasslandsBattle, tutorial: false},
         {type:"delete actor", actor:slime1},
         {type:"delete actor", actor:slime2},
         {type:"delete actor", actor:slime3},
         {type:"wait", time:0.7},
         {type:"move character", actor:actor_airy, move_x:1761, move_y:173, speed:1},
         {type:"move character", actor:actor_airy, move_x:1655, move_y:173, speed:1},
         {type:"set sprite", actor:obj_follower, sprite:idle_back_maya},
         {type:"dialogue", text_id:"scene 6 dialogue 4"},
         {type:"bounce", actor:actor_airy, height:7, speed:0.2},
         {type:"dialogue", text_id:"scene 6 dialogue 5"},
         {type:"bounce", actor:obj_player, height:7, speed:0.2},
         {type:"dialogue", text_id:"scene 6 dialogue 6"},
         {type:"move character", actor:actor_airy, move_x:1744, move_y:173, speed:1},
         {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
         {type:"dialogue", text_id:"scene 6 dialogue 7"},
         {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
         {type:"dialogue", text_id:"scene 6 dialogue 8"},
         {type:"bounce", actor:actor_airy, height:7, speed:0.2},
         {type:"dialogue", text_id:"scene 6 dialogue 9"},
         {type:"move character", actor:actor_airy, move_x:1948, move_y:173, speed:1},
         {type:"move character", actor:actor_airy, move_x:1952, move_y:159, speed:1},
         {type:"set sprite", actor:actor_airy, sprite:fairy, image_speed:1}, 
         {type:"main quest progress", stage:7 },
         {type:"attach follower"}
         
         
         //cutscene done
         
         
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

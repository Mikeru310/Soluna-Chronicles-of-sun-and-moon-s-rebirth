// 🔹 Make sure the list exists (prevents crash)
if (!variable_global_exists("cutscenes_played")) {
    global.cutscenes_played = [];
}

// If this trigger was already used, remove it immediately
if (array_contains(global.cutscenes_played, trigger_id)) {
    instance_destroy();
    exit;
}

if (!global.bosses[0]) exit;
// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {
    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);

    // Pass the trigger ID to the cutscene controller
    controller.trigger_id = trigger_id;  //<-- this line allows the cutscene to know it's from "trigger_id"

    controller.cutscene_steps = [
         {type:"move camera", move_x:127, move_y:650, speed:2},
         //{type:"move camera", move_x:127, move_y:600, speed:2},
         {type:"move character", actor:obj_player, move_x:257, move_y:684, speed:1, move_sprite:going_down_haru},
         {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
         { type: "bounce", actor: actor_Maya, height: 4, speed: 0.2 },
         {type:"set sprite", actor:actor_Maya, sprite:idle_back_maya, image_speed:1},
         {type:"dialogue", text_id:"scene 5 dialogue 1"},
         {type:"move character", actor:actor_Maya, move_x:231, move_y:684, speed:3, move_sprite:going_up_maya},
         {type:"set sprite", actor:actor_Maya, sprite:right_idle_maya, image_speed:1},
         {type:"set sprite", actor:obj_player, sprite:left_idle_haru, image_speed:1},
         {type: "bounce", actor: actor_Maya, height: 4, speed: 0.2},
         {type:"dialogue", text_id:"scene 5 dialogue 2"},
         {type:"wait", time:0.8},
         {type:"dialogue", text_id:"scene 5 dialogue 3"},
         {type:"move character", actor:Actor_elder, move_x:258, move_y:719, speed:1},
         {type:"move character", actor:Actor_elder, move_x:258, move_y:700, speed:1},
         {type:"dialogue", text_id:"scene 5 dialogue 4"},
         {type:"move character", actor:actor_Maya, move_x:231, move_y:700, speed:1},
         {type:"set sprite", actor:actor_Maya, sprite:right_idle_maya, image_speed:1},
         {type:"dialogue", text_id:"scene 5 dialogue 5"},
         {type:"move character", actor:Actor_elder, move_x:258, move_y:720, speed:1},
         {type:"dialogue", text_id:"scene 5 dialogue 6"},
         {type:"move character", actor:actor_Maya, move_x:231, move_y:720, speed:1, move_sprite:going_down_maya},
         {type:"set sprite", actor:actor_Maya, sprite:right_idle_maya, image_speed:1},
         {type:"dialogue", text_id:"scene 5 dialogue 7"},
         {type:"move character", actor:obj_player, move_x:257, move_y:704, speed:1, move_sprite:going_down_haru},
         {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
         {type:"dialogue", text_id:"scene 5 dialogue 8"},
         {type:"wait", time:1},
         {type:"dialogue", text_id:"scene 5 dialogue 9"},
         {type:"set sprite", actor:actor_Maya, sprite:idle_back_maya, image_speed:1},
         {type:"dialogue", text_id:"scene 5 dialogue 10"},
         {type:"wait", time:0.8},
         {type:"move character", actor:actor_Maya, move_x:231, move_y:704, speed:1, move_sprite:going_up_maya},
         {type:"set sprite", actor:actor_Maya, sprite:idle_front_maya, image_speed:1},
         {type:"dialogue", text_id:"scene 5 dialogue 11"},
         {type: "create actor", actor:obj_follower, x_pos:231, y_pos:704},
         {type:"delete actor", actor:actor_Maya},
        {type:"attach follower"},
        // ⭐ UPDATE MAIN QUEST HERE ⭐
        {type:"main quest progress", stage:5}
         
         

         
         
         
         
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

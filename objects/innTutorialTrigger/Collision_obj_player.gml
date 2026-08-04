/// Collision with obj_player

// 🔹 Make sure the list exists (prevents crash)
if (!variable_global_exists("cutscenes_played")) {
    global.cutscenes_played = [];
}

// 🔹 If this cutscene was already played, remove trigger instantly
if (array_contains(global.cutscenes_played, trigger_id)) {
    instance_destroy();
    exit;
}

// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {

    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);

    // Pass the trigger ID to the cutscene controller
    controller.trigger_id = trigger_id;

    controller.cutscene_steps = [
         {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
         {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
         {type:"move camera", move_x:700, move_y:550, speed:2},
         {type:"dialogue", text_id:"inn dialogue 1"},
         {type:"fade out", speed:0.03, hold:1},
         {
                               type: "change room",
                               room_name: rm_Forest_Inn_Interior_UPDATED,
                               actor: obj_player,
                               x_pos: 172,
                               y_pos: 257
         },
         {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1}, 
         {type:"move character", actor:obj_follower, move_x:212, move_y:260, speed:9999, move_sprite:idle_back_maya},
         {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
         {type:"fade in", speed:0.03},
         {type:"dialogue", text_id:"inn dialogue 2"}                   
         
         
    ];

    controller.active = true;

    // REMOVE THIS LINE — we no longer use it:
    // variable_global_set(trigger_id, true);

    // Remove the trigger from the room
    instance_destroy();
}

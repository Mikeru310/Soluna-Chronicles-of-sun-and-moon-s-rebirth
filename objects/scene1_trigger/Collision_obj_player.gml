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
         
         {type: "create actor", actor:actor_Maya, x_pos:228, y_pos:721},
         {type:"create actor", actor:Actor_elder, x_pos:497, y_pos:721},
         {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
         {type:"move camera", move_x:127, move_y:650, speed:2},
         {type:"move character", actor:obj_player, move_x:258, move_y:667, speed:2, move_sprite:going_down_haru},
         {type: "bounce", actor: actor_Maya, height: 4, speed: 0.2 },
         {type:"dialogue", text_id:"scene 1 dialogue 1"},
         {type:"set sprite", actor:actor_Maya, sprite:idle_back_maya, image_speed:1},
         {type:"move character", actor:obj_player, move_x:258, move_y:721, speed:1, move_sprite:going_down_haru},
         {type:"set sprite", actor:actor_Maya, sprite:right_idle_maya, image_speed:1},
         {type:"set sprite", actor:obj_player, sprite:left_idle_haru, image_speed:1},
         {type:"wait", time:1},
         {type:"dialogue", text_id:"scene 1 dialogue 2"},
         {type:"wait", time:2},
         {type:"dialogue", text_id:"scene 1 dialogue 3"},
         {type:"set sprite", actor:actor_Maya, sprite:right_idle_maya, image_speed:1},
         {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
         {type:"move character", actor:Actor_elder, move_x:285, move_y:721, speed:2},
         {type:"set sprite", actor:obj_player, sprite:left_idle_haru, image_speed:1},
         { type: "bounce", actor: actor_Maya, height: 4, speed: 0.2 },
         {type:"dialogue", text_id:"scene 1 dialogue 4"},
         {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
         {type:"dialogue", text_id:"scene 1 dialogue 5"},
         {type:"dialogue", text_id:"scene 1 dialogue 6"},
         {type:"wait", time:1},
         {type:"dialogue", text_id:"scene 1 dialogue 7"},
         {type:"move character", actor:obj_player, move_x:259, move_y:679, speed:2, move_sprite:going_down_haru},
         {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
         {type:"set sprite", actor:actor_Maya, sprite:idle_back_maya, image_speed:1},
         {type:"dialogue", text_id:"scene 1 dialogue 8"},
         {type:"dialogue", text_id:"scene 1 dialogue 9"},
         {type:"move character", actor:actor_Maya, move_x:257, move_y:721, speed:1, move_sprite:going_right_sides_maya},
         {type:"dialogue", text_id:"maya joined the party"},
        //{type:"bounce", actor:Actor_elder, height:4, speed:0.2},
        // ⭐ MAIN QUEST UPDATE HERE ⭐
    //----------------------------- 
         {type:"main quest progress", stage:1},
        
        
         {type:"delete actor", actor:actor_Maya}
    ];

    controller.active = true;

    // REMOVE THIS LINE — we no longer use it:
    // variable_global_set(trigger_id, true);

    // Remove the trigger from the room
    instance_destroy();
}

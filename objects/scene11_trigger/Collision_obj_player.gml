// makes sure list exist to prevent crashes
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
                  {type:"move camera", move_x:370, move_y:1340, speed:2},
                  {type:"move multiple characters", actors:[{actor:obj_player, move_x:493, move_y:1431, speed:1, move_sprite:going_up_haru}, {actor:obj_follower, move_x:528, move_y:1495, speed:1, move_sprite:going_right_sides_maya}]},
                  {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
                  {type:"move character", actor:obj_follower, move_x:533, move_y:1431, speed:1, move_sprite:going_up_maya},
                  {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
                  {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
                  {type:"dialogue", text_id:"scene 11 dialogue 1"},
                  {
                   type: "play appear spawn",
                   x_pos: 510,
                   y_pos: 1405,
                   sprite: appear_fairy,    
                   speed: 7,                  
                   layer: "Instances",         
                   spawn_object: actor_airy     
                   },
                  {type:"dialogue", text_id:"scene 11 dialogue 2"},
                  {type:"set sprite", actor:obj_follower, sprite:left_idle_maya, image_speed:1},
                  {type:"dialogue", text_id:"scene 11 dialogue 3"},
                  {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
                  {type:"dialogue", text_id:"scene 11 dialogue 4"},
                  {type:"set sprite", actor:obj_player, sprite:back_haru, image_speed:1},
                  {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
                  {type:"dialogue", text_id:"scene 11 dialogue 5"},
                  {type:"move character", actor:actor_airy, move_x:510, move_y:1351, speed:3, move_sprite:fairy},
                  {type:"set sprite", actor:obj_follower, sprite:left_idle_maya, image_speed:1},
                  {type:"dialogue", text_id:"scene 11 dialogue 6"},
                  {type: "bounce", actor: actor_airy, height: 4, speed: 0.2 },
                  {type:"set sprite", actor:obj_follower, sprite:idle_back_maya, image_speed:1},
                  {type:"dialogue", text_id:"scene 11 dialogue 7"},
                  {
                   type: "play vanish remove",
                   actor: actor_airy,     // Airy object to remove
                   sprite: disappear_fairy,  // your vanish sprite
                   speed: 7               // 5 FPS vanish animation
                  },
                  // ⭐⭐ PLACE QUEST UPDATE HERE ⭐⭐ 
                  { type:"main quest progress", stage:13 }
                  
         //cutscene done
         
         
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

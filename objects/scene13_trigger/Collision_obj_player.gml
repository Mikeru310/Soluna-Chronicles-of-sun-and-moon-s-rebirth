// makes sure list exist to prevent crashes
if (!variable_global_exists("cutscenes_played")) {
    global.cutscenes_played = [];
}

// If this trigger was already used, remove it immediately
if (array_contains(global.cutscenes_played, trigger_id)) {
    instance_destroy();
    exit;
}

if (!global.bosses[3]) exit;
// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {
    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);

    // Pass the trigger ID to the cutscene controller
    controller.trigger_id = trigger_id;  //<-- this line allows the cutscene to know it's from "trigger_id"

    controller.cutscene_steps = [
                  {type:"move camera", move_x:100, move_y:200, speed:999999},
                  {type:"delete actor", actor:obj_follower},
                  {type:"delete actor", actor:actor_Maya},
                  {type:"create actor", actor:actor_mayaTree, x_pos:258, y_pos:764},
                  {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
                  
                  {type:"wait", time:1},
                  {type:"move camera", move_x:100, move_y:670, speed:2},
                  {type:"wait", time:0.8},
                  {type:"create actor", actor:actor_grandpa, x_pos:274, y_pos:621},
                  {type:"move character", actor:actor_grandpa, move_x:274, move_y:716, speed:1, move_sprite:grandpa_haru_front},
                  {type:"set sprite", actor:actor_grandpa, sprite:grandpa_haru_front, image_speed:1},
                  {type:"dialogue", text_id:"scene 13 dialogue 1"},
                  {type:"wait", time:0.8},
                  {type:"dialogue", text_id:"scene 13 dialogue 2"},
                  {type:"set sprite", actor:actor_grandpa, sprite:grandpa_haru_idle, image_speed:1},
                  {type:"dialogue", text_id:"scene 13 dialogue 3"},
                  {type:"move character", actor:actor_grandpa, move_x:274, move_y:659, speed:1, move_sprite:grandpa_haru_back},
                  {type:"set sprite", actor:actor_grandpa, sprite:grandpa_haru_front, image_speed:1},
                  {type:"dialogue", text_id:"scene 13 dialogue 4"},
                  {type:"move character", actor:actor_grandpa, move_x:274, move_y:593, speed:1, move_sprite:grandpa_haru_back},
                  {type:"delete actor", actor:actor_grandpa},
                  {type:"wait", time:1},
                  {type:"move character", actor:obj_player, move_x:245, move_y:704, speed:1, move_sprite:going_up_haru},
                  {type:"set sprite", actor:obj_player, sprite:front_haru, image_speed:1},
                  {type:"wait", time:0.8},
                  {type:"move character", actor:obj_player, move_x:245, move_y:591, speed:1, move_sprite:going_up_haru},
                  {type:"delete actor", actor:obj_player},
                  {type:"wait", time:1},
                  {type:"fade out", speed:0.03, hold:1},
                   //{type:"switch room", room_name:rm_credits},          


                  
         
                  
         
         
         //cutscene done
         
         
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

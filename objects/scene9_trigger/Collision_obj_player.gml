// makes sure list exist to prevent crashes
if (!variable_global_exists("cutscenes_played")) {
    global.cutscenes_played = [];
}

global.scene9_cutscene = true;


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
         
        {type:"create actor", actor:actor_airy, x_pos:764, y_pos:88},
        {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
        {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
        {type:"dialogue", text_id:"scene 9 dialogue 1"},
        {type:"move camera", move_x:500, move_y:0, speed:3},
        {type:"move character", actor:obj_player, move_x:561, move_y:71, speed:1, move_sprite:going_right_sides_haru},
        {type:"move character", actor:obj_follower, move_x:558, move_y:113, speed:1, move_sprite:going_right_sides_maya},
        {type:"set sprite", actor:obj_follower, sprite:right_idle_maya, image_speed:1},
        {type:"set sprite", actor:obj_player, sprite:right_idle_haru, image_speed:1},
        {type:"dialogue", text_id:"scene 9 dialogue 2"},
        { type:"main quest progress", stage:10 },
        {type:"delete actor", actor:actor_airy}
        
        
         
         //cutscene done
         
         
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

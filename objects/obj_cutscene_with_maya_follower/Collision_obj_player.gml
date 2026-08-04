// If this trigger was already used, remove it immediately
if (variable_global_exists(trigger_id) && variable_global_get(trigger_id)) {
    instance_destroy();
    exit;
}

// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {
    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);
    controller.cutscene_steps = [
         {type:"wait", time:1},
         {type:"move character", actor:obj_follower, move_x:830, move_y:391, speed:1},
         {type:"move character", actor:obj_player, move_x:840, move_y:391, speed:1}
         
         
         
         //{type:"move character", actor:obj_player, move_x: 520, move_y: 620, speed:1}
    ];
    controller.active = true;

    // mark this trigger as used
    variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

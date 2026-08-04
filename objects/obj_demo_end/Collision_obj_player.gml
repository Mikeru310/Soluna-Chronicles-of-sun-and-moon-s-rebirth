// If this trigger was already used, remove it immediately
if (variable_global_exists(trigger_id) && variable_global_get(trigger_id)) {
    instance_destroy();
    exit;
}

// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {
    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);

    // Pass the trigger ID to the cutscene controller
    controller.trigger_id = trigger_id;  //<-- this line allows the cutscene to know it's from "trigger_id"

    controller.cutscene_steps = [
                                    {type:"dialogue", text_id:"developer demo end"}
                          
    ];
    
    controller.active = true;

    // mark this trigger as used
    variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

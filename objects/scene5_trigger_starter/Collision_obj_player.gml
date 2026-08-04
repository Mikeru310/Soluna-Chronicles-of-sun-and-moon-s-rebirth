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
         // {type:"delete actor", actor:obj_follower},
         {type:"move camera", move_x:650, move_y:200, speed:999999},
         {type:"create actor", actor:Actor_elder, x_pos:285, y_pos:720},
         {type: "create actor", actor:actor_Maya, x_pos:228, y_pos:721},
         {type:"wait", time:1},
         {type:"dialogue", text_id:"scene 5 dialogue starter"}
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

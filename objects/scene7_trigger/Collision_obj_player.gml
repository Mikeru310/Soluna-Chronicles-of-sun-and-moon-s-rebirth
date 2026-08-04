// 🔹 Make sure the list exists (prevents crash)
if (!variable_global_exists("cutscenes_played")) {
    global.cutscenes_played = [];
}

global.scene7_cutscene = true;



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
         
        {type:"set sprite", actor:obj_follower, sprite:right_idle_maya},
        {type:"set sprite", actor:obj_player, sprite:right_idle_haru},
        {type:"create actor", actor:actor_airy, x_pos:2578, y_pos:2001},
        {type:"dialogue", text_id:"scene 7 dialogue 1"},
        // ⭐⭐ PLACE QUEST UPDATE HERE ⭐⭐ 
        { type:"main quest progress", stage:8 },
        {type:"delete actor", actor:actor_airy}
         
         
         //cutscene done
         
         
         
    ];
    
    controller.active = true;

    // mark this trigger as used
    //variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

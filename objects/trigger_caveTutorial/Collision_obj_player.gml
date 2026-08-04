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
                           {type:"dialogue", text_id:"cave dialogue 1"}
         
         
    ];

    controller.active = true;

    // REMOVE THIS LINE — we no longer use it:
    // variable_global_set(trigger_id, true);

    // Remove the trigger from the room
    instance_destroy();
}

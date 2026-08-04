// --- Detect Z key ---
if (keyboard_check_pressed(ord("Z"))) {

    // --- Create the transition directly on Instances layer ---
    var t = instance_create_layer(0, 0, "Instances", obj_transitions);
    t.target_room = rm_mainmenu1;
    t.transition_state = 1;  // start fading out
}

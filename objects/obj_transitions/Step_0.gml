// --- Fade Out ---
if (transition_state == 1) {
    transition_alpha += transition_speed;
    if (transition_alpha >= 1) {
        transition_alpha = 1;

        // Change room after fade-out
        if (target_room != noone) {
            room_goto(target_room);
        }

        // Start fade-in phase
        transition_state = 2;
    }
}

// --- Fade In ---
else if (transition_state == 2) {
    transition_alpha -= transition_speed;
    if (transition_alpha <= 0) {
        transition_alpha = 0;
        instance_destroy(); // fully done — clean up
    }
}

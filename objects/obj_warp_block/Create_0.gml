// --- Warp Settings ---
target_x = 0;
target_y = 0;
targetRoom = 0;

// --- Transition Settings ---
fade_alpha = 0;
fade_speed = 0.05;
fade_state = 0; // 0 = idle, 1 = fade out, 2 = switch, 3 = fade in

// if coming from a warp transition, start fade-in
if (variable_global_exists("_warp_transition"))
{
    fade_alpha = 1;
    fade_state = 3; // start fading in
    global._warp_transition = false; // reset flag
}

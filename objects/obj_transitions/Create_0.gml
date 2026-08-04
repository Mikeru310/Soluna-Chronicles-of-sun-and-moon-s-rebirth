// --- Initialize transition variables ---
transition_speed = 0.05;  // adjust fade speed (0.02–0.08 is good)
transition_alpha = 0;
transition_state = 0;     // 0 = idle, 1 = fading out, 2 = fading in
target_room = noone;      // will be assigned when created

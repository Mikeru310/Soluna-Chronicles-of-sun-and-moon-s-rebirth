intro_timer += 1;

// Start fade after 3 seconds (approx 180 frames at 60fps)
if (intro_timer > 180) {
    fade_alpha += 0.02; // Smooth fade out
    if (fade_alpha >= 1) {
        room_goto(rm_mainmenu);
    }
}

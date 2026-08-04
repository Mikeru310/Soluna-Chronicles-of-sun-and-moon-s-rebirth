switch (state) {

    case "fade_in":
        // Fade in
        alpha = min(alpha + fade_speed, 1);
        if (alpha >= 1) {
            timer = 0;
            state = "hold";
        }
    break;

    case "hold":
        // Hold for a few seconds
        timer += 1;
        if (timer >= hold_time) {
            state = "fade_out";
        }
    break;

    case "fade_out":
        // Fade out
        alpha = max(alpha - fade_speed, 0);
        if (alpha <= 0) {
            room_goto(next_room);
        }
    break;
}

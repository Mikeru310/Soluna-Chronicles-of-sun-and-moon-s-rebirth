// Move toward center
if (!arrived) {
    x = lerp(x, target_x, 0.08);
    if (abs(x - target_x) < 2) {
        x = target_x;
        arrived = true;
    }
}

// After arriving, bounce animation
if (arrived) {
    bounce_timer += bounce_speed;
    y = y_start + sin(bounce_timer * 6) * y_bounce * exp(-bounce_timer * 1.3);

    // stop when bounce settles
    if (bounce_timer > 3.2) {
        y = y_start;
        bounce_timer = 3.2;
    }
}

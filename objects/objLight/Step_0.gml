/// oLight - Step
if (light_time > 0) {
    light_time -= 1;
    light_alpha = 1; // stay fully lit while timer is active/
} else {
    // fade away smoothly
    light_alpha = max(0, light_alpha - fade_speed);
}

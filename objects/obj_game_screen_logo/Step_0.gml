// --- Gentle up-and-down motion ---
bounce_timer += bounce_speed;

// Move up and down smoothly
y = base_y + sin(bounce_timer) * bounce_height;

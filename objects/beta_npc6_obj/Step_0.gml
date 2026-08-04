event_inherited();
// Detect movement direction
var dx = x - last_x;
var dy = y - last_y;

// Change sprite based on direction if not paused
if (!paused) {
    if (abs(dx) > abs(dy)) {
        if (dx > 0) {
            sprite_index = sprite_right;
            last_dir = "right";
        } else {
            sprite_index = sprite_left;
            last_dir = "left";
        }
    } else if (abs(dy) > 0) {
        if (dy > 0) {
            sprite_index = sprite_down;
            last_dir = "down";
        } else {
            sprite_index = sprite_up;
            last_dir = "up";
        }
    }
}

// Pause logic on player collision
if (!paused && place_meeting(x, y, obj_player)) {
    paused_position = path_position;
    paused = true;
    path_end();
    pause_timer = 60; // 1 second

    // Set correct idle sprite
    switch (last_dir) {
        case "up": sprite_index = idle_up; break;
        case "down": sprite_index = idle_down; break;
        case "left": sprite_index = idle_left; break;
        case "right": sprite_index = idle_right; break;
    }
}

// Resume after pause
if (paused) {
    pause_timer -= 1;

    if (pause_timer <= 0) {
        paused = false;
        path_start(pth_ExpiramentalPath, 1, path_action_reverse, true);
        path_position = paused_position;
    }
}

// Update last position
last_x = x;
last_y = y;

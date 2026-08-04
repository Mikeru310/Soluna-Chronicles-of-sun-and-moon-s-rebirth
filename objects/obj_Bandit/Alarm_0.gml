alarm[0] = 30;
if (dead) exit;

var px = obj_player.x;
var py = obj_player.y;
var dist = point_distance(x, y, px, py);

// ==============================
// PATROL
// ==============================
if (state == "patrol") {

    // Make sure patrol path runs
    if (patrol_path != noone && path_index != patrol_path) {
        path_start(patrol_path, 1, path_action_reverse, true);
    }

    // Player close → chase
    if (dist <= detection_radius) {
        path_end();
        state = "chase";
    }
}

// ==============================
// CHASE
// ==============================
else if (state == "chase") {
    if (dist > detection_radius) {
        state = "return";
        path_end();
        // NO PATH CREATION — tilemap handles return AI
    }
}

// ==============================
// RETURN TO SPAWN
// ==============================
else if (state == "return") {

    if (point_distance(x, y, spawn_x, spawn_y) < 4) {
        state = "patrol";

        // Restart patrol
        if (patrol_path != noone) {
            path_start(patrol_path, 1, path_action_reverse, true);
        }
    }
}

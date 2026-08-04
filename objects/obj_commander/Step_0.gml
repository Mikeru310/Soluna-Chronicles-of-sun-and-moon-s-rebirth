escapeDelay = max(escapeDelay - 1, 0);

// DEATH
if (dead) {
    image_alpha -= 0.05;
    image_blend = c_red;
    if (image_alpha <= 0) instance_destroy();
    exit;
}

// STATE MOVEMENT
var target_x = x;
var target_y = y;
var spd = 0;

if (state == "chase") {
    target_x = obj_player.x;
    target_y = obj_player.y;
    spd = chase_speed;
}
else if (state == "return") {
    target_x = spawn_x;
    target_y = spawn_y;
    spd = return_speed;
}

// CHASE MOVEMENT (tilemap collision)
if (state == "chase") {
    var dir = point_direction(x, y, target_x, target_y);
    var hsp = lengthdir_x(spd, dir);
    var vsp = lengthdir_y(spd, dir);

    if (!Tilemap_Collides(tilemap, bbox_left + hsp, bbox_top, bbox_right + hsp, bbox_bottom)) {
        x += hsp;
    }

    if (!Tilemap_Collides(tilemap, bbox_left, bbox_top + vsp, bbox_right, bbox_bottom + vsp)) {
        y += vsp;
    }
}

// RETURN MOVEMENT (TILEMAP AVOIDANCE)
if (state == "return") {
    // The magic tilemap-aware function
    mp_potential_step(spawn_x, spawn_y, return_speed, false);
}

// SPRITES
var dx = x - prev_x;
var dy = y - prev_y;

if (abs(dx) > abs(dy)) {
    sprite_index = going_sides_corrupted_commander;
    image_xscale = (dx < 0) ? 1 : -1;
} else if (abs(dy) > 0) {
    if (dy < 0) sprite_index = going_up_corrupted_commander;
    else       sprite_index = going_down_corrupted_commander;
}

prev_x = x;
prev_y = y;

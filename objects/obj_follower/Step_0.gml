/// @description Follower Step

// ------------------------------------------------------------------
// Ensure global variable exists (prevents undefined crash)
// ------------------------------------------------------------------
if (!variable_global_exists("follower_frozen")) {
    global.follower_frozen = false;
}

// ------------------------------------------------------------------
// Destroy follower if player doesn't exist (safety)
// ------------------------------------------------------------------
if (!instance_exists(obj_player)) {
    instance_destroy();
    exit;
}

// ------------------------------------------------------------------
// Freeze follower completely during detach follower
// (Follower stays on screen but does NOTHING)
// ------------------------------------------------------------------
if (global.follower_frozen) {
    exit;
}

// ------------------------------------------------------------------
// If cutscene is active, follower should not auto-follow
// (But can still be moved manually using cutscene steps)
// ------------------------------------------------------------------
if (instance_exists(obj_cutscene) && obj_cutscene.active) {
    exit;
}

// ------------------------------------------------------------------
// FOLLOWING LOGIC (only happens when allowed)
// ------------------------------------------------------------------

// Follow Haru's recorded position
x = obj_player.pos_x[record];
y = obj_player.pos_y[record];

var recorded_sprite = obj_player.toRecordSprite[record];

// If Maya is close enough to Haru, use Haru’s current idle sprite
if (point_distance(x, y, obj_player.x, obj_player.y) < 50) {
    recorded_sprite = obj_player.sprite_index;
}

// ------------------------------------------------------------------
// SPRITE SYNCING LOGIC
// ------------------------------------------------------------------
switch (recorded_sprite) {

    case going_right_sides_haru:
        sprite_index = going_right_sides_maya;
        image_xscale = 1;
        break;

    case going_left_sides_haru:
        sprite_index = going_left_sides_maya;
        image_xscale = 1;
        break;

    case going_up_haru:
        sprite_index = going_up_maya;
        image_xscale = 1;
        break;

    case going_down_haru:
        sprite_index = going_down_maya;
        image_xscale = 1;
        break;

    case right_idle_haru:
        sprite_index = right_idle_maya;
        image_xscale = 1;
        break;

    case left_idle_haru:
        sprite_index = left_idle_maya;
        image_xscale = 1;
        break;

    case back_haru:
        sprite_index = idle_back_maya;
        image_xscale = 1;
        break;

    case front_haru:
        sprite_index = idle_front_maya;
        image_xscale = 1;
        break;
}




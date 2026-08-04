// ===================================================
// ROOM START EVENT — FIXED
// ===================================================

// Safety globals
if (!variable_global_exists("follower_unlocked")) global.follower_unlocked = false;
if (!variable_global_exists("follower_present")) global.follower_present = false;
if (!variable_global_exists("spawn_follower_next_step")) global.spawn_follower_next_step = false;

// Reset follower recording arrays
var len = array_length(pos_x);
for (var i = 0; i < len; i++)
{
    pos_x[i] = x;
    pos_y[i] = y;
    toRecordSprite[i] = sprite_index;
}

// Camera reattach AFTER room change
// (Room Start has NO arguments — use globals instead)
if (variable_global_exists("camera_target") && instance_exists(global.camera_target))
{
    camera_set_view_target(view_camera[0], global.camera_target);
    show_debug_message("Camera reattached to player after room change!");
}

// Tilemap lookup
tilemap = layer_tilemap_get_id(layer_get_id("Tiles_Col"));

// FOLLOWER RESPAWN LOGIC
if (global.follower_unlocked && global.follower_present)
{
    global.spawn_follower_next_step = true;
}

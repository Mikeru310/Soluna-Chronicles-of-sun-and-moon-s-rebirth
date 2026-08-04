escapeDelay = 0;
dead = false;

distance_to_player = 80;
move_speed = 1;

target_x = x;
target_y = y;

alarm[0] = 60;

tilemap = layer_tilemap_get_id("Tiles_Col");

// ✅ Only set defaults IF the room didn't already set them
if (!variable_instance_exists(id, "encounter_data")) {
    encounter_data = noone;
}
if (!variable_instance_exists(id, "encounter_bg")) {
    encounter_bg = -1;
}

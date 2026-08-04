spawn_x = x;
spawn_y = y;

tilemap = layer_tilemap_get_id(layer_get_id("Tiles_Col"));

detection_radius = 100;
chase_speed = 0.8;
return_speed = 1.7;

state = "patrol";

patrol_path = noone; // your patrol path
// return_path REMOVED because we don't use paths anymore

escapeDelay = 0;
dead = false;

alarm[0] = 5;

prev_x = x;
prev_y = y;

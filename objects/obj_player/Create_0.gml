// CREATE EVENT (fixed)
/// Movement speed
move_speed = 1.8;

/// ⭐ CRITICAL: Initialize gold if it doesn't exist
if (!variable_global_exists("gold")) {
    global.gold = 0;
    show_debug_message("Player Create: Initialized global.gold to 0");
}

/// Collision setup
tilemap = layer_tilemap_get_id(layer_get_id("Tiles_Col"));

npc_name = "Haru";

/// Previous position tracker
previous_x = x;
previous_y = y;

/// Size of history array
array_size = 40;

/// Initialize position and sprite history
for (var i = array_size - 1; i >= 0; i--) {
    pos_x[i] = x;
    pos_y[i] = y;
    toRecordSprite[i] = front_haru;
}

/// Interaction cooldown
interaction_cooldown = 0;

show_debug_message("obj_player Create triggered at x=" + string(x) + ", y=" + string(y));

/// Ensure single instance properly (check that the stored id is valid)
if (variable_global_exists("player") && instance_exists(global.player)) {
    // another valid player already exists -> destroy this one
    instance_destroy();
    exit;
} else {
    // claim global.player even if previous global.player existed but was invalid
    global.player = id;
}

/// Keep persistence as before
persistent = true;

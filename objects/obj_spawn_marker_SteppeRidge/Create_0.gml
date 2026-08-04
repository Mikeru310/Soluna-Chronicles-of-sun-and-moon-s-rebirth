
if (room == global.save_room && x == global.saved_x && y == global.saved_y) {
    if (!instance_exists(obj_player)) {
        instance_create_layer(x, y, "Instances", obj_player);
        show_debug_message("✅ Spawned player at: " + string(x) + ", " + string(y));
    }
}

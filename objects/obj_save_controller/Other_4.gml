if (global.force_teleport) {
    global.force_teleport = false;

    if (!instance_exists(obj_player)) {
        var player = instance_create_layer(global.saved_x, global.saved_y, "Instances", obj_player);
        show_debug_message("✅ Spawned player at " + string(global.saved_x) + ", " + string(global.saved_y));
    } else {
        var player = instance_find(obj_player, 0);
        player.x = global.saved_x;
        player.y = global.saved_y;
        show_debug_message("✅ Moved player to " + string(global.saved_x) + ", " + string(global.saved_y));
    }
}

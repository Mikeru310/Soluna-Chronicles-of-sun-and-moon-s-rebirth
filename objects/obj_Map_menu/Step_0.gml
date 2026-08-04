// Close map
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("X")))
{
    instance_destroy();
    objGame.menu_open = false;
    exit;
}

// Refresh player reference if missing
if (!instance_exists(player))
{
    if (instance_exists(obj_player))
        player = instance_find(obj_player, 0);
}

// Update dot only if player exists
if (instance_exists(player))
{
    var px_ratio = clamp(player.x / room_width, 0, 1);
    var py_ratio = clamp(player.y / room_height, 0, 1);

    dot_x = panel_x + px_ratio * panel_w;
    dot_y = panel_y + py_ratio * panel_h;
}

if (instance_exists(obj_player)) {
    var player_close = point_distance(x, y, obj_player.x, obj_player.y) < 30;

    if (!opened && player_close && keyboard_check_pressed(ord("Z"))) {
        ChestAddToInventory(chest_item, chest_amount);
        opened = true;
        sprite_index = spr_chest_opened;
        create_textbox(text_id);

        // 🔹 Save this chest as opened (prevent re-opening)
        array_push(global.chests_opened, chest_id);
    }
}

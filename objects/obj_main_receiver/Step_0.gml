if (opened) exit;

// Player interacts with item (lost card / chest)
if (point_distance(x, y, obj_player.x, obj_player.y) < 30 
    && keyboard_check_pressed(ord("Z"))) {

    opened = true;

    // Popup to player
    scr_show_popup("You found the lost card! Return to the quest giver.");

    // Mark quest progress
    global.side_quest_0_item_found = true;

    // Update quest description dynamically
    for (var i = 0; i < array_length(global.quest_data); i++) {
        if (global.quest_data[i][? "id"] == "side_quest_0") {
            global.quest_data[i][? "description"] =
                "You found the lost card. Return it to the giver.";
        }
    }

    // Remove the lost item
    instance_destroy();
}

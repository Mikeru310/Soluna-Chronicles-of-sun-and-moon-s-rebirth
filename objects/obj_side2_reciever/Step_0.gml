if (opened) exit;

if (point_distance(x, y, obj_player.x, obj_player.y) < 30
    && keyboard_check_pressed(ord("Z")))
{
    opened = true;

    scr_show_popup("You collected the Fern Sample! Return to Lysa.");

    global.side_quest_2_item_found = true;

    // Update quest description
    for (var i = 0; i < array_length(global.quest_data); i++) {
        if (global.quest_data[i][? "id"] == "side_quest_2") {
            global.quest_data[i][? "description"] =
                "You found the Fern Sample.\nReturn it to Lysa.";
        }
    }

    instance_destroy();
}

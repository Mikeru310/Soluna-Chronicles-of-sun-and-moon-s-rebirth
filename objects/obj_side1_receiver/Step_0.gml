if (opened) exit;

if (point_distance(x, y, obj_player.x, obj_player.y) < 30
    && keyboard_check_pressed(ord("Z")))
{
    opened = true;

    scr_show_popup("You found Dave's Beekeeper's Jar!");

    global.side_quest_1_item_found = true;

    // Update description
    for (var i = 0; i < array_length(global.quest_data); i++) {
        if (global.quest_data[i][? "id"] == "side_quest_1") {
            global.quest_data[i][? "description"] =
                "You found the Beekeeper's Jar.\nReturn to Dave.";
        }
    }

    instance_destroy();
}

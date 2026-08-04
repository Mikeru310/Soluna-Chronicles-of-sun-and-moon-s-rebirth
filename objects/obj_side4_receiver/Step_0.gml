/// STEP EVENT — obj_side4_receiver

if (opened) exit;

// Player interacts using Z near item
if (point_distance(x, y, obj_player.x, obj_player.y) < 30
    && keyboard_check_pressed(ord("Z")))
{
    opened = true;

    scr_show_popup("You collected Nira's Wooden Flute! Return to her.");

    // Mark quest item found
    global.side_quest_4_item_found = true;

    // Update quest description in quest log
    for (var i = 0; i < array_length(global.quest_data); i++)
    {
        if (global.quest_data[i][? "id"] == "side_quest_4")
        {
            global.quest_data[i][? "description"] =
                "You retrieved Nira's flute.\nReturn it to her on the trail.";
        }
    }

    instance_destroy();
}

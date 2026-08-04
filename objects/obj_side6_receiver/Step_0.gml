/// STEP EVENT — obj_side6_receiver

if (opened) exit;

// Player presses Z near sword
if (point_distance(x, y, obj_player.x, obj_player.y) < 30
    && keyboard_check_pressed(ord("Z")))
{
    opened = true;

    scr_show_popup("You retrieved the Captain's Sword! Return to Maxim.");

    // Mark quest item found
    global.side_quest_6_item_found = true;

    // Update quest description in log
    for (var i = 0; i < array_length(global.quest_data); i++)
    {
        if (global.quest_data[i][? "id"] == "side_quest_6")
        {
            global.quest_data[i][? "description"] =
                "You recovered Captain Maxim's sword.\nBring it back to him.";
        }
    }

    instance_destroy();
}

/// STEP EVENT — obj_side5_receiver

if (opened) exit;

// Player interaction (Z key)
if (point_distance(x, y, obj_player.x, obj_player.y) < 30
    && keyboard_check_pressed(ord("Z")))
{
    opened = true;

    scr_show_popup("You recovered the Lost Ring! Return to Neher.");

    // Mark quest item found
    global.side_quest_5_item_found = true;

    // Update quest description in quest log
    for (var i = 0; i < array_length(global.quest_data); i++)
    {
        if (global.quest_data[i][? "id"] == "side_quest_5")
        {
            global.quest_data[i][? "description"] =
                "You found Neher's wife's ring.\nBring it back to him.";
        }
    }

    instance_destroy();
}

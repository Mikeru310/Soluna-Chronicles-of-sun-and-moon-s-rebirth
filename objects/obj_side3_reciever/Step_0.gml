/// STEP EVENT — obj_side3_receiver

if (opened) exit;

if (point_distance(x, y, obj_player.x, obj_player.y) < 30
    && keyboard_check_pressed(ord("Z")))
{
    opened = true;

    scr_show_popup("You collected the Merchant's Parcel! Return to Hanko.");

    // Mark the quest item as found
    global.side_quest_3_item_found = true;

    // Update quest description in the quest log
    for (var i = 0; i < array_length(global.quest_data); i++)
    {
        if (global.quest_data[i][? "id"] == "side_quest_3")
        {
            global.quest_data[i][? "description"] =
                "You recovered the missing parcel.\nReturn it to Hanko.";
        }
    }

    instance_destroy();
}

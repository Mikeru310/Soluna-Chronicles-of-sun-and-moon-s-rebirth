/// STEP EVENT — obj_side7_receiver

if (opened) exit;

// Player interacts with Z
if (point_distance(x, y, obj_player.x, obj_player.y) < 30
    && keyboard_check_pressed(ord("Z")))
{
    opened = true;

    scr_show_popup("You recovered the Commander's Lost Flag!");

    // Mark quest item found
    global.side_quest_7_item_found = true;

    // Update quest description in quest log
    for (var i = 0; i < array_length(global.quest_data); i++)
    {
        if (global.quest_data[i][? "id"] == "side_quest_7")
        {
            global.quest_data[i][? "description"] =
                "You retrieved Commander Eld's command flag.\nReturn to him.";
        }
    }

    instance_destroy();
}

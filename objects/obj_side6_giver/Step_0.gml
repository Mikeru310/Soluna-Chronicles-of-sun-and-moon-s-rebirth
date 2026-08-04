/// STEP EVENT — Side Quest 6 Giver (Captain Maxim)


// ---------------------------------------------------------
// QUEST MARKER HANDLER
// ---------------------------------------------------------
if (!marker_created)
{
    var has_marker = false;

    with (obj_quest_marker)
    {
        if (parent_npc == other.id && quest_id == "side_quest_6")
            has_marker = true;
    }

    if (!has_marker)
    {
        var m = instance_create_layer(x, y, "Instances", obj_quest_marker);
        m.parent_npc = id;
        m.quest_id   = "side_quest_6";
        marker_created = true;
    }
}



// ---------------------------------------------------------
// CASE 0 — POST-QUEST DIALOGUE
// ---------------------------------------------------------
if (global.side_quest_6_complete)
{
    if (instance_exists(obj_player))
    {
        var close = point_distance(x, y, obj_player.x, obj_player.y) < 30;

        if (close && keyboard_check_pressed(ord("Z")))
        {
            if (!instance_exists(obj_textbox))
            {
                text_x_offset = array_create(50,0);
                text_y_offset = array_create(50,0);

                create_textbox("side_quest_6_after");
                obj_player.can_move = false;
            }

            exit;
        }
    }
}



// ---------------------------------------------------------
// NORMAL QUEST LOGIC
// ---------------------------------------------------------
if (interaction_cooldown > 0)
    interaction_cooldown--;

if (instance_exists(obj_player))
{
    var pc = point_distance(x, y, obj_player.x, obj_player.y) < 30;

    if (pc && keyboard_check_pressed(ord("Z")) && interaction_cooldown <= 0)
    {
        interaction_cooldown = room_speed / 3;



        // CASE 1 — PLAYER RETURNS WITH ITEM
        if (global.side_quest_6_item_found && !global.side_quest_6_complete)
        {
            if (!instance_exists(obj_textbox))
            {
                text_x_offset = array_create(50,0);
                text_y_offset = array_create(50,0);

                create_textbox("side_quest_6_complete_dialogue");
                obj_player.can_move = false;
            }

            global.side_quest_6_complete = true;
            scr_show_popup("Side Quest Complete!");



            // Mark quest complete in quest log
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_6")
                {
                    global.quest_data[i][? "completed"] = true;
                }
            }


            // 🔥 Reset original description (added)
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_6")
                {
                    global.quest_data[i][? "description"] =
                        "Captain Maxim lost his sword during battle.\nRetrieve it from Act 4 Area 1 and return it to him.";
                }
            }


            // Reward
            global.gold += 600;
            scr_show_popup("Reward Received:\n+ 600 Gold");

            exit;
        }



        // CASE 2 — MID-QUEST DIALOGUE
        if (global.side_quest_6_started
        && !global.side_quest_6_item_found
        && global.side_quest_6_given)
        {
            if (!instance_exists(obj_textbox))
            {
                text_x_offset = array_create(50,0);
                text_y_offset = array_create(50,0);

                create_textbox("side_quest_6_progress");
                obj_player.can_move = false;
            }

            exit;
        }



        // CASE 3 — INTRO / QUEST OFFER
        if (!global.side_quest_6_given
        && !global.side_quest_6_started
        && !global.side_quest_6_item_found)
        {
            if (!instance_exists(obj_textbox))
            {
                text_x_offset = array_create(50,0);
                text_y_offset = array_create(50,0);

                create_textbox(text_id);
                obj_player.can_move = false;
            }
        }
    }
}



// ---------------------------------------------------------
// FINAL QUEST ACTIVATION
// ---------------------------------------------------------
if (global.side_quest_6_requested && !global.side_quest_6_given)
{
    scr_quest_add("side_quest_6",
        "Captain's Edge",
        "Retrieve Captain Maxim's sword from the mountain in Act 4.",
        "Side Quest");

    scr_show_popup("New Side Quest Added!");

    global.side_quest_6_given     = true;
    global.side_quest_6_started   = true;
    global.side_quest_6_requested = false;
}

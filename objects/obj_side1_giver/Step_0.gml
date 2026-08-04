/// STEP EVENT — Side Quest Giver (Lost Beekeeper's Jar)



// ---------------------------------------------------------
// QUEST MARKER HANDLER
// ---------------------------------------------------------
if (!marker_created)
{
    var has_marker = false;

    with (obj_quest_marker)
    {
        if (parent_npc == other.id && quest_id == "side_quest_1")
            has_marker = true;
    }

    if (!has_marker)
    {
        var m = instance_create_layer(x, y, "Instances", obj_quest_marker);
        m.parent_npc = id;
        m.quest_id   = "side_quest_1";
        marker_created = true;
    }
}



// ---------------------------------------------------------
// CASE 0 — POST-QUEST DIALOGUE
// ---------------------------------------------------------
if (global.side_quest_1_complete)
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

                create_textbox("side_quest_1_after");
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
       // CASE 1 — PLAYER RETURNS WITH ITEM (SIDE QUEST 1)
if (global.side_quest_1_item_found && !global.side_quest_1_complete)
{
    if (!instance_exists(obj_textbox))
    {
        text_x_offset = array_create(50,0);
        text_y_offset = array_create(50,0);

        create_textbox("side_quest_1_complete_dialogue");
        obj_player.can_move = false;
    }

    global.side_quest_1_complete = true;
    scr_show_popup("Side Quest Complete!");


    // Mark SIDE QUEST as complete — same style as main quest
    for (var i = 0; i < array_length(global.quest_data); i++)
    {
        if (global.quest_data[i][? "id"] == "side_quest_1")
        {
            global.quest_data[i][? "completed"] = true;
        }
    }


    // Reset original quest description (optional)
    for (var i = 0; i < array_length(global.quest_data); i++)
    {
        if (global.quest_data[i][? "id"] == "side_quest_1")
        {
            global.quest_data[i][? "description"] =
                "A drunk villager lost his Beekeeper's Jar.\n" +
                "Search the houses and Jerstine's shop area for it.";
        }
    }

    // Reward — match your balancing
    global.gold += 300;
    scr_show_popup("Reward Received:\n+ 300 Gold");

    exit;
}



        // CASE 2 — MID-QUEST DIALOGUE
        if (global.side_quest_1_started
        && !global.side_quest_1_item_found
        && global.side_quest_1_given)
        {
            if (!instance_exists(obj_textbox))
            {
                text_x_offset = array_create(50,0);
                text_y_offset = array_create(50,0);

                create_textbox("side_quest_1_progress");
                obj_player.can_move = false;
            }

            exit;
        }


        // CASE 3 — INTRO DIALOGUE / GIVE QUEST
        if (!global.side_quest_1_given
        && !global.side_quest_1_started
        && !global.side_quest_1_item_found)
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
if (global.side_quest_1_requested && !global.side_quest_1_given)
{
    scr_quest_add("side_quest_1",
        "Lost Beekeeper's Jar",
        "Find the missing jar near the houses.",
        "Side Quest");

    scr_show_popup("New Side Quest Added!");

    global.side_quest_1_given     = true;
    global.side_quest_1_started   = true;
    global.side_quest_1_requested = false;
}

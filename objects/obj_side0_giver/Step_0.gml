/// STEP EVENT — UPDATED WITH POST-QUEST DIALOGUE

/// QUEST MARKER HANDLER (SAFE)
if (!marker_created)
{
    var has_marker = false;

    with (obj_quest_marker)
    {
        if (parent_npc == other.id && quest_id == "side_quest_0")
            has_marker = true;
    }

    if (!has_marker)
    {
        var m = instance_create_layer(x, y, "Instances", obj_quest_marker);
        m.parent_npc = id;
        m.quest_id   = "side_quest_0";
        marker_created = true;
    }
}



// ---------------------------------------------------------
// CASE 0: POST-QUEST DIALOGUE (highest priority)
// ---------------------------------------------------------
if (global.side_quest_0_complete)
{
    if (instance_exists(obj_player)) {

        var close = point_distance(x, y, obj_player.x, obj_player.y) < 30;

        if (close && keyboard_check_pressed(ord("Z")))
        {
            if (!instance_exists(obj_textbox))
            {
                text_x_offset = array_create(50, 0);
                text_y_offset = array_create(50, 0);

                create_textbox("side_quest_0_after");
                obj_player.can_move = false;
            }

            exit; // only exit WHEN dialogue triggers
        }
    }
}



// ---------------------------------------------------------
// NORMAL QUEST LOGIC — ONLY IF QUEST NOT COMPLETED
// ---------------------------------------------------------

// Interaction cooldown
if (interaction_cooldown > 0)
    interaction_cooldown--;

// Player interaction
if (instance_exists(obj_player))
{
    var player_close = point_distance(x, y, obj_player.x, obj_player.y) < 30;

    if (player_close && keyboard_check_pressed(ord("Z")) && interaction_cooldown <= 0)
    {
        interaction_cooldown = room_speed / 3;


        // ======================================
        // CASE 1: PLAYER RETURNS WITH ITEM
        // ======================================
        if (global.side_quest_0_item_found && !global.side_quest_0_complete)
        {
            if (!instance_exists(obj_textbox))
            {
                create_textbox("side_quest_0_complete_dialogue");
                obj_player.can_move = false;
            }

            global.side_quest_0_complete = true;
            scr_show_popup("Quest Complete!");


            // Mark quest as complete
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_0")
                {
                    global.quest_data[i][? "completed"] = true;
                }
            }

            // Reset original description
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_0")
                {
                    global.quest_data[i][? "description"] =
                        "The village giver lost his developer debit card.\n" +
                        "Search the town for a chest containing it.";
                }
            }

            // Reward
            global.gold += 500;
            scr_show_popup("Reward Received:\n+ 500 Gold");

            exit;
        }



        // ======================================
        // CASE 2: MID-QUEST DIALOGUE
        // ======================================
        if (global.side_quest_0_started
        && !global.side_quest_0_item_found
        && global.side_quest_0_given)
        {
            if (!instance_exists(obj_textbox))
            {
                create_textbox("side_quest_0_progress");
                obj_player.can_move = false;
            }

            exit;
        }



        // ======================================
        // CASE 3: FIRST TIME TALK — GIVE QUEST
        // ======================================
        if (!global.side_quest_0_given
        && !global.side_quest_0_started
        && !global.side_quest_0_item_found)
        {
            if (!instance_exists(obj_textbox))
            {
                create_textbox(text_id);
                obj_player.can_move = false;
            }
        }
    }
}



// ==================================================================
// SAFE QUEST ACTIVATION
// ==================================================================
if (global.side_quest_0_requested && !global.side_quest_0_given)
{
    var q_title = "Lost Card";
    var q_desc  = "The village giver lost his developer debit card.\nSearch the town for a chest containing it.";
    var q_type  = "Main Quest";

    scr_quest_add("side_quest_0", q_title, q_desc, q_type);

    scr_show_popup("New Quest Added: " + q_title);

    global.side_quest_0_given     = true;
    global.side_quest_0_requested = false;
    global.side_quest_0_started   = true;
}

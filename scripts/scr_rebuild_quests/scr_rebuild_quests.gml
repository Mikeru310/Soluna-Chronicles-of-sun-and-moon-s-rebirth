function scr_rebuild_quests()
{
    global.quest_data = []; // wipe clean

    // ------------------------------------------------------
    // MAIN QUEST 1
    // ------------------------------------------------------
    if (variable_global_exists("side_quest_0_given") && global.side_quest_0_given)
    {
        scr_quest_add(
            "side_quest_0",
            "Lost Card",
            "The village giver lost his developer debit card.\nSearch the town for a chest containing it.",
            "Main Quest"
        );

        if (variable_global_exists("side_quest_0_complete") && global.side_quest_0_complete)
        {
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_0")
                {
                    global.quest_data[i][? "completed"] = true;
                }
            }
        }
    }

    // ------------------------------------------------------
    // SIDE QUEST 1
    // ------------------------------------------------------
    if (variable_global_exists("side_quest_1_given") && global.side_quest_1_given)
    {
        scr_quest_add("side_quest_1","Lost Beekeeper's Jar",
            "A drunk villager lost his Beekeeper's Jar.\nSearch the houses and Jerstine's shop area for it.",
            "Side Quest"
        );

        if (variable_global_exists("side_quest_1_complete") && global.side_quest_1_complete)
        {
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_1")
                {
                    global.quest_data[i][? "completed"] = true;
                }
            }
        }
    }

    // SIDE QUEST 2
    if (variable_global_exists("side_quest_2_given") && global.side_quest_2_given)
    {
        scr_quest_add("side_quest_2", "Herbalist’s Fern Sample",
            "Collect rare fern samples from the forest clearing.", "Side Quest");

        if (variable_global_exists("side_quest_2_complete") && global.side_quest_2_complete)
        {
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_2")
                {
                    global.quest_data[i][? "completed"] = true;
                }
            }
        }
    }

    // SIDE QUEST 3
    if (variable_global_exists("side_quest_3_given") && global.side_quest_3_given)
    {
        scr_quest_add("side_quest_3", "Merchant's Lost Parcel",
            "Search for the merchant's missing parcel near the forest entrance.",
            "Side Quest");

        if (variable_global_exists("side_quest_3_complete") && global.side_quest_3_complete)
        {
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_3")
                {
                    global.quest_data[i][? "completed"] = true;
                }
            }
        }
    }

    // SIDE QUEST 4
    if (variable_global_exists("side_quest_4_given") && global.side_quest_4_given)
    {
        scr_quest_add("side_quest_4","Herder's Wooden Flute",
            "A herder lost his flute. Recover it from the trail.","Side Quest");

        if (variable_global_exists("side_quest_4_complete") && global.side_quest_4_complete)
        {
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_4")
                {
                    global.quest_data[i][? "completed"] = true;
                }
            }
        }
    }

    // SIDE QUEST 5
    if (variable_global_exists("side_quest_5_given") && global.side_quest_5_given)
    {
        scr_quest_add("side_quest_5","Neher's Wife's Ring",
            "Search the nearby woods for the missing ring.","Side Quest");

        if (variable_global_exists("side_quest_5_complete") && global.side_quest_5_complete)
        {
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_5")
                {
                    global.quest_data[i][? "completed"] = true;
                }
            }
        }
    }

    // SIDE QUEST 6
    if (variable_global_exists("side_quest_6_given") && global.side_quest_6_given)
    {
        scr_quest_add("side_quest_6","Captain's Edge",
            "Retrieve the captain’s sword from the old battleground.","Side Quest");

        if (variable_global_exists("side_quest_6_complete") && global.side_quest_6_complete)
        {
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_6")
                {
                    global.quest_data[i][? "completed"] = true;
                }
            }
        }
    }

    // SIDE QUEST 7
    if (variable_global_exists("side_quest_7_given") && global.side_quest_7_given)
    {
        scr_quest_add("side_quest_7","Commander's Lost Flag",
            "Commander Eld lost his old command flag.\nRetrieve it from Act 4 - Area 3 and return it to him.",
            "Side Quest");

        if (variable_global_exists("side_quest_7_complete") && global.side_quest_7_complete)
        {
            for (var i = 0; i < array_length(global.quest_data); i++)
            {
                if (global.quest_data[i][? "id"] == "side_quest_7")
                {
                    global.quest_data[i][? "completed"] = true;
                }
            }
        }
    }
}

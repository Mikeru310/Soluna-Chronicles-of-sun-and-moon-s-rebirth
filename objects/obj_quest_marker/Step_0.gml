/// STEP EVENT — quest marker logic

if (!instance_exists(parent_npc)) {
    instance_destroy();
    exit;
}

// Determine state based on quest_id
switch (quest_id)
{
    case "side_quest_0":
        if (global.side_quest_0_complete)
            state = "done";
        else if (global.side_quest_0_started)
            state = "progress";
        else
            state = "available";
    break;

    case "side_quest_1":
        if (global.side_quest_1_complete)
            state = "done";
        else if (global.side_quest_1_started)
            state = "progress";
        else
            state = "available";
    break;

    case "side_quest_2":
        if (global.side_quest_2_complete)
            state = "done";
        else if (global.side_quest_2_started)
            state = "progress";
        else
            state = "available";
    break;

    case "side_quest_3":
        if (global.side_quest_3_complete)
            state = "done";
        else if (global.side_quest_3_started)
            state = "progress";
        else
            state = "available";
    break;

    case "side_quest_4":
        if (global.side_quest_4_complete)
            state = "done";
        else if (global.side_quest_4_started)
            state = "progress";
        else
            state = "available";
    break;

    case "side_quest_5":
        if (global.side_quest_5_complete)
            state = "done";
        else if (global.side_quest_5_started)
            state = "progress";
        else
            state = "available";
    break;

    case "side_quest_6":
        if (global.side_quest_6_complete)
            state = "done";
        else if (global.side_quest_6_started)
            state = "progress";
        else
            state = "available";
    break;

    case "side_quest_7":
        if (global.side_quest_7_complete)
            state = "done";
        else if (global.side_quest_7_started)
            state = "progress";
        else
            state = "available";
    break;
}

// Follow NPC
x = parent_npc.x;
y = parent_npc.y + offset_y;

/// scr_main_quest_progress(stage)
function scr_main_quest_progress(_stage)
{
    // Always ensure main quest exists in the list
    var exists = false;
    for (var i = 0; i < array_length(global.quest_data); i++)
    {
        if (global.quest_data[i][? "id"] == "main_quest")
        {
            exists = true;
            break;
        }
    }

    if (!exists)
    {
        scr_quest_add("main_quest", "Main Story", "Follow the story objective.", "Main Quest");
    }

    // Always place main quest on top
    var index = -1;
    for (var i = 0; i < array_length(global.quest_data); i++)
    {
        if (global.quest_data[i][? "id"] == "main_quest")
        {
            index = i;
            break;
        }
    }

    if (index > 0)
    {
        var temp = global.quest_data[index];
        array_delete(global.quest_data, index, 1);
        array_insert(global.quest_data, 0, temp);
    }

    //------------------------------------
    // UPDATE QUEST BASED ON STAGE NUMBER
    //------------------------------------
    var q = global.quest_data[0]; // main quest always top

    switch (_stage)
    {
        //Start of Act 1
        case 0:
            q[? "description"] = "Go Meet with Maya at the Shrine.";
            q[? "started"] = true;
            scr_show_popup("Main Quest Accepted: The Beginning");
        break;

        case 1:
            q[? "description"] = "Ivestigate the  Landslide across the river.";
            scr_show_popup("Main Quest Updated!");
        break;

        case 2:
            q[? "description"] = "Investigate the Cave and Find the cause of the Landslide.";
            scr_show_popup("Main Quest Updated!");
        break;

        case 4:
            q[? "description"] = "Go meet with at the shrine again.";
            scr_show_popup("Main Quest Updated!");
        break;
    
        case 5:
            q[? "description"] = "Go checked if the guards had cleared the path";
            scr_show_popup("Main Quest Updated!");
        break;
    
        case 6:
            q[? "description"] = "Maya ran ahead. Catch up with her to find out whats the problem.";
            scr_show_popup("Main Quest Updated!");
        break;
    
        // End of Act 1
    
        // Start of Act 2 
        case 7:
            q[? "description"] = "Go towards Steppe Ridge, then proceed to the fortress.";
            scr_show_popup("Main Quest Updated!");
        break;

        case 8:
            q[? "description"] = "Encounter the Mysterious Presence that Airy has detected.";
            scr_show_popup("Main Quest Updated!");
        break; 
        case 9:
            q[? "description"] = "Go to the back area of the castle and follow the path";
            scr_show_popup("Main Quest Updated!");
        break;
        //End of Act 2
    
        //Start of Act 3     
        case 10:
            q[? "description"] = "Follow the swampy road too locate Driftshade Hamlet, then Continue on the Journey";
            scr_show_popup("Main Quest Updated!");
        break;
        case 11:
            q[? "description"] = "Follow the Path to the Mysterious Voice.";
            scr_show_popup("Main Quest Updated!");
        break;
    
        case 12:
            q[? "description"] = "You have collected all the Fragments, proceed to Frostwake trail.";
            scr_show_popup("Main Quest Updated!");
        break;
        //End of Act 3
    
        // Start of Act 4
        case 13:
            q[? "description"] = "Follow the path to Everbloom.";
            scr_show_popup("Main Quest Updated!");
        break;
    
        // End of Act 4
    
        //End of the Game
        case 14:
            q[? "description"] = "Main Quest Completed!";
            q[? "completed"] = true;
            scr_show_popup("Main Quest Complete!");
        break;
        //Game Finish
    }
}

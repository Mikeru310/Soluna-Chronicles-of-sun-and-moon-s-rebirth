if (file_exists("save.json"))
{
    global.confirm_overwrite = true;
    global.confirm_callback = function() {
        reset_game_progress();
        global.play_intro = true;
        room_goto(rm_FOREST_ACT_1_1);
        //room_goto(rm_Plain_Area_2_UPDATED);
        //room_goto(rm_Swamp_Area_3_UPDATED);
        //room_goto(rm_Mountain_Area_2_UPDATED)
        //instance_create_layer(854, 113, "Instances", obj_player);
    };
    exit;
}

// If no save → run normally
reset_game_progress();
global.play_intro = true;
room_goto(rm_FOREST_ACT_1_1);
instance_create_layer(854, 113, "Instances", obj_player);

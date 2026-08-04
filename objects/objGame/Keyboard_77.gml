if (keyboard_check_pressed(ord("M"))) {
    
    // Check if player is in an interior room - if so, don't open map
    var is_interior = false;
    
    // Forest Act interiors
    if (room == rm_Haru_Interior_UPDATED ||
        room == rm_Forest_Inn_Interior_UPDATED || 
        room == rm_Forest_NPC_Interior_UPDATED || 
        room == rm_Forest_Shop_Interior_UPDATED) {
        is_interior = true;
    }
    // Plain Act interiors
    else if (room == rm_Plain_Inn_Interior_UPDATED || 
             room == rm_Plain_NPC_Interior_UPDATED_1 ||
             room == rm_Plain_NPC_Interior_UPDATED_2 ||
             room == rm_Plain_NPC_Interior_UPDATED_3 ||
             room == rm_Plain_NPC_Interior_UPDATED_4 ||
             room == rm_Plain_NPC_Interior_UPDATED_5 ||
             room == rm_Plain_NPC_Interior_UPDATED_6 ||
             room == rm_Plain_NPC_Interior_UPDATED_7 ||
             room == rm_Plain_NPC_Interior_UPDATED_8 ||
             room == rm_Plain_NPC_Interior_UPDATED_9 ||
             room == rm_Plain_Shop_Interior_UPDATED) {
        is_interior = true;
    }
    // Swamp Act interiors
    else if (room == rm_Swamp_Inn_Interior_UPDATED || 
             room == rm_Swamp_NPC_Interior_UPDATED_1 ||
             room == rm_Swamp_NPC_Interior_UPDATED_2 ||
             room == rm_Swamp_NPC_Interior_UPDATED_3 ||
             room == rm_Swamp_NPC_Interior_UPDATED_4 ||
             room == rm_Swamp_Shop_Interior_UPDATED) {
        is_interior = true;
    }
    // Mountain Act interiors
    else if (room == rm_Mountain_Inn_Interior_UPDATED) {
        is_interior = true;
    }
    
    // Only allow map if NOT in interior
    if (!is_interior) {
        if (global.game_state != GAME_STATE.MAP) {
            
            global.game_state = GAME_STATE.MAP;
            
            var cam = camera_get_active();
            var cam_x = camera_get_view_x(cam);
            var cam_y = camera_get_view_y(cam);
            
            if (!instance_exists(obj_Map_menu)) {
                instance_create_layer(cam_x + 10, cam_y + 10, "Instances", obj_Map_menu);
            }
            
        }
        else {
            global.game_state = GAME_STATE.RUNNING;
            
            with(obj_Map_menu)
                instance_destroy();
        }
    }
}
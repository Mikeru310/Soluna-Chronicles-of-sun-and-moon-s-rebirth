// If this trigger was already used, remove it immediately
if (variable_global_exists(trigger_id) && variable_global_get(trigger_id)) {
    instance_destroy();
    exit;
}

// Otherwise run the cutscene
if (!instance_exists(obj_cutscene)) {
    var controller = instance_create_layer(x, y, "Instances", obj_cutscene);
    controller.cutscene_steps = [
         { type:"move camera", move_x:127, move_y:671, speed:2},
        { type:"dialogue", text_id:"NPC5" },
        { type:"path", actor:obj_player, path:pthTest1, speed:1, end_action:path_action_stop, absolute:false },
        { type:"dialogue", text_id:"NPC5" },
        { type:"path", actor:obj_player, path:pthTest2, speed:1, end_action:path_action_stop, absolute:false },
        { type:"dialogue", text_id:"NPC5" },
         {type:"move character", actor:beta_npc8_obj, move_x:256, move_y:847, speed:1},
         {type:"set sprite", actor:obj_player, sprite:spr_Haru_IDLE_R_S_VIEW, image_speed:1},
         {type:"enter battle", enemies:[global.enemies.Bandit, global.enemies.Bandit], bg:Spr_BBG_FOREST_1, tutorial:true}, 
         {type:"dialogue", text_id:"dialogue 1"}
         
         
         
         //{type:"move character", actor:obj_player, move_x: 520, move_y: 620, speed:1}
    ];
    controller.active = true;

    // mark this trigger as used
    variable_global_set(trigger_id, true);

    // remove the trigger from the room
    instance_destroy();
}

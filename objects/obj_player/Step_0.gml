var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);


//prevents players from moving when these objects are created: textbox, inventory, stat view
if (!instance_exists(obj_textbox) && !instance_exists(obj_inventory_gui) && !instance_exists(objStatView) && !instance_exists(obj_rune_menu) && !instance_exists(Forest_shop) && !instance_exists(Plain_shop) &&!objGame.menu_open && !instance_exists(obj_cutscene) &&!instance_exists(Swamp_shop)
    && !instance_exists(obj_Map_menu)&& !instance_exists(obj_quest_menu)) {
    move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);

    if (_hor != 0 || _ver != 0) {
        if (_ver > 0) sprite_index = going_down_haru;
        else if (_ver < 0) sprite_index = going_up_haru;
        else if (_hor > 0) sprite_index = going_right_sides_haru;
        else if (_hor < 0) sprite_index = going_left_sides_haru;
    } 
                    else {
        switch (sprite_index) {
            case going_down_haru:    sprite_index = front_haru; break;
            case going_up_haru:     sprite_index = back_haru; break;
            case going_right_sides_haru: sprite_index = right_idle_haru; break;
            case going_left_sides_haru: sprite_index = left_idle_haru; break;
        }
    }
}

//for follower object
// Update history only if moved
if (x != previous_x || y != previous_y) {
    for (var i = array_size - 1; i > 0; i--) {
        pos_x[i] = pos_x[i - 1];
        pos_y[i] = pos_y[i - 1];
        toRecordSprite[i] = toRecordSprite[i - 1];
    }

    pos_x[0] = x;
    pos_y[0] = y;
    toRecordSprite[0] = sprite_index;
}

// update tracker for next step
previous_x = x;
previous_y = y;

// Interaction check
if (interaction_cooldown > 0) {
    interaction_cooldown -= 1;
}

if (interaction_cooldown <= 0) {
    if (keyboard_check_pressed(ord("Z"))) {
        var npc = instance_place(x, y, obj_teller1);
        if (npc == noone) npc = instance_place(x, y, obj_teller2);

        if (npc != noone) {
            npc.interact = true;
            interaction_cooldown = room_speed / 4;
        }
    }
}

//for lanterns
if (keyboard_check_pressed(ord("Z"))) {
    var inst = instance_nearest(x, y, objLight);
    if (instance_exists(inst) && point_distance(x, y, inst.x, inst.y) < 24) {
        inst.ActivateLight(180); // stays lit for 1 second (60 frames)
    }
}

if (global.spawn_follower_next_step)
{
    global.spawn_follower_next_step = false;

    if (!instance_exists(obj_follower)) {
        var _f = instance_create_layer(x, y, "Instances", obj_follower);
        _f.record = 15;
    }
}

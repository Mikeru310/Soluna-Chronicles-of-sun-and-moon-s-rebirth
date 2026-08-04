// === 0. Run this once only ===
if (!initialized && !dialogue_ended) {
    if (npc_id != noone && variable_instance_exists(npc_id, "welcome_text")) {
        text = npc_id.welcome_text;
    } else {
        text = "Hello. Would you like to rest here?";
    }

    show_choices = true;
    finished = false;
    text_index = 0;
    initialized = true;
}

// === 1. Show full text instantly
if (!finished) {
    text_index = string_length(text);
    finished = true;
} else {
    // === 2. Handle Yes/No input
    if (show_choices) {
        if (keyboard_check_pressed(vk_left))  choice = 0;
        if (keyboard_check_pressed(vk_right)) choice = 1;

        if (keyboard_check_pressed(ord("Z"))) {
            show_choices = false;

            if (npc_id != noone) {
               if (choice == 0) {
    text = npc_id.response_yes;

    // ✅ SAVE SPAWN LOCATION HERE
   if (variable_instance_exists(npc_id, "spawn_marker") && npc_id.spawn_marker != noone) {
    global.saved_x = npc_id.spawn_marker.x;
    global.saved_y = npc_id.spawn_marker.y;
    global.save_room = room;
    
    // Set label for GUI display
    if (variable_instance_exists(npc_id.spawn_marker, "marker_label")) {
        global.last_saved_label = npc_id.spawn_marker.marker_label;
    } else {
        global.last_saved_label = "Unknown Location";
    }

        // ✅ JSON SAVE TO FILE
       var save_data = {
    x: global.saved_x,
    y: global.saved_y,
    room: room_get_name(global.save_room),
    label: npc_id.spawn_location_name // ✅ Save location label
};


        var json_str = json_stringify(save_data);

        var file = file_text_open_write(global.save_path);
        file_text_write_string(file, json_str);
        file_text_close(file);
    }
} else {
    text = npc_id.response_no;
}



            } else {
                // Fallback default
                text = (choice == 0) ? "You feel well rested." : "Very well. Enjoy your visit!";
            }

            dialogue_stage = 1;
            text_index = 0;
            finished = false;
        }
    }

    // === 3. End dialogue after response
    else if (keyboard_check_pressed(ord("Z")) && dialogue_stage == 1) {
        global.can_move = true;
        dialogue_ended = true;

        // ✅ Let NPC know dialogue finished
        if (npc_id != noone) {
            npc_id.dialogue_ended = true;
            npc_id.has_talked = true;
        }

        instance_destroy(); // ✅ Close dialogue box
    }
}
show_debug_message("Saved at x: " + string(global.saved_x) + ", y: " + string(global.saved_y) + ", room: " + room_get_name(global.save_room));

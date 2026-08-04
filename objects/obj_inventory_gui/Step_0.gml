/// STEP EVENT — UPDATED SAFE VERSION

// ================================
// INVENTORY NAVIGATION
// ================================
if (!global.item_use_mode) {

    // Up and Down navigation through inventory
    if (keyboard_check_pressed(vk_up)) {
        global.selected_item = max(0, global.selected_item - 1);
    }
    if (keyboard_check_pressed(vk_down)) {
        global.selected_item = min(array_length(global.inventory) - 1, global.selected_item + 1);
    }


    // ================================
    // Z — Attempt to use an item
    // ================================
    if (keyboard_check_pressed(ord("Z"))) {

        if (global.selected_item >= 0 && global.selected_item < array_length(global.inventory)) {

            var entry = global.inventory[global.selected_item];

            // 🛑 BLOCK undefined slots
            if (entry == undefined) {
                global.feedback_message = "No item here!";
                global.feedback_timer = 60;
                exit;
            }

            // 🛑 BLOCK invalid slots
            if (!is_array(entry) || array_length(entry) < 2) {
                global.feedback_message = "Invalid item!";
                global.feedback_timer = 60;
                exit;
            }

            var amt = entry[1];

            // 🛑 BLOCK x0 items
            if (amt <= 0) {
                global.feedback_message = "No more left!";
                global.feedback_timer = 60;
                exit;
            }

            // ✔️ VALID ITEM → Enter target selection
            global.item_use_mode = true;
            global.item_use_target = 0;
        }
    }


    // X — Exit inventory
    if (keyboard_check_pressed(ord("X"))) {
        instance_destroy(); // your exit logic
    }
}


// ================================
// TARGET SELECTION MODE
// ================================
else {

    // Left/Right to choose Haru (0) or Maya (1)
    if (keyboard_check_pressed(vk_left))  global.item_use_target = 0;
    if (keyboard_check_pressed(vk_right)) global.item_use_target = 1;

    // Confirm item use with Z
    if (keyboard_check_pressed(ord("Z"))) {

        var entry = global.inventory[global.selected_item];

        if (entry != undefined && is_array(entry) && array_length(entry) >= 2 && entry[1] > 0) {

            var target = (global.item_use_target == 0 ? "Haru" : "Maya");

            inv_use_item(global.selected_item, global.item_use_target);

            global.feedback_message = "Used " + entry[0].name + " on " + target + "!";
            global.feedback_timer = 60;
        }

        // Exit target mode regardless
        global.item_use_mode = false;
    }

    // Cancel target selection with X
    if (keyboard_check_pressed(ord("X"))) {
        global.item_use_mode = false;
    }
}


// ================================
// FEEDBACK TIMER
// ================================
if (global.feedback_timer > 0) {
    global.feedback_timer -= 1;
}

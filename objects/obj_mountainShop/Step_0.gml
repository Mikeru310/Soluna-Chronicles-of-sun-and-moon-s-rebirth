// --- COOLDOWN HANDLING ---
if (interaction_cooldown > 0) {
    interaction_cooldown -= 1;
}

// --- NAVIGATION ---
if (interaction_cooldown <= 0) {
    if (keyboard_check_pressed(vk_down)) {
        shop_cursor = (shop_cursor + 1) mod array_length(global.shop_inventory);
    }
    if (keyboard_check_pressed(vk_up)) {
        shop_cursor -= 1;
        if (shop_cursor < 0) {
            shop_cursor = array_length(global.shop_inventory) - 1;
        }
    }

    
    // --- PURCHASE ---
if (keyboard_check_pressed(ord("Z"))) {
    var item = global.shop_inventory[shop_cursor];
    if (global.gold >= item.price) {
        global.gold -= item.price;
        AddItemToInventory(item, 1);
        //show_message("You bought a " + item.name + "!");

        // pick random shop line
        shop_message = shop_lines[irandom(array_length(shop_lines) - 1)];
    } else {
        shop_message = shop_insufficient[irandom(array_length(shop_insufficient) - 1)];
    }
}


    // --- EXIT ---
    if (keyboard_check_pressed(ord("X"))) {
        create_textbox("mountain exit");
        interaction_cooldown = room_speed; // 1 sec cooldown
        instance_destroy();
    }
}

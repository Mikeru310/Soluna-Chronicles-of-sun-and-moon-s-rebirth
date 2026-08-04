// Chest configuration
chest_item   = noone; // example
chest_amount = 1;
chest_id     = ""; // 🔹 unique name per chest (change per chest)
text_id      = "";     // optional text ID
opened       = false;

// 🔹 Make sure the global chest list exists
if (!variable_global_exists("chests_opened")) {
    global.chests_opened = [];
}

// 🔹 Check if this chest has already been opened
if (array_contains(global.chests_opened, chest_id)) {
    opened = true;
    sprite_index = spr_chest_opened; // chest remains open visually
}

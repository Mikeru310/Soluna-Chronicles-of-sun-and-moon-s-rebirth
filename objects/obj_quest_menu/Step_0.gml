// Close menu
if (keyboard_check_pressed(ord("C")) || keyboard_check_pressed(ord("X"))) {
    instance_destroy();
}

// Navigation
if (keyboard_check_pressed(vk_up)) {
    menu_index = max(0, menu_index - 1);
    if (menu_index < scroll_offset) scroll_offset = menu_index;
}

if (keyboard_check_pressed(vk_down)) {
    menu_index = min(array_length(global.quest_data) - 1, menu_index + 1);
    if (menu_index >= scroll_offset + visible_quests) {
        scroll_offset = menu_index - visible_quests + 1;
    }
}

// Toggle description
if (keyboard_check_pressed(ord("Z"))) {
    show_details = !show_details;
}

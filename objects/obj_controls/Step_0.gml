// --- Center setup for button position ---
var x_center = display_get_width() / 2;
var y_center = display_get_height() / 2;

var button_x = x_center - button_width / 2;
var button_y = y_center + 180;

// --- Mouse hover detection ---
mouse_hover_button = point_in_rectangle(
    mouse_x, mouse_y,
    button_x, button_y,
    button_x + button_width, button_y + button_height
);

// Set menu_selected if hovering
if (mouse_hover_button) {
    menu_selected = 0;
}

// --- Keyboard navigation ---
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)) {
    menu_selected = 0; // only one option
}

// --- Action: Keyboard Z or Mouse Click ---
if (keyboard_check_pressed(ord("Z")) || (mouse_check_button_pressed(mb_left) && mouse_hover_button)) {
    room_goto(rm_options);
}

// --- Optional: X key to go back ---
if (keyboard_check_pressed(ord("X"))) {
    room_goto(rm_options);
}
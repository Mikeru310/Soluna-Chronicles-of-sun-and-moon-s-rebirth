depth = 0; // or any higher value
selected_character = 0;
selected_rune = 0;
confirming = false;
upgrade_input_handled = false;

successful_message = "";
success_timer = 0;

tutorial_active = false;

display_set_gui_size(320, 180);

// Check if this is the first time opening runes
if (!variable_global_exists("rune_tutorial_shown")) {
    global.rune_tutorial_shown = false;
}

if (!global.rune_tutorial_shown) {
    global.rune_tutorial_shown = true;
    tutorial_active = true;
         
    create_textbox("rune_tutorial");
}
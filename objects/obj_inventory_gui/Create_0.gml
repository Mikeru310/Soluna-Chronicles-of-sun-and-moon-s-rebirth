global.selected_item = 0;
global.scroll_offset = 0;
global.max_items_visible = 6; // Number of visible items
//global.feedback_timer = 0;
//global.feedback_message = "";

if (!variable_global_exists("feedback_timer")) global.feedback_timer = 0;
if (!variable_global_exists("feedback_message")) global.feedback_message = "";


//pick a player code
global.item_use_mode = false; // Are we choosing a target?
global.item_use_target = 0;   // 0 = Sol, 1 = Luna
    



display_set_gui_size(320, 180);

popup_text = "";
popup_alpha = 1;
popup_timer = room_speed * 4;

if (font_exists(m3x6)) popup_font = m3x6;
    
/// obj_quest_popup — Create Event

// Initialize popup globals safely
if (!variable_global_exists("quest_popup_text")) global.quest_popup_text = "";
if (!variable_global_exists("quest_popup_text_next")) global.quest_popup_text_next = "";
if (!variable_global_exists("quest_popup_timer")) global.quest_popup_timer = 0;
if (!variable_global_exists("quest_popup_alpha")) global.quest_popup_alpha = 1;

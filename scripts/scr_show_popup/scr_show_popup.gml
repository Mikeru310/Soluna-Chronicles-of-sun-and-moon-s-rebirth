function scr_show_popup(_text) {

    // Ensure popup object exists
    if (!instance_exists(obj_quest_popup)) {
        instance_create_layer(0, 0, "Instances", obj_quest_popup);
    }

    // If a popup is already active, queue the next one
    if (global.quest_popup_timer > 0) {
        global.quest_popup_text_next = _text;
        return;
    }

    // Otherwise show normally
    global.quest_popup_text = _text;
    global.quest_popup_timer = room_speed * 3;
    global.quest_popup_alpha = 1;
}

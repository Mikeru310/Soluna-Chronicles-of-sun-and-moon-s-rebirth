// === Quest Popup ===
if (variable_global_exists("quest_popup_timer")) {
    if (global.quest_popup_timer > 0 && string_length(global.quest_popup_text) > 0) {
        
        // Decrease timer each step
        global.quest_popup_timer--;

        // Fade-out near end
        if (global.quest_popup_timer < room_speed) {
            global.quest_popup_alpha = global.quest_popup_timer / room_speed;
        }

        // --- Popup Box Settings ---
        var pad = 6;
        var max_width = 180;
        var px1 = 10;
        var py1 = 10;

        var popup_font = font_exists(m3x6) ? m3x6 : -1;
        if (popup_font != -1) draw_set_font(popup_font);

        var wrapped_text = string_wrap(global.quest_popup_text, max_width, popup_font);

        var lines = string_count("\n", wrapped_text) + 1;
        var line_height = string_height("A");
        var box_height = (lines * line_height) + pad * 2;
        var box_width = min(max_width + pad * 2, 300);

        // --- Draw Box ---

        draw_set_alpha(global.quest_popup_alpha);
        draw_set_color(c_black);
        draw_rectangle(px1, py1, px1 + box_width, py1 + box_height, false);

        draw_set_color(c_white);
        draw_rectangle(px1, py1, px1 + box_width, py1 + box_height, true);

        // --- Draw Text ---
        draw_set_color(c_white);
        draw_text(px1 + pad, py1 + pad, wrapped_text);

        draw_set_alpha(1);
    }
}

// ===================================================
// 🚀 ADD THIS NEW CODE RIGHT HERE — AFTER DRAW LOGIC
// ===================================================
if (global.quest_popup_timer <= 0 && global.quest_popup_text_next != "") {

    global.quest_popup_text = global.quest_popup_text_next;
    global.quest_popup_text_next = "";

    global.quest_popup_timer = room_speed * 3;
    global.quest_popup_alpha = 1;
}

draw_set_font(m5x7);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// ---------------------------
// GAME OVER fade-in text
// ---------------------------
draw_set_alpha(fade_alpha);
draw_set_color(c_white);
draw_text(room_width / 2, 40, "GAME OVER");
draw_set_alpha(1); // reset
// ---------------------------
    
// Do NOT draw dialogue until fade is done
if (!fade_done) exit;


// Dialogue box
draw_set_color(dialogue_color);
draw_text(room_width / 2, 80, dialogue_visible);

// If dialogue not finished → DO NOT DRAW OPTIONS
if (!dialogue_done) exit;


// ---------------------------
// OPTIONS
// ---------------------------
for (var i = 0; i < array_length(options); i++) {
    var text_y = 130 + (i * 20);

    draw_set_color(c_white);
    draw_text(room_width / 2, text_y, options[i]);

    if (i == selection) {
        draw_sprite(spr_pointer, 0, room_width / 2 - 50, text_y + pointer_y_offset);
    }
}

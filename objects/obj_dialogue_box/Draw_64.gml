// === DRAW SETTINGS ===
draw_set_font(m3x6);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// === BOX POSITION & SIZE ===
var box_margin = 10;
var box_padding = 8;
var box_left   = box_margin;
var box_right  = display_get_gui_width() - box_margin;
var box_bottom = display_get_gui_height() - box_margin;
var box_top    = box_bottom - 60;

// === BOX BACKGROUND ===
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(box_left, box_top, box_right, box_bottom, false); // Outline
draw_set_color(make_color_rgb(30, 30, 30)); // Dark grey fill
draw_rectangle(box_left, box_top, box_right, box_bottom, true);  // Fill
draw_set_alpha(1);

// === TEXT COLOR ===
draw_set_color(c_white);

// === DIALOGUE TEXT ===
var text_x = box_left + box_padding;
var text_y = box_top + box_padding;
draw_text(text_x, text_y, string_copy(text, 1, text_index));

// === CHOICE OPTIONS ===
if (show_choices) {
    var choice_y = box_top + 34;
    draw_text(text_x, choice_y,  (choice == 0 ? "> Yes" : "  Yes"));
    draw_text(text_x + 80, choice_y, (choice == 1 ? "> No"  : "  No"));
}

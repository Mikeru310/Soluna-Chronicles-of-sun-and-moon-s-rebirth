draw_self();

// --- Center setup ---
var x_center = display_get_width() / 2;
var y_center = display_get_height() / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_options);

// --- Title (NO yellow background) ---
var title_y = y_center - 180;
draw_set_color(c_black);
draw_text(x_center, title_y, "Controls:");

// --- Controls text ---
var start_y = y_center - 120;
var spacing = 40;

draw_text(x_center, start_y, "Arrow Keys : Move");
draw_text(x_center, start_y + spacing, "Z : Action / Confirm");
draw_text(x_center, start_y + spacing * 2, "X : Back / Cancel");

// --- Back Button (yellow background ONLY on hover) ---
var button_y = y_center + 180;
var back_text = "Back";
var back_width = string_width(back_text);
var back_height = string_height(back_text);

// Draw semi-transparent yellow background ONLY when hovering
if (mouse_hover_button || menu_selected == 0) {
    draw_set_color(c_yellow);
    draw_set_alpha(0.2);
    draw_rectangle(x_center - back_width / 2 - 10, 
                  button_y - back_height / 2 - 5,
                  x_center + back_width / 2 + 10,
                  button_y + back_height / 2 + 5, false);
    draw_set_alpha(1);
}

// Draw back text (yellow when hovering, black otherwise)
if (mouse_hover_button || menu_selected == 0) {
    draw_set_color(c_yellow);
} else {
    draw_set_color(c_black);
}

draw_text(x_center, button_y, back_text);

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
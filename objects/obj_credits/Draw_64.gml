/// Draw GUI Event - obj_credits

// --- SCALE GUI TO FULL WINDOW SIZE ---
display_set_gui_size(display_get_width(), display_get_height());

// center based on window size, not room size
var xx = display_get_width() * 0.5;
var yy = display_get_height() * 0.5;

// get current text
var current_text = ds_list_find_value(credit_list, credit_index);

// draw
draw_set_alpha(alpha);
draw_set_font(Nope);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(xx, yy, current_text);

draw_set_alpha(1);

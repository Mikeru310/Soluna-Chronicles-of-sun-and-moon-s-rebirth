// Draw the intro sprite with current alpha
draw_set_alpha(alpha);
draw_self();
draw_set_alpha(1); // reset alpha for safety

// Draw centered text
var text_str = "SOL LUNA GROUP THESIS PRESENT";
var text_size = 32; // adjust as needed

draw_set_font(fnt_introSol); // or your custom font (e.g., fnt_intro)
draw_set_color(c_white);

// Measure text to center it
var text_w = string_width(text_str);
var text_h = string_height(text_str);

// Calculate center position (using GUI layer so it's resolution independent)
var cx = display_get_gui_width() / 2 - text_w / 2;
var cy = display_get_gui_height() / 2 - text_h / 2;

// Optional: Fade text in with sprite’s alpha
draw_set_alpha(alpha);
draw_text(cx, cy, text_str);
draw_set_alpha(1);

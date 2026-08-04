/// obj_guide_ui - Draw GUI Event
if (!visible) exit;

// choose font and color
draw_set_font(m3x6);
draw_set_color(c_white);

var text_w = string_width(guide_text);
var text_h = string_height(guide_text);
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();



// position
switch (pos_mode) {
    case "left":
        x = margin_x;
        y = screen_h - text_h - margin_y;
        break;

    case "center":
        x = (screen_w - text_w) / 2;
        y = screen_h - text_h - margin_y;
        break;
}

// optional semi-transparent background
draw_set_alpha(0.4);
draw_rectangle(x - 4, y - 2, x + text_w + 4, y + text_h + 2, false);
draw_set_alpha(1);

// draw text
draw_text(x, y, guide_text);

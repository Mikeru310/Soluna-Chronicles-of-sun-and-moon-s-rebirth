// DRAW GUI event

// Set fixed GUI positions
var gui_x = 10;
var gui_y = 40;

draw_sprite_stretched(spr_UI, 0, gui_x - margin, gui_y - margin, widthFull, heightFull);

draw_set_colour(c_white);
draw_set_font(m3x6);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _desc = !(desc == -1);

for (var l = 0; l < (option_count + _desc); l++) {
    draw_set_colour(c_white);

    if (l == 0 && _desc) {
        draw_text(gui_x, gui_y, desc);
    } else {
        var _str = option[l - _desc][0];

        if (hover == l - _desc) {
            draw_set_colour(c_yellow);
            _str = hovermarker + _str;
        }

        draw_text(gui_x, gui_y + l * heightLine, _str);
    }
}

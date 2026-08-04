// Set font and alignment
draw_set_font(fnt_introSOL);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var title_text = "Sol Luna:Chronicles of Rebirth Sun and Moon";
var cx = room_width / 2;
var cy = room_height / 2;

// Glow effect - draw blurred white around the text
for (var i = -2; i <= 2; i++) {
    for (var j = -2; j <= 2; j++) {
        draw_set_color(c_white);
        draw_set_alpha(0.1); // Lower alpha for glow
        draw_text(cx + i, cy + j, title_text);
    }
}

// Main text on top
draw_set_color(c_white);
draw_set_alpha(1);
draw_text(cx, cy, title_text);

// Draw fade to black for transition (if you're using it)
draw_set_alpha(fade_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

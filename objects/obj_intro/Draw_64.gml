draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(MenuFont); 
draw_set_color(c_white);

if (current_line < array_length(text_lines)) {
    draw_text(room_width/2, room_height/2, text_lines[current_line]);
}

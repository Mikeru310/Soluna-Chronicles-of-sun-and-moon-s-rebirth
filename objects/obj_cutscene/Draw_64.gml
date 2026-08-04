// existing cutscene draw code (if any)

// fade overlay
if (_fadeAlpha > 0) {
    draw_set_alpha(_fadeAlpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1);
}

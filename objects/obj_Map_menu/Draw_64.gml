// Dim background
draw_set_alpha(0.4);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

// --- Panel Borders ---
draw_set_color(c_black);
draw_rectangle(panel_x - 4, panel_y - 4, panel_x + panel_w + 4, panel_y + panel_h + 4, false);

draw_set_color(c_white);
draw_rectangle(panel_x - 2, panel_y - 2, panel_x + panel_w + 2, panel_y + panel_h + 2, false);

// --- Panel background ---
draw_set_color(c_black);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);

// --- Draw map OR black cover ---
if (map_sprite != -1 && !use_black_cover)
{
    draw_sprite_stretched(map_sprite, 0, panel_x, panel_y, panel_w, panel_h);
}
else
{
    // Optional text
    draw_set_color(c_white);
    draw_text(panel_x + panel_w / 2 - 45, panel_y + panel_h / 2, "No MAP");
}

// --- Player dot ---
if (sprite_exists(spr_red_dot_indicator))
{
    var dot_scale = 0.4;
    draw_sprite_ext(
        spr_red_dot_indicator,
        0,
        dot_x,
        dot_y,
        dot_scale,
        dot_scale,
        0,
        c_red,
        1
    );
}


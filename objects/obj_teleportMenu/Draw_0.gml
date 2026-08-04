draw_set_alpha(fade_alpha);

// ----- MENU BACKGROUND -----
draw_set_color(c_white);
draw_roundrect(menu_x, menu_y, menu_x + menu_w, menu_y + menu_h, false);

// Border
draw_set_color(c_black);
draw_roundrect(menu_x, menu_y, menu_x + menu_w, menu_y + menu_h, true);


// ----- MENU OPTIONS -----
for (var i = 0; i < array_length(villages); i++)
{
    var text_x = menu_x + text_margin_x;
    var text_y = menu_y + text_margin_y + (i * line_spacing);

    if (i == selected_index)
    {
        draw_set_color(c_yellow);
        draw_rectangle(
            menu_x + 8,
            text_y - 2,
            menu_x + menu_w - 8,
            text_y + line_spacing - 2,
            false
        );
    }

    draw_set_color(c_black);
    draw_text(text_x, text_y, villages[i]);
}

draw_set_alpha(1);

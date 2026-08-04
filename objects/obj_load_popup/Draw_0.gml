draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_rectangle(display_get_gui_width()/2 - 80, display_get_gui_height()/2 - 40,
               display_get_gui_width()/2 + 80, display_get_gui_height()/2 + 40, false);

draw_set_color(c_white);
draw_set_font(m3x6);
draw_text(display_get_gui_width()/2, display_get_gui_height()/2 - 20, "Load last save?");
draw_text(display_get_gui_width()/2 - 40, display_get_gui_height()/2 + 10, (choice == 0 ? "> Yes" : "  Yes"));
draw_text(display_get_gui_width()/2 + 40, display_get_gui_height()/2 + 10, (choice == 1 ? "> No" : "  No"));

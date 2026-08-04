if (global.confirm_overwrite)
{
    // Calculate centered positions
    // Get the ACTUAL GUI dimensions (not display size)
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    
    // Scale popup to fit smaller GUI
    var popup_w = min(280, gui_w * 0.85);
    var popup_h = min(140, gui_h * 0.75);
    var popup_x = (gui_w - popup_w) / 2;
    var popup_y = (gui_h - popup_h) / 2;
    
    // Semi-transparent overlay
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1);
    
    // Popup background
    draw_set_color(c_dkgray);
    draw_rectangle(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, false);
    
    // Popup border
    draw_set_color(c_white);
    draw_rectangle(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, true);
    draw_rectangle(popup_x + 2, popup_y + 2, popup_x + popup_w - 2, popup_y + popup_h - 2, true);
    
    // Text
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_font(-1); // Reset to default font
    var line_height = string_height("M"); // Get actual text height
    var text_y1 = popup_y + popup_h * 0.2;
    var text_y2 = text_y1 + line_height + 5;
    draw_text(popup_x + popup_w/2, text_y1, "Overwrite existing save file?");
    draw_text(popup_x + popup_w/2, text_y2, "This cannot be undone.");
    
    // Button dimensions - scale to GUI size
    var btn_w = min(80, popup_w * 0.28);
    var btn_h = min(30, popup_h * 0.25);
    var btn_spacing = min(20, popup_w * 0.08);
    var btn_y = popup_y + popup_h - btn_h - 10;
    
    // YES button (left side)
    var yes_x = popup_x + (popup_w/2) - btn_w - (btn_spacing/2);
    draw_set_color(c_lime);
    draw_rectangle(yes_x, btn_y, yes_x + btn_w, btn_y + btn_h, false);
    draw_set_color(c_black);
    draw_set_valign(fa_middle);
    draw_text(yes_x + btn_w/2, btn_y + btn_h/2, "YES");
    
    // NO button (right side)
    var no_x = popup_x + (popup_w/2) + (btn_spacing/2);
    draw_set_color(c_red);
    draw_rectangle(no_x, btn_y, no_x + btn_w, btn_y + btn_h, false);
    draw_set_color(c_white);
    draw_text(no_x + btn_w/2, btn_y + btn_h/2, "NO");
    
    // Reset alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
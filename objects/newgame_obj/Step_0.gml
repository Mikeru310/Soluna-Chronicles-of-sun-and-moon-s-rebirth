if (global.confirm_overwrite && mouse_check_button_pressed(mb_left))
{
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    // Recalculate button positions (must match draw code)
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    var popup_w = min(280, gui_w * 0.85);
    var popup_h = min(140, gui_h * 0.75);
    var popup_x = (gui_w - popup_w) / 2;
    var popup_y = (gui_h - popup_h) / 2;
    
    var btn_w = min(80, popup_w * 0.28);
    var btn_h = min(30, popup_h * 0.25);
    var btn_spacing = min(20, popup_w * 0.08);
    var btn_y = popup_y + popup_h - btn_h - 10;
    
    var yes_x = popup_x + (popup_w/2) - btn_w - (btn_spacing/2);
    var no_x = popup_x + (popup_w/2) + (btn_spacing/2);
    
    // YES button click
    if (mx > yes_x && mx < yes_x + btn_w && my > btn_y && my < btn_y + btn_h)
    {
        global.confirm_overwrite = false;
        if (is_callable(global.confirm_callback))
        {
            global.confirm_callback();
        }
    }
    // NO button click
    else if (mx > no_x && mx < no_x + btn_w && my > btn_y && my < btn_y + btn_h)
    {
        global.confirm_overwrite = false;
    }
}
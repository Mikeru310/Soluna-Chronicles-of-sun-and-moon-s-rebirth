draw_self();
draw_set_font(fnt_options);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

var base_x = x + 150;
var base_y = y + 380;
var line_spacing = 90;

for (var i = 0; i < array_length(menu_items); i++) {
    var current_y = base_y + (i * line_spacing);
    
    // Determine text color (keyboard selection OR mouse hover)
    var text_color = (i == menu_selected || i == mouse_hover_item) ? c_yellow : c_black;
    draw_set_color(text_color);
    
    switch (i) {
        case 0: // MUSIC VOLUME
            draw_text(base_x, current_y, "MUSIC VOLUME");
            music_slider_x = base_x + 280;
            music_slider_y = current_y - slider_height / 2;
            DrawVolumeSlider(music_slider_x, current_y, music_volume, dragging_music);
            break;
            
        case 1: // SOUND VOLUME
            draw_text(base_x, current_y, "SOUND VOLUME");
            sound_slider_x = base_x + 280;
            sound_slider_y = current_y - slider_height / 2;
            DrawVolumeSlider(sound_slider_x, current_y, sound_volume, dragging_sound);
            break;
            
        case 2: // CONTROLS
            draw_set_halign(fa_center);
            
            // Hover effect
            if (i == mouse_hover_item || i == menu_selected) {
                draw_set_color(c_yellow);
                // Optional: draw a subtle background
                var text_width = string_width("CONTROLS");
                var text_height = string_height("CONTROLS");
                draw_set_alpha(0.2);
                draw_rectangle(x + sprite_width / 2 - text_width / 2 - 10, 
                              current_y - text_height / 2 - 5,
                              x + sprite_width / 2 + text_width / 2 + 10,
                              current_y + text_height / 2 + 5, false);
                draw_set_alpha(1);
            }
            
            draw_text(x + sprite_width / 2, current_y, "CONTROLS");
            draw_set_halign(fa_left);
            break;
            
        case 3: // BACK TO MAIN MENU
            draw_set_halign(fa_center);
            
            // Hover effect
            if (i == mouse_hover_item || i == menu_selected) {
                draw_set_color(c_yellow);
                var text_width = string_width("BACK TO MAIN MENU");
                var text_height = string_height("BACK TO MAIN MENU");
                draw_set_alpha(0.2);
                draw_rectangle(x + sprite_width / 2 - text_width / 2 - 10, 
                              current_y - text_height / 2 - 5,
                              x + sprite_width / 2 + text_width / 2 + 10,
                              current_y + text_height / 2 + 5, false);
                draw_set_alpha(1);
            }
            
            draw_text(x + sprite_width / 2, current_y, "BACK TO MAIN MENU");
            draw_set_halign(fa_left);
            break;
    }
}

// --- HELPER FUNCTION: Draw Volume Slider ---
function DrawVolumeSlider(_x, _y, _volume, _is_dragging) {
    var _slider_x = _x;
    var _slider_y = _y - slider_height / 2;
    
    // Check if mouse is hovering over this slider
    var mouse_over = point_in_rectangle(mouse_x, mouse_y, _slider_x, _slider_y, _slider_x + slider_width, _slider_y + slider_height);
    
    // Draw background bar (darker tan to match parchment)
    draw_set_color(make_color_rgb(139, 90, 43));
    draw_rectangle(_slider_x, _slider_y, _slider_x + slider_width, _slider_y + slider_height, false);
    
    // Draw filled portion based on volume (blue)
    var _fill_width = (slider_width * _volume) / 100;
    
    // Brighter blue when hovering or dragging
    if (mouse_over || _is_dragging) {
        draw_set_color(make_color_rgb(100, 149, 237));  // Cornflower blue (lighter)
    } else {
        draw_set_color(make_color_rgb(65, 105, 225));   // Royal blue
    }
    draw_rectangle(_slider_x, _slider_y, _slider_x + _fill_width, _slider_y + slider_height, false);
    
    // Draw outline (darker border)
    draw_set_color(make_color_rgb(101, 67, 33));
    draw_rectangle(_slider_x, _slider_y, _slider_x + slider_width, _slider_y + slider_height, true);
    draw_rectangle(_slider_x - 1, _slider_y - 1, _slider_x + slider_width + 1, _slider_y + slider_height + 1, true);
    
    // Draw percentage text
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(_slider_x + slider_width / 2, _slider_y + slider_height / 2, string(floor(_volume)) + "%");
    draw_set_halign(fa_left);
    
    // Draw cursor indicator when hovering
    if (mouse_over) {
        draw_set_color(c_white);
        draw_set_alpha(0.5);
        draw_circle(_slider_x + _fill_width, _slider_y + slider_height / 2, 6, false);
        draw_set_alpha(1);
    }
}
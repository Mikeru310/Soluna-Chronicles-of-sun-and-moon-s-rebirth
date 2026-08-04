//---------------------------------------
// MOUSE HOVER DETECTION
//---------------------------------------
mouse_hover_item = -1;

var base_x = x + 150;
var base_y = y + 380;
var line_spacing = 90;

for (var i = 0; i < array_length(menu_items); i++) {
    var current_y = base_y + (i * line_spacing);
    
    // Check if mouse is hovering over buttons (CONTROLS and BACK TO MAIN MENU)
    if (i == 2 || i == 3) {
        var text_width = string_width(menu_items[i]);
        var text_height = string_height(menu_items[i]);
        var button_x = x + sprite_width / 2 - text_width / 2;
        var button_y = current_y - text_height / 2;
        
        if (point_in_rectangle(mouse_x, mouse_y, button_x, button_y, button_x + text_width, button_y + text_height)) {
            mouse_hover_item = i;
            menu_selected = i;
        }
    }
}

//---------------------------------------
// MOUSE SLIDER DRAGGING
//---------------------------------------
// Music slider dragging
if (mouse_check_button(mb_left)) {
    var mx = mouse_x;
    var my = mouse_y;
    
    // Check music slider
    if (point_in_rectangle(mx, my, music_slider_x, music_slider_y, music_slider_x + slider_width, music_slider_y + slider_height)) {
        dragging_music = true;
    }
    
    // Check sound slider
    if (point_in_rectangle(mx, my, sound_slider_x, sound_slider_y, sound_slider_x + slider_width, sound_slider_y + slider_height)) {
        dragging_sound = true;
    }
    
    // Update music volume while dragging
    if (dragging_music) {
        var relative_x = clamp(mx - music_slider_x, 0, slider_width);
        music_volume = (relative_x / slider_width) * 100;
    }
    
    // Update sound volume while dragging
    if (dragging_sound) {
        var relative_x = clamp(mx - sound_slider_x, 0, slider_width);
        sound_volume = (relative_x / slider_width) * 100;
    }
} else {
    dragging_music = false;
    dragging_sound = false;
}

//---------------------------------------
// KEYBOARD MENU NAVIGATION
//---------------------------------------
if (keyboard_check_pressed(vk_up)) {
    menu_selected = (menu_selected - 1 + array_length(menu_items)) mod array_length(menu_items);
}
if (keyboard_check_pressed(vk_down)) {
    menu_selected = (menu_selected + 1) mod array_length(menu_items);
}

//---------------------------------------
// LONG PRESS INPUT FOR SLIDERS
//---------------------------------------
var left_hold  = keyboard_check(vk_left);
var right_hold = keyboard_check(vk_right);
var left_press  = keyboard_check_pressed(vk_left);
var right_press = keyboard_check_pressed(vk_right);

// Reset timer if no key held
if (!left_hold && !right_hold) {
    global.input_timer = 0;
}

// Increase timer during hold
if (left_hold || right_hold) {
    global.input_timer++;
}

var repeat_delay = 12;
var repeat_speed = 2;

//---------------------------------------
// MUSIC VOLUME SLIDER (KEYBOARD)
//---------------------------------------
if (menu_selected == 0)
{
    if (left_press || (left_hold && global.input_timer > repeat_delay && global.input_timer mod repeat_speed == 0))
    {
        music_volume = max(0, music_volume - 1);
    }
    if (right_press || (right_hold && global.input_timer > repeat_delay && global.input_timer mod repeat_speed == 0))
    {
        music_volume = min(100, music_volume + 1);
    }
}

//---------------------------------------
// SOUND VOLUME SLIDER (KEYBOARD)
//---------------------------------------
if (menu_selected == 1)
{
    if (left_press || (left_hold && global.input_timer > repeat_delay && global.input_timer mod repeat_speed == 0))
    {
        sound_volume = max(0, sound_volume - 1);
    }
    if (right_press || (right_hold && global.input_timer > repeat_delay && global.input_timer mod repeat_speed == 0))
    {
        sound_volume = min(100, sound_volume + 1);
    }
}

//---------------------------------------
// APPLY MUSIC VOLUME TO AUDIO
//---------------------------------------
global.music_volume = music_volume / 100;
if (audio_is_playing(global.music_id)) {
    audio_sound_gain(global.music_id, global.music_volume, 0);
}

// Hard mute
if (global.music_volume <= 0.01) {
    audio_sound_gain(global.music_id, 0, 0);
}

//---------------------------------------
// APPLY SOUND VOLUME TO GLOBAL
//---------------------------------------
global.sound_volume = sound_volume / 100;

//---------------------------------------
// ACTION KEY (Z) OR MOUSE CLICK
//---------------------------------------
if (keyboard_check_pressed(ord("Z")) || (mouse_check_button_pressed(mb_left) && mouse_hover_item >= 2))
{
    var choice = string_upper(menu_items[menu_selected]);
    if (choice == "CONTROLS") {
        room_goto(rm_controls_info);
    }
    if (choice == "BACK TO MAIN MENU") {
        var layername = layer_exists("Effects") ? "Effects" : "Instances";
        var t = instance_create_layer(0, 0, layername, obj_transitions);
        t.transition_state = 1;
        t.target_room = rm_mainmenu1;
    }
}
// Camera size
cam_w = 320;
cam_h = 180;

// Menu size (fits safely inside 320x180)
menu_w = 200;
menu_h = 110;

// Center menu on screen
menu_x = (cam_w - menu_w) div 2;
menu_y = (cam_h - menu_h) div 2;

// Menu text
text_margin_x = 16;
text_margin_y = 20;
line_spacing = 18;

// Menu data
villages = [
    "Village 1",
    "Village 2",
    "Village 3",
    "Village 4"
];

// Menu control
selected_index = 0;
menu_active = true;
input_delay = 8;
input_timer = 0;



//fade control
fade_alpha = 0;
fade_speed = 0.08;
fading_in = true;
fading_out = false;

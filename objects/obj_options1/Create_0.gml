// --- Menu Items ---
menu_items = [
    "MUSIC VOLUME",
    "SOUND VOLUME",
    "CONTROLS",
    "BACK TO MAIN MENU"
];
menu_selected = 0;

// --- Load saved global volumes into slider positions ---
if (!variable_global_exists("music_volume")) global.music_volume = 0.8;
if (!variable_global_exists("sound_volume")) global.sound_volume = 0.8;

music_volume = global.music_volume * 100;
sound_volume = global.sound_volume * 100;

// --- Long Hold Timer ---
global.input_timer = 0;

// --- Ensure music_id exists ---
if (!variable_global_exists("music_id")) global.music_id = -1;

// --- Slider visual settings ---
slider_width = 200;
slider_height = 24;

// --- Mouse interaction ---
dragging_music = false;
dragging_sound = false;
mouse_hover_item = -1;

// --- Slider positions (will be set in draw) ---
music_slider_x = 0;
music_slider_y = 0;
sound_slider_x = 0;
sound_slider_y = 0;
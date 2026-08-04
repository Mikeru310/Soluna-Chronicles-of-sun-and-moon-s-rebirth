// Set font and alignment
draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Calculate pulsing brightness using sine wave
var brightness = 128 + sin(shine_timer) * 127; // Range: 1 to 255

// Title position
var cx = display_get_width() / 2;
var cy = display_get_height() / 2;

// Draw glowing SOL LUNA text
draw_set_color(make_color_rgb(brightness, brightness, brightness));
draw_text(cx, cy - 20, "SOL LUNA:Chronicles of Sun and Moon Rebirth");




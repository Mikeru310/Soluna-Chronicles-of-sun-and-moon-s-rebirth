/// === Minimap Draw GUI ===
if (toggle_cd > 0) toggle_cd--;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (keyboard_check_pressed(vk_tab) && toggle_cd <= 0) {
    if (point_in_rectangle(mx, my, map_x, map_y, map_x + map_w, map_y + map_h)) {
        is_large = !is_large;
        toggle_cd = room_speed / 5;
    }
}

// Smooth size transition
var target_w = map_w_orig * (is_large ? map_scale_large : map_scale_small);
var target_h = map_h_orig * (is_large ? map_scale_large : map_scale_small);
map_w = lerp(map_w, target_w, 0.3);
map_h = lerp(map_h, target_h, 0.3);

// top-right anchor
map_x = display_get_gui_width() - map_w - margin;
map_y = margin;

// === Surface ===
if (!surface_exists(surf_map)) {
    surf_map = surface_create(map_w, map_h);
} else if (surface_get_width(surf_map) != map_w || surface_get_height(surf_map) != map_h) {
    surface_free(surf_map);
    surf_map = surface_create(map_w, map_h);
}

// draw to surface
surface_set_target(surf_map);
draw_clear_alpha(c_black, 0);
if (sprite_exists(spr_FOREST_ACT_1_1)) {
    draw_sprite_stretched(spr_FOREST_ACT_1_1, 0, 0, 0, map_w, map_h);
}
surface_reset_target();

// === Border ===
draw_set_color(border_outer);
draw_rectangle(map_x - 2, map_y - 2, map_x + map_w + 2, map_y + map_h + 2, false);
draw_set_color(border_inner);
draw_rectangle(map_x - 1, map_y - 1, map_x + map_w + 1, map_y + map_h + 1, false);

// === Draw Minimap Surface ===
draw_surface(surf_map, map_x, map_y);

// === Player Marker ===
if (instance_exists(player)) {
    var px = map_x + (player.x / room_width) * map_w;
    var py = map_y + (player.y / room_height) * map_h;
    draw_set_color(c_red);
    draw_circle(px, py, 2, false);
}

draw_set_color(c_white);

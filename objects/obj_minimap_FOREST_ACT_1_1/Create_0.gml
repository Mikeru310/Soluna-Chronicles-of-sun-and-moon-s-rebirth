/// === Minimap Create ===
map_scale_small = 0.25; // normal small size
map_scale_large = 0.7;  // when toggled large

// rectangular shape
map_w_orig = 350; 
map_h_orig = 200;

map_w = map_w_orig * map_scale_small;
map_h = map_h_orig * map_scale_small;

margin = 20;
map_x = display_get_gui_width() - map_w - margin;
map_y = margin;

is_large = false;
toggle_cd = 0;

surf_map = -1;
player = obj_player;
minimap_sprite = spr_FOREST_ACT_1_1; // your sprite here

border_outer = c_black;
border_inner = c_white;

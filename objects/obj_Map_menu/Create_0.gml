game_paused = true;

// ----------------------------
// SAFETY DEFAULTS
// ----------------------------
player = noone;
map_sprite = -1;        // invalid sprite by default
use_black_cover = false;

// ----------------------------
// Determine map sprite
// ----------------------------
switch (room)
{
    // FOREST ACT 1
    case rm_FOREST_ACT_1_1: map_sprite = spr_FOREST_ACT_1_1; break;
    case rm_FOREST_ACT_1_2_UPDATED: map_sprite = spr_FOREST_ACT_1_2; break;
    case rm_FOREST_ACT_1_3_UPDATED: map_sprite = spr_FOREST_ACT_1_3; break;

    // PLAINS ACT 2
    case rm_Plain_Area_1_UPDATED: map_sprite = spr_Plain_AREA1_2UPDATED; break;
    case rm_Plain_Area_2_UPDATED: map_sprite = spr_Plain_Area_2_1UPDATED; break;
    case rm_Plain_Area_3_UPDATED: map_sprite = spr_Plain_Area_3_1UPDATED; break;

    // SWAMP ACT 3
    case rm_Swamp_Area_1_UPDATED: map_sprite = spr_Swamp_Area_1_UPDATED; break;
    case rm_Swamp_Area_2_UPDATED: map_sprite = spr_Swamp_Area_2_UPDATED; break;
    case rm_Swamp_Area_3_UPDATED: map_sprite = spr_Swamp_Area_3_UPDATED; break;

    // MOUNTAIN ACT 4
    case rm_Mountain_Area_1_UPDATED: map_sprite = spr_Mountain_Area_1_UPDATED; break;
    case rm_Mountain_Area_2_UPDATED: map_sprite = spr_Mountain_Area_2_UPDATED; break;
    case rm_Mountain_Area_3_UPDATED: map_sprite = spr_Mountain_Area_3_UPDATED; break;

    default:
        use_black_cover = true;
}

// If sprite does not exist → fallback
if (!sprite_exists(map_sprite))
{
    map_sprite = -1;
    use_black_cover = true;
}

// ----------------------------
// Player reference (SAFE)
// ----------------------------
if (instance_exists(obj_player))
{
    player = instance_find(obj_player, 0);
}

// ----------------------------
// Camera (kept for future use)
// ----------------------------
var cam = view_camera[0];
cam_x = camera_get_view_x(cam);
cam_y = camera_get_view_y(cam);
cam_w = camera_get_view_width(cam);
cam_h = camera_get_view_height(cam);

// ----------------------------
// Map panel
// ----------------------------
panel_w = display_get_gui_width() * 0.75;
panel_h = display_get_gui_height() * 0.75;
panel_x = (display_get_gui_width() - panel_w) / 2;
panel_y = (display_get_gui_height() - panel_h) / 2;

// ----------------------------
// Initialize dot
// -----

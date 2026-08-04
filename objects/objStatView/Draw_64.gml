/// @desc Draw GUI for Stat View

// Close when pressing X
if (keyboard_check_pressed(ord("X"))) {
    instance_destroy();
    exit;
}

// Constants
var screen_w = 320;
var screen_h = 180;

var panel_width = 100;
var panel_height = 160;
var spacing = 20;

var total_width = panel_width * 2 + spacing;
var start_x = (screen_w - total_width) / 2;
var start_y = (screen_h - panel_height) / 2;

// Party references
var haru = global.party[0];
var maya = global.party[1];

// Font + color setup
draw_set_color(c_white);
draw_set_font(m3x6);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// ------------------------------------------------
// Check if Scene 1 cutscene is completed
if (!variable_global_exists("cutscenes_played")) global.cutscenes_played = [];
var scene1_done = array_contains(global.cutscenes_played, "scene 1");


//var scene1_done = (variable_global_exists("scene 1") && variable_global_get("scene 1") == true);

// ------------------------------------------------
// Draw Haru panel
draw_sprite_stretched(spr_UI, 0, start_x, start_y, panel_width, panel_height);
draw_text(start_x + panel_width / 2, start_y + 10, "Haru");
draw_text(start_x + panel_width / 2, start_y + 40, "Lv: " + string(haru.level));
draw_text(start_x + panel_width / 2, start_y + 60, "Atk: " + string(haru.strength));
draw_text(start_x + panel_width / 2, start_y + 80, "HP: " + string(haru.hp) + "/" + string(haru.hpmax));
draw_text(start_x + panel_width / 2, start_y + 100, "MP: " + string(haru.mp) + "/" + string(haru.mpmax));

// ------------------------------------------------
// Only draw Maya’s panel if Scene 1 cutscene is done
if (scene1_done) {
    var maya_x = start_x + panel_width + spacing;
    draw_sprite_stretched(spr_UI, 0, maya_x, start_y, panel_width, panel_height);
    draw_text(maya_x + panel_width / 2, start_y + 10, "Maya");
    draw_text(maya_x + panel_width / 2, start_y + 40, "Lv: " + string(maya.level));
    draw_text(maya_x + panel_width / 2, start_y + 60, "Atk: " + string(maya.strength));
    draw_text(maya_x + panel_width / 2, start_y + 80, "HP: " + string(maya.hp) + "/" + string(maya.hpmax));
    draw_text(maya_x + panel_width / 2, start_y + 100, "MP: " + string(maya.mp) + "/" + string(maya.mpmax));
}

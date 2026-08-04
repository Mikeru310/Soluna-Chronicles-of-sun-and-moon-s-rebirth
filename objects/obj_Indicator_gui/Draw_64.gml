/// Draw GUI Event for obj_indicator_gui

// ============= HIDE CHECKS =============
var hide_gui = false;

// Dialogue box open?
if (instance_exists(obj_textbox)) hide_gui = true;

// Inventory menu open?
if (instance_exists(obj_inventory_gui)) hide_gui = true;

// Stats menu open?
if (instance_exists(objStatView)) hide_gui = true;
         

if (instance_exists(obj_credits)) instance_destroy();

// Main game menu open? (SAFE CHECK)
if (instance_exists(objGame)) {
    if (objGame.menu_open) hide_gui = true;
}

// Map menu open?
if (instance_exists(obj_Map_menu)) hide_gui = true;

// Cutscene active?
if (instance_exists(obj_cutscene)) hide_gui = true;

// Quest menu open?
if (instance_exists(obj_quest_menu)) hide_gui = true;

// Rune menu open?
if (instance_exists(obj_rune_menu)) hide_gui = true;

// If ANY are open, stop drawing GUI
if (hide_gui) exit;


// ======================
// USE ACTUAL GUI SIZE
// ======================
var w = display_get_gui_width();
var h = display_get_gui_height();

draw_set_font(m3x6);

var keys_text = "CONTROLS: Z: Interact  |  Arrows: Move  |  C: Open  |  X: Back  |  M: Map";

var bar_h = 12;

// ======================
//   DRAW AT BOTTOM
// ======================
var bar_y = h - bar_h;

// Black background bar
draw_set_color(c_black);
draw_rectangle(0, bar_y, w, h, false);

// White centered text
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(w * 0.5, bar_y + bar_h * 0.5, keys_text);

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);

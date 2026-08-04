/// Put this at the TOP of your Draw GUI event (or make it a script called scr_draw_text_bordered)
function draw_text_bordered(_x, _y, _txt, _col_text, _col_border) {
    // draw border in 8 directions
    draw_set_color(_col_border);
    draw_text(_x - 1, _y,         _txt);
    draw_text(_x + 1, _y,         _txt);
    draw_text(_x,     _y - 1,     _txt);
    draw_text(_x,     _y + 1,     _txt);
    draw_text(_x - 1, _y - 1,     _txt);
    draw_text(_x + 1, _y - 1,     _txt);
    draw_text(_x - 1, _y + 1,     _txt);
    draw_text(_x + 1, _y + 1,     _txt);

    // main text
    draw_set_color(_col_text);
    draw_text(_x, _y, _txt);
}

// Extended version for bordered multi-line text
function draw_text_bordered_ext(_x, _y, _txt, _col_text, _col_border, _sep, _w) {
    // border in 8 directions
    draw_set_color(_col_border);
    draw_text_ext(_x - 1, _y, _txt, _sep, _w);
    draw_text_ext(_x + 1, _y, _txt, _sep, _w);
    draw_text_ext(_x, _y - 1, _txt, _sep, _w);
    draw_text_ext(_x, _y + 1, _txt, _sep, _w);
    draw_text_ext(_x - 1, _y - 1, _txt, _sep, _w);
    draw_text_ext(_x + 1, _y - 1, _txt, _sep, _w);
    draw_text_ext(_x - 1, _y + 1, _txt, _sep, _w);
    draw_text_ext(_x + 1, _y + 1, _txt, _sep, _w);

    // main text
    draw_set_color(_col_text);
    draw_text_ext(_x, _y, _txt, _sep, _w);
}

// ---- Draw GUI content ----
draw_set_font(m3x6);
draw_set_color(c_white);
draw_sprite_stretched(spr_UI, 0, 0, 0, 320, 180);

// Title (bordered)
draw_text_bordered(10, 5, "Nong Mark's Supply Shop", c_white, c_black);

// Shop Items
var yy = 20;
var hovered_item = noone;
for (var i = 0; i < array_length(global.shop_inventory); i++) {
    var item = global.shop_inventory[i];

    if (i == shop_cursor) {
        // Highlight background (filled yellow)
        draw_set_color(c_yellow);
        draw_rectangle(6, yy - 2, 154, yy + 12, false);

        // Hovered text: black main color with WHITE border
        draw_text_bordered(10, yy, item.name + " - " + string(item.price) + "G", c_black, c_white);

        hovered_item = item;
    } else {
        // Normal text: white with black border
        draw_text_bordered(10, yy, item.name + " - " + string(item.price) + "G", c_white, c_black);
    }

    yy += 14;
}

// ===============================
// Inventory title and list (SAFE)
// ===============================
draw_text_bordered(170, 5, "Inventory", c_white, c_black);

// Safely get inventory length (handles missing global.inventory)
var inv_len = 0;
if (variable_global_exists("inventory")) {
    inv_len = array_length(global.inventory);
}

var inv_y = 20;

// Only loop if there *are* entries
for (var i = 0; i < inv_len; i++) {
    var entry = global.inventory[i];

    // Skip invalid / empty slots
    if (entry == undefined) continue;
    if (!is_array(entry)) continue;
    if (array_length(entry) < 2) continue;

    var inv_item   = entry[0];
    var inv_amount = entry[1];

    // extra safety: make sure inv_item isn't undefined
    if (inv_item == undefined) continue;

    draw_text_bordered(170, inv_y, inv_item.name + " x" + string(inv_amount), c_white, c_black);
    inv_y += 12;
}

// Description box BELOW the shop list (right side)
if (hovered_item != noone) {
    var desc_x = 170;
    var desc_y = yy + 10; // directly under the last shop item
    var max_width = 140;
    var line_sep  = 12;

    draw_text_bordered_ext(desc_x, desc_y, hovered_item.itemDescription, c_white, c_black, line_sep, max_width);
}

// Gold (bottom-left)
draw_text_bordered(10, 150, "Gold: " + string(global.gold) + "G", c_white, c_black);

// Shopkeeper message (below description)
if (shop_message != "") {
    var msg_x = 170;
    var msg_y = 130; // place near bottom-right
    var max_width = 140;
    var line_sep  = 12;

    draw_text_bordered_ext(msg_x, msg_y, shop_message, c_white, c_black, line_sep, max_width);
}

// --- CONTROL INDICATORS (bottom-center) ---
var controls_text = "[Arrow Keys] Move    [Z] Buy    [X] Close";

// Center it horizontally
var tw = string_width(controls_text);
var tx = (320 - tw) / 2; // screen width is 320
var ty = 150; // near bottom (screen height 180)

draw_text_bordered(tx, ty, controls_text, c_white, c_black);

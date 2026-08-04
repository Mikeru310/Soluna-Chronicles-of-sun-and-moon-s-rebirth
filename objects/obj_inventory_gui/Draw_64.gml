//Inventory Design
// === Main container ===
var inv_x = 8;
var inv_y = 8;
var inv_w = 304;
var inv_h = 164;

// === Outer Border ===
draw_set_color(c_white);
draw_rectangle(inv_x - 3, inv_y - 3, inv_x + inv_w + 3, inv_y + inv_h + 3, false);
draw_set_color(c_black);
draw_rectangle(inv_x - 2, inv_y - 2, inv_x + inv_w + 2, inv_y + inv_h + 2, false);
draw_set_color(c_white);
draw_rectangle(inv_x - 1, inv_y - 1, inv_x + inv_w + 1, inv_y + inv_h + 1, false);

// === Fill ===
draw_set_color(make_color_rgb(25, 25, 25));
draw_rectangle(inv_x, inv_y, inv_x + inv_w, inv_y + inv_h, false);

// ------------------------------------------------------------
// 🏷 TITLE
// ------------------------------------------------------------
draw_set_font(m3x6);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(display_get_gui_width() / 2, inv_y + 6, "Inventory");

// === 💰 Gold Display (Top-Right Corner) ===
draw_set_halign(fa_right);
draw_set_color(c_yellow);
draw_text(inv_x + inv_w - 10, inv_y + 6, "Gold: " + string(global.gold));

// ------------------------------------------------------------
// 📦 Layout Setup
// ------------------------------------------------------------
var left_w = 150;
var right_x = inv_x + left_w + 12;
var right_w = inv_w - left_w - 22;

var section_top = inv_y + 24;
var section_bottom = inv_y + inv_h - 26;

var text_scale = 0.7;
var item_y = section_top + 4;
var item_spacing = 17;

// ------------------------------------------------------------
// 🎒 ITEM LIST
// ------------------------------------------------------------
draw_set_halign(fa_left);
draw_set_font(m3x6);

for (var i = global.scroll_offset; i < min(array_length(global.inventory), global.scroll_offset + global.max_items_visible); i++) {
    var entry = global.inventory[i];

    // Only draw valid entries
    if (entry != undefined && is_array(entry) && array_length(entry) >= 2) {
        var item = entry[0];
        var amt = entry[1];

        // Highlight selected
        if (i == global.selected_item) {
            draw_set_color(make_color_rgb(45, 45, 45));
            draw_rectangle(inv_x + 10, item_y - 2, inv_x + left_w - 10, item_y + item_spacing - 3, false);
        }

        // Item text
        draw_set_color(c_white);
        draw_text_transformed(inv_x + 12, item_y, item.name, text_scale, text_scale, 0);
        draw_text_transformed(inv_x + left_w - 28, item_y, string(amt), text_scale, text_scale, 0);

        item_y += item_spacing;
    }
}

// ------------------------------------------------------------
// 🖼 ITEM IMAGE + DESCRIPTION (SAFE VERSION)
// ------------------------------------------------------------
if (global.selected_item >= 0 && global.selected_item < array_length(global.inventory)) {

    var entry = global.inventory[global.selected_item];

    if (entry != undefined && is_array(entry) && array_length(entry) >= 2) {

        var selected_item = entry[0];

        // === Item Image ===
        if (selected_item.sprite != undefined) {
            var spr = selected_item.sprite;
            var spr_scale = 0.6;
            var spr_w = sprite_get_width(spr);
            var spr_h = sprite_get_height(spr);
            var draw_x = right_x + (right_w - spr_w * spr_scale) / 2;
            var draw_y = section_top + 6;

            draw_sprite_ext(spr, 0, draw_x, draw_y, spr_scale, spr_scale, 0, c_white, 1);
        }

        // === Description Text ===
        var wrapped_text = wrap_text(selected_item.itemDescription, right_w - 8);
        var lines = string_split(wrapped_text, "\n");
        var desc_y = section_top + 70;

        draw_set_color(c_white);
        for (var j = 0; j < array_length(lines); j++) {
            draw_text_transformed(right_x + 4, desc_y, lines[j], text_scale, text_scale, 0);
            desc_y += 10 * text_scale + 1;
        }
    }
}

// ------------------------------------------------------------
// 🎯 USE PROMPT
// ------------------------------------------------------------
if (global.item_use_mode) {
    var info_x = right_x + 8;
    var info_y = inv_y + inv_h - 26;

    draw_set_font(m3x6);
    draw_set_color(c_white);
    draw_text(info_x, info_y, "Use on:");

    if (global.item_use_target == 0) {
        draw_set_color(c_yellow);
        draw_text(info_x + 60, info_y, "Haru");
        draw_set_color(c_white);
        draw_text(info_x + 110, info_y, "Maya");
    } else {
        draw_set_color(c_white);
        draw_text(info_x + 60, info_y, "Haru");
        draw_set_color(c_yellow);
        draw_text(info_x + 110, info_y, "Maya");
    }
}

// ------------------------------------------------------------
// 🧾 FOOTER
// ------------------------------------------------------------
var item_count = min(array_length(global.inventory), global.max_items_visible);
scr_draw_feedback(inv_x, inv_y, left_w, item_spacing, item_count, text_scale);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text_transformed(display_get_gui_width() / 2, inv_y + inv_h - 10, "[Arrow Keys] Move   [Z] Select   [X] Exit", 0.7, 0.7, 0);

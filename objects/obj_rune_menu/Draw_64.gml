// Rune Altar Menu – Simple Text with Hover Effect
// Ensure we start from a known draw state
draw_set_color(c_white);
draw_set_alpha(1);

//for the whole ui
draw_sprite_stretched(spr_UI, 0, 0, 0, 200, 200);

//box for rune sprite
draw_sprite_stretched(spr_UI, 0, 203, 0, 100,71);

//box for description
draw_sprite_stretched(spr_UI, 0, 203,120,115,51);

var name = (selected_character == 0) ? "Haru" : "Maya";
var runes = (selected_character == 0) ? global.haru_runes : global.maya_runes;
var rune_names = ["Red", "Yellow", "Blue"];
var rune_labels = ["HP", "ATK", "MP"];

// Rune sprites
var rune_sprites = [spr_red_rune, spr_yellow_rune, spr_blue_rune];

// Rune descriptions (one for each rune)
var rune_descriptions = [
    "A crimson rune infused with life energy.\nIncreases maximum HP.",
    "A bright rune brimming with power.\nBoosts physical attack.",
    "A calm azure rune linked to the mind.\nRaises maximum MP."
];

draw_set_color(c_white);
draw_text(8, 8, "== Rune Altar ==");
draw_text(8, 20, "Gold: " + string(global.gold));

// Character Selector (Updated)
var char_text = (selected_character == 0) ? "Haru >>" : "<< Maya";
draw_text(8, 32, char_text);

draw_text(8, 44, "Select a Rune to Upgrade:");

for (var i = 0; i < 3; i++) {
    var level = runes[i];
    var current_bonus = 0;
    var next_bonus = 0;
    
    // Current bonus (what you have now)
    if (level > 0) {
        switch (i) {
            case 0: current_bonus = global.rune_stats.red[level - 1]; break;
            case 1: current_bonus = global.rune_stats.yellow[level - 1]; break;
            case 2: current_bonus = global.rune_stats.blue[level - 1]; break;
        }
    }
    
    // Next bonus (what you'll get after upgrade)
    if (level < 5) {
        switch (i) {
            case 0: next_bonus = global.rune_stats.red[level]; break;
            case 1: next_bonus = global.rune_stats.yellow[level]; break;
            case 2: next_bonus = global.rune_stats.blue[level]; break;
        }
    }
    
    // Rune Cost
    var cost = (level < 5) ? (level + 1) * 100 : 0;
    var line_y = 60 + i * 16;

    // Hover effect: color + arrow
    var is_selected = (i == selected_rune);
    draw_set_color(is_selected ? c_lime : c_white);
    var marker = is_selected ? "> " : "  ";
    
    // Display text - show current stats and next upgrade
    var display_text = marker + rune_names[i] + " Rune";
    
    if (level >= 5) {
        display_text += " (+" + string(current_bonus) + " " + rune_labels[i] + ") - Lv." + string(level) + " [MAX]";
    } else {
        display_text += " (+" + string(current_bonus) + " > +" + string(next_bonus) + " " + rune_labels[i] + ") - Lv." + string(level) + " | Cost: " + string(cost);
    }

    draw_text(8, line_y, display_text);
}

// === Draw the hovered rune sprite inside the box ===
var spr_to_draw = rune_sprites[selected_rune];
draw_sprite_ext(spr_to_draw, 0, 220, 3, 2, 2, 0, c_white, 1);

// === Draw description inside description box ===
var desc_x = 205;
var desc_y = 125;
draw_text_bordered(desc_x, desc_y, rune_descriptions[selected_rune], c_white, c_black);

// Confirmation Prompt
if (confirming) {
    var rune_level = runes[selected_rune];

    if (rune_level >= 5) {
        draw_set_color(c_red);
        draw_text(8, 120, "This rune is already at max level!");
        draw_set_color(c_gray);
        draw_text(8, 132, "[X] Back");
    } else {
        draw_set_color(c_yellow);
        draw_text(8, 120, "Upgrade " + name + "'s " + rune_names[selected_rune] + " Rune?");
        draw_set_color(c_gray);
        draw_text(8, 132, "[Z] Confirm    [X] Cancel");
    }
}

// Success/Feedback Message
if (success_timer > 0) {
    draw_set_color(c_lime);
    draw_text(8, 152, success_message);
}

// Controls Hint
draw_set_color(c_gray);
draw_text(8, 164, "[Arrow Keys] Move   [Z] Select   [X] Exit");

// ---------------------------
// IMPORTANT: reset draw state
// so anything drawn after this (like obj_textbox) is not affected
draw_set_color(c_white);
draw_set_alpha(1);

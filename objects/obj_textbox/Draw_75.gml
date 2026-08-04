//depth = -1000000;
draw_set_font(m3x6);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

accept_key = keyboard_check_pressed(ord("Z"));

// --- TEXTBOX POSITION DEPENDING ON SCENE ---
if ((variable_global_exists("scene7_cutscene") && global.scene7_cutscene)
||  (variable_global_exists("scene8_cutscene") && global.scene8_cutscene)
|| (variable_global_exists("scene9_cutscene") && global.scene9_cutscene))  {
    textbox_x = 5;
    textbox_y = 5;
} else {
    textbox_x = 5;
    textbox_y = 110;   // <-- your normal textbox position
}

// ----------------- Setup ----------------- //
if setup == false {
    setup = true;

    draw_set_font(m3x6);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    draw_set_color(c_white);     

    for (var p = 0; p < page_number; p++) {
        text_length[p] = string_length(text[p]);
        text_x_offset[p] = 67;
    }

    // Initialize typing vars
    draw_char = 0;
    page = 0;
    punctuation_pause = 0;
    pause_duration = 20;

    // Prevent draw or updates this frame
    return;
}

// ----------------- Typing Logic ----------------- //
if draw_char < text_length[page] {
    if (punctuation_pause <= 0) {
        draw_char += text_spd;
        draw_char = clamp(draw_char, 0, text_length[page]);

        var current_char = string_char_at(text[page], draw_char);

        if current_char == "." || current_char == "," || current_char == "!" || current_char == "?" {
            punctuation_pause = pause_duration;
        }

        if current_char == "-" {
            if (page < page_number - 1) {
                page++;
                draw_char = 0;
                punctuation_pause = 0;
            } else {
                if option_number > 0 {
                    create_textbox(option_link_id[option_position]);
                }
                instance_destroy();
            }
        }
    } else {
        punctuation_pause -= 1;
    }
}

// ----------------- Page Turning ----------------- //
if accept_key {
    if (draw_char == text_length[page]) {
        if (page < page_number - 1) {
            page++;
            draw_char = 0;
            punctuation_pause = 0;

            // ✅ update speaker for new page
            current_speaker = speaker[page];

        } else {
            if option_number > 0 {
                create_textbox(option_link_id[option_position]);
            } else if !is_undefined(textbox_callback) {
                textbox_callback();
            }
            instance_destroy();
        }
    } else {
        draw_char = text_length[page];
        punctuation_pause = 0;

        // ✅ ensure speaker updates even when skipping
        current_speaker = speaker[page];
    }
}


// ----------------- Draw Textbox ----------------- //
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y, textbox_width / txtb_spr_w, textbox_height / txtb_spr_h, 0, c_white, 1);

// ----------------- Draw Speaker Name ----------------- //
if (speaker[page] != "") {
    var _name_x = _txtb_x + (textbox_width / 2); // center horizontally
    var _name_y = _txtb_y + 2;                   // slightly below top edge
    
    draw_set_halign(fa_center);
    draw_text(_name_x, _name_y, speaker[page]);
    draw_set_halign(fa_left); // reset after drawing

    // Shift dialogue text down so it doesn't overlap with the name
    _txtb_y += 12;
}

// ----------------- Options ----------------- //
if draw_char == text_length[page] && page == page_number - 1 {
    option_position += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
    option_position = clamp(option_position, 0, option_number - 1);

    var _op_space = 20;
    var _op_bord = 6;

    // Base position: ABOVE the dialogue textbox
    var _options_x = _txtb_x + 16;
    var _options_y = _txtb_y - (_op_space * option_number) - 12; // offset upwards

    for (var op = 0; op < option_number; op++) {
        var _o_w = string_width(option[op]) + _op_bord * 2;
        var _op_y = _options_y + (op * _op_space);

        // Draw option textbox background
        draw_sprite_ext(txtb_spr, txtb_img, _options_x, _op_y,
            _o_w / txtb_spr_w, (_op_space - 1) / txtb_spr_h, 0, c_white, 1);

        // Draw arrow selector
        if option_position == op {
            draw_sprite(spr_arrow, 0, _options_x - 12, _op_y);
        }

        // Draw option text
        draw_text(_options_x + _op_bord, _op_y + 2, option[op]);
    }
}

// ----------------- Draw Text ----------------- //
var _drawText = string_copy(text[page], 1, draw_char);
draw_text_ext(_txtb_x + border, _txtb_y + border, _drawText, line_sep, line_width);




// ----------------- "Press [Z] to continue" prompt ----------------- //
if (draw_char >= text_length[page]) { 
    var prompt_text = "Press [Z] to continue";

    // Coordinates relative to the textbox itself
    var prompt_x = textbox_x + textbox_width + text_x_offset[page] - string_width(prompt_text) - border - 4;
    var prompt_y = textbox_y + textbox_height - border - 10;

    // Make sure it's inside the textbox area
    draw_set_font(m3x6);
    draw_set_color(c_white);
    
    // Optional blinking effect (every 0.5s)
    if ((current_time div 500) mod 2 == 0) {
        draw_set_alpha(0.8);
        draw_text(prompt_x, prompt_y, prompt_text);
        draw_set_alpha(1);
    } else {
        // draw nothing during the "off" blink frame
    }
}


//what the fuck am i doing
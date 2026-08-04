/// @function scr_draw_feedback()
/// @description Draws the feedback message just under the item list.

function scr_draw_feedback(inv_x, inv_y, inv_width, item_spacing, item_count, text_scale) {
    if (global.feedback_timer > 0 && global.feedback_message != "") {
        var msg = global.feedback_message;

        var msg_width = string_width(msg) * text_scale;
        var msg_height = string_height(msg) * text_scale;

        // X: same as inventory left padding
        var msg_x = inv_x + 10;

        // Y: calculate position just under the list
        var msg_y = inv_y + 30 + (item_spacing * item_count) + 10;

        draw_set_color(c_black);
        draw_rectangle(msg_x - 4, msg_y - 4, msg_x + msg_width + 4, msg_y + msg_height + 4, false);

        draw_set_color(c_white);
        draw_text_transformed(msg_x, msg_y, msg, text_scale, text_scale, 0);
    }
}


//function draw_text_bordered(_x, _y, _txt, _col_text, _col_border) {
    //// Draw border (offsets around the text)
    //draw_set_color(_col_border);
    //draw_text(_x - 1, _y,     _txt);
    //draw_text(_x + 1, _y,     _txt);
    //draw_text(_x,     _y - 1, _txt);
    //draw_text(_x,     _y + 1, _txt);
//
    //// Draw main text
    //draw_set_color(_col_text);
    //draw_text(_x, _y, _txt);
//}

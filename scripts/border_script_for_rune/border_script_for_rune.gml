/// @function draw_text_bordered(_x, _y, _txt, _col_text, _col_border)
function draw_text_bordered(_x, _y, _txt, _col_text, _col_border) {
    draw_set_color(_col_border);
    draw_text(_x - 1, _y, _txt);
    draw_text(_x + 1, _y, _txt);
    draw_text(_x, _y - 1, _txt);
    draw_text(_x, _y + 1, _txt);

    draw_set_color(_col_text);
    draw_text(_x, _y, _txt);
}

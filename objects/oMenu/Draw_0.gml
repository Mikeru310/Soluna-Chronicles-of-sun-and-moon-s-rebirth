/// DRAW GUI

draw_set_color(c_black);
draw_set_font(m3x6);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Detect if this menu is 2 columns or scrolling list
var isTwoColumn = (optionsPerRow == 2);

// =====================================================
// TWO-COLUMN MENU (Attack, Magic, Items, Escape)
// =====================================================
if (isTwoColumn)
{
    for (var i = 0; i < array_length(options); i++)
    {
        var row = i div optionsPerRow;
        var col = i mod optionsPerRow;

        var colX = x + xmargin + col * 60;
        var rowY = y + ymargin + row * heightLine;

        var _str = options[i][0];

        // cursor
        if (i == hover)
            draw_sprite(spr_pointer, 0, colX - -5, rowY + 7);

        // grayed-out if disabled
        if (options[i][3] == false)
            draw_set_color(c_gray);
        else
            draw_set_color(c_black);

        draw_text(colX, rowY, _str);
    }
}


// =====================================================
// SINGLE-COLUMN SCROLLING MENU (Items, Magic list, etc.)
// =====================================================
else
{
    var total = array_length(options);
    var start = scrollIndex;
    var finish = min(scrollIndex + visibleOptionsMax, total);

    // Draw visible entries only
    for (var i = start; i < finish; i++)
    {
        var visibleRow = i - start;
        var rowY = y + ymargin + visibleRow * heightLine;
        var textX = x + xmargin;

        // Draw pointer
        if (i == hover)
            draw_sprite(spr_pointer, 0, textX - 10, rowY + 7);

        // Disabled option?
        if (options[i][3] == false)
            draw_set_color(c_gray);
        else
            draw_set_color(c_black);

        draw_text(textX, rowY, options[i][0]);
    }

    // Scroll arrows
    draw_set_color(c_black);

    // UP arrow if list is not at top
    if (scrollIndex > 0)
        draw_text(x + xmargin, y + ymargin - heightLine, "^");

    // DOWN arrow if there are more items below
    if (scrollIndex + visibleOptionsMax < total)
        draw_text(x + xmargin, y + ymargin + visibleOptionsMax * heightLine, "v");
}

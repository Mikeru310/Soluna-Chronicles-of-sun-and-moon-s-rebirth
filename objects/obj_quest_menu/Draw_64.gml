/// === Quest Log UI (Rune Altar Style) ===
var gui_w = 320;
var gui_h = 180;

// Background
draw_set_alpha(0.9);
draw_set_color(c_black);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1);

// Font
if (font_exists(m3x6)) draw_set_font(m3x6);

// Boxes
draw_rectangle(10, 10, 140, 120, false); // Quest list
draw_rectangle(150, 10, 310, 120, false); // Description
draw_rectangle(10, 130, 310, 170, false); // Status + controls

// Titles
draw_set_color(c_white);
draw_text(15, 12, "== Quest Log ==");
draw_text(15, 22, "Active Quests:");
draw_text(155, 22, "Description:");


// =====================================================
// ★ QUEST LIST — supports Available / In Progress / Complete
// =====================================================
if (array_length(global.quest_data) > 0) {

    for (var i = 0; i < array_length(global.quest_data); i++) {

        var quest = global.quest_data[i];

        // Safe read fields
        var name = quest[? "title"];
        var completed = quest[? "completed"];
        var started   = quest[? "started"];

        var yy = 36 + i * 12;

        // Visible only inside the box
        if (yy < 115) {

            var col = c_white;

            // Completed → Green
            if (completed) col = c_lime;

            // Started but not finished → Blue
            else if (started) col = c_blue;

            // Not started → White

            // Selection highlight ALWAYS yellow
            if (menu_index == i) col = c_yellow;

            draw_set_color(col);
            var prefix = (menu_index == i ? "> " : "  ");

            draw_text(18, yy, prefix + name);
        }
    }

} else {
    draw_set_color(c_gray);
    draw_text(18, 40, "No quests available.");
}



// =====================================================
// ★ DESCRIPTION (wrapped)
// =====================================================
if (array_length(global.quest_data) > 0 && show_details) {

    var q = global.quest_data[menu_index];
    var desc = q[? "description"];

    draw_set_color(c_white);
    var wrapped = string_wrap(desc, 150, m3x6);
    draw_text(155, 36, wrapped);
}



// =====================================================
// ★ STATUS INDICATOR (Colored based on state)
// =====================================================
if (array_length(global.quest_data) > 0) {

    var q = global.quest_data[menu_index];

    var completed = q[? "completed"];
    var started   = q[? "started"];

    var status = "Available";
    var col    = c_white;

    if (completed) {
        status = "Completed";
        col = c_lime;
    }
    else if (started) {
        status = "In Progress";
        col = c_blue;
    }

    draw_set_color(c_white);
    draw_text(20, 135, "Quest Status:");

    draw_set_color(col);
    draw_text(115, 135, status);
}



// =====================================================
// ★ Controls
// =====================================================
draw_set_color(c_gray);
draw_text(20, 155, "[Z] Toggle Details   [C/X] Close Log   [Up key/Down key] Navigate");

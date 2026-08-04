// --- Draw static text ---
draw_set_font(fnt_introSol); // or your custom font
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Yellowish text color (you can tweak this)
draw_set_color(c_white);

// Draw the text at the object's position
draw_text(x, y, "Press Z to Continue");

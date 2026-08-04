// ======================================================
// BATTLE INTRO FADE (MAP → BLACK → BATTLE)
// ======================================================
if (battle_fade_alpha > 0)
{
    draw_set_color(c_black);
    draw_set_alpha(battle_fade_alpha);

    var cam = view_camera[0];

    draw_rectangle(
        camera_get_view_x(cam),
        camera_get_view_y(cam),
        camera_get_view_x(cam) + camera_get_view_width(cam),
        camera_get_view_y(cam) + camera_get_view_height(cam),
        false
    );

    draw_set_alpha(1);
    draw_set_color(c_white);
}

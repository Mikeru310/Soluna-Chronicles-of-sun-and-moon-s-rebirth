if (fade_alpha > 0)
{
    draw_set_alpha(fade_alpha);
    draw_sprite_stretched(spr_black, 0, 0, 0, display_get_width(), display_get_height());
    draw_set_alpha(1);
}

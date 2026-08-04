
// ------ SPEAKER INDICATOR ------
if (!is_undefined(current_speaker) && current_speaker != "") {

    // find the NPC that matches the name
    with (all)
    {
        if (variable_instance_exists(id, "npc_name"))
        {
            if (npc_name == other.current_speaker)
            {
                // Draw indicator above object
                var spr_h = sprite_get_height(sprite_index);
                var spr_or_y = sprite_get_yoffset(sprite_index);
                var indicator_y = y - (spr_h - spr_or_y) - 8;

                draw_sprite(spr_talk, 0, x, indicator_y);
            }
        }
    }
}

switch (fade_state)
{
    // --- Idle: wait for player contact ---
    case 0:
        if (place_meeting(x, y, obj_player))
        {
            fade_state = 1; // start fade-out
        }
    break;

    // --- Fade Out ---
    case 1:
        fade_alpha += fade_speed;
        if (fade_alpha >= 1)
        {
            fade_alpha = 1;
            fade_state = 2; // ready to switch
        }
    break;

    // --- Room Switch ---
    case 2:
        global._warp_transition = true; // mark that we’re coming from warp

        // Just in case there are duplicate players, clean them up
        with (obj_player)
        {
            if (id != global.player)
            {
                instance_destroy();
            }
        }

        // Move the real player to the target position
        if (variable_global_exists("player") && instance_exists(global.player))
        {
            global.player.x = target_x;
            global.player.y = target_y;
        }

        // Switch room
        room_goto(targetRoom);
    break;

    // --- Fade In ---
    case 3:
        fade_alpha -= fade_speed;
        if (fade_alpha <= 0)
        {
            fade_alpha = 0;
            fade_state = 0;
            persistent = false;
        }
    break;
}

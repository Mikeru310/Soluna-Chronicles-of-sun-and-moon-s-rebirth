/// Step Event - obj_credits

switch (state) {
    case 0: // FADE IN
        alpha += fade_speed;
        if (alpha >= 1) {
            alpha = 1;
            state = 1;
            hold_timer = hold_time;
        }
    break;

    case 1: // HOLD
        hold_timer -= 1;
        if (hold_timer <= 0) {
            state = 2;
        }
    break;

    case 2: // FADE OUT
        alpha -= fade_speed;
        if (alpha <= 0) {
            alpha = 0;
            credit_index += 1;

            if (credit_index >= ds_list_size(credit_list)) {
                // All done -> go to title (change rm_title to your actual room if different)
                room_goto(rm_mainmenu1);
            } else {
                // Reset for next credit
                state = 0;
            }
        }
    break;
}

// ----- FADE LOGIC -----

// Fade in
if (fading_in)
{
    fade_alpha += fade_speed;
    if (fade_alpha >= 1)
    {
        fade_alpha = 1;
        fading_in = false;
    }
}

// Fade out
if (fading_out)
{
    fade_alpha -= fade_speed;
    if (fade_alpha <= 0)
    {
        fade_alpha = 0;
        //instance_destroy(); // delete menu AFTER fade
    }
}


// ----- INPUT (ONLY WHEN FULLY VISIBLE) -----
if (!menu_active || fading_in || fading_out) exit;

// Input cooldown
if (input_timer > 0)
{
    input_timer--;
    exit;
}

// Move UP
if (keyboard_check_pressed(vk_up))
{
    selected_index = (selected_index - 1 + array_length(villages)) mod array_length(villages);
    input_timer = input_delay;
}

// Move DOWN
if (keyboard_check_pressed(vk_down))
{
    selected_index = (selected_index + 1) mod array_length(villages);
    input_timer = input_delay;
}

// OK (Z)
if (keyboard_check_pressed(ord("Z")))
{
    global.teleport_target = villages[selected_index];

    fading_out = true;
    menu_active = false;
}

// Cancel (X)
if (keyboard_check_pressed(ord("X")))
{
    fading_out = true;
    menu_active = false;
}

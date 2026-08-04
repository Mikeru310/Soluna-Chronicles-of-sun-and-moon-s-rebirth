/// STEP EVENT

// =========================
// 1. FULL LOCK (ALL INPUT)
// =========================
if (instance_exists(oBattle))
{
    if (oBattle.tutorialActive && oBattle.tutorialLock)
    {
        exit;
    }
}

// If menu is not active, do nothing
if (!active) exit;


// -------------------------------------------
// Detect if this menu is 2-column or scrolling
// -------------------------------------------
var isTwoColumn = (optionsPerRow == 2);

// Track previous hover for sound
var prev_hover = hover;


// ================================
// 2. SPECIAL TUTORIAL FORCES
// ================================
var allowMovement = true;

if (instance_exists(oBattle))
{
    if (oBattle.tutorialForceAttack)
    {
        hover = 0;
        allowMovement = false;
    }

    if (oBattle.tutorialForceItem)
    {
        for (var i = 0; i < array_length(options); i++)
        {
            if (options[i][0] == "Item")
            {
                hover = i;
                break;
            }
        }
        allowMovement = false;
    }

    if (oBattle.tutorialForcePotion)
    {
        for (var i = 0; i < array_length(options); i++)
        {
            if (string_pos("Small Potion", options[i][0]) > 0)
            {
                hover = i;
                break;
            }
        }
        allowMovement = false;
    }
}


// ===========================================
// TWO-COLUMN MENU
// ===========================================
if (isTwoColumn)
{
    if (allowMovement)
    {
        if (keyboard_check_pressed(vk_right))
        {
            if ((hover mod 2) == 0 && hover + 1 < array_length(options))
                hover++;
        }

        if (keyboard_check_pressed(vk_left))
        {
            if ((hover mod 2) == 1)
                hover--;
        }

        if (keyboard_check_pressed(vk_down))
        {
            if (hover + 2 < array_length(options))
                hover += 2;
        }

        if (keyboard_check_pressed(vk_up))
        {
            if (hover - 2 >= 0)
                hover -= 2;
        }
    }
}


// ===========================================
// SINGLE-COLUMN LIST
// ===========================================
else
{
    if (allowMovement)
    {
        var maxIndex = array_length(options) - 1;

        if (keyboard_check_pressed(vk_down))
        {
            hover = clamp(hover + 1, 0, maxIndex);

            if (hover > scrollIndex + visibleOptionsMax - 1)
                scrollIndex = clamp(scrollIndex + 1, 0, scrollMax);
        }

        if (keyboard_check_pressed(vk_up))
        {
            hover = clamp(hover - 1, 0, maxIndex);

            if (hover < scrollIndex)
                scrollIndex = clamp(scrollIndex - 1, 0, scrollMax);
        }
    }
}


// ===========================================
// PLAY MOVE SOUND (ONCE)
// ===========================================
if (hover != prev_hover && allowMovement)
{
    audio_play_sound(snd_move, 1, false);
}


// ===========================================
// SEND HOVER DESCRIPTION
// ===========================================
if (instance_exists(oBattle))
{
    var opt = options[hover];

    if (is_array(opt) && array_length(opt) > 2)
    {
        var args = opt[2];

        if (is_array(args) && array_length(args) >= 2)
        {
            var _user   = args[0];
            var _action = args[1];

            if (is_struct(_action) && variable_struct_exists(_action, "itemDescription"))
            {
                oBattle.hover_description =
                    string_replace(_action.itemDescription, "{0}", _user.name);

                oBattle.show_hover_description = true;
            }
            else
            {
                oBattle.show_hover_description = false;
            }
        }
    }
}


// ===========================================
// Z: SELECT OPTION
// ===========================================
if (keyboard_check_pressed(ord("Z")))
{
    if (array_length(options[hover]) > 1 && options[hover][3] == true)
    {
        audio_play_sound(snd_select, 1, false);

        var _func = options[hover][1];

        if (_func != -1)
        {
            if (options[hover][2] != -1)
                script_execute_ext(_func, options[hover][2]);
            else
                _func();
        }
    }
}



// If a textbox exists, do NOT allow interaction
if (instance_exists(obj_textbox)) {
    exit;
}




if (!confirming) {
    if (keyboard_check_pressed(vk_left)) selected_character = max(0, selected_character - 1);
    if (keyboard_check_pressed(vk_right)) selected_character = min(1, selected_character + 1);
    if (keyboard_check_pressed(vk_up)) selected_rune = max(0, selected_rune - 1);
    if (keyboard_check_pressed(vk_down)) selected_rune = min(2, selected_rune + 1);

    if (keyboard_check_pressed(ord("Z"))) confirming = true;
    if (keyboard_check_pressed(ord("X"))) instance_destroy(); // Exit for demo
} else {
    if (keyboard_check_pressed(ord("Z"))) {
        var names = ["Red", "Yellow", "Blue"];
        var runes;
        var unit;

        // Get correct rune array and character
        if (selected_character == 0) {
            runes = global.haru_runes;
            unit = global.party[0];
        } else {
            runes = global.maya_runes;
            unit = global.party[1];
        }

        var level = runes[selected_rune];
        var cost = (level + 1) * 100;

        show_debug_message("Before upgrade: " + (selected_character == 0 ? "Haru" : "Maya") +
            " " + names[selected_rune] + " Rune = " + string(level));

        if (level < 5) {
            if (global.gold >= cost) {
                global.gold -= cost;
                runes[selected_rune] += 1;
                  
                  
                  ApplyLevelStats(unit);
                if (unit.name == "Haru") global.party[0] = unit;
else if (unit.name == "Maya") global.party[1] = unit;

                success_message = (selected_character == 0 ? "Haru" : "Maya") +
                    "'s " + names[selected_rune] + " Rune upgraded!";

                show_debug_message("After upgrade: " + (selected_character == 0 ? "Haru" : "Maya") +
                    " " + names[selected_rune] + " Rune = " + string(runes[selected_rune]));
            } else {
                success_message = "Not enough gold!";
            }
        } else {
            success_message = "This rune is already at max level!";
        }

        success_timer = 90;
         upgrade_input_handled = true;
        confirming = false;
    }
}

// Success message timer
if (success_timer > 0) {
    success_timer--;
    if (success_timer == 0) {
        success_message = "";
    }
}

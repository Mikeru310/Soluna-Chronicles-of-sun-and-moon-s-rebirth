// ═══════════════════════════════════════════════════════
// obj_GameOver - STEP EVENT
// ═══════════════════════════════════════════════════════

// ---------------------------
// 0. FADE-IN GAME OVER TEXT
// ---------------------------
if (!fade_done) {
    fade_alpha += fade_speed;
    if (fade_alpha >= 1) {
        fade_alpha = 1;
        fade_done = true;
    }
    return; // stop here until fade is fully done
}

// ---------------------------
// 1. STARTUP DELAY
// ---------------------------
if (!dialogue_started) {
    dialogue_start_delay--;
    if (dialogue_start_delay <= 0) {
        dialogue_started = true;
    }
    if (!dialogue_started) return;
}

// ---------------------------
// 2. TYPING EFFECT
// ---------------------------
if (!dialogue_done) {
    // Handle punctuation pauses
    if (typing_pause_timer > 0) {
        typing_pause_timer--;
        return;
    }
    
    var next_index = string_length(dialogue_visible) + 1;
    if (next_index <= string_length(dialogue_full)) {
        var ch = string_char_at(dialogue_full, next_index);
        dialogue_visible += ch;
        
        // Punctuation-based pauses
        switch (ch) {
            case ".":
            case "?":
            case "!":
                typing_pause_timer = 10; 
                break;
            case ",":
            case ";":
            case ":":
                typing_pause_timer = 6; 
                break;
            default:
                typing_pause_timer = 0;
        }
    } else {
        dialogue_done = true;
        selection = 0; // re-enable menu
    }
    return; // STOP here until typing done
}

// ---------------------------
// 3. MENU CONTROLS (ONLY WHEN DONE)
// ---------------------------
if (keyboard_check_pressed(vk_up)) selection--;
if (keyboard_check_pressed(vk_down)) selection++;

if (selection < 0) selection = array_length(options) - 1;
if (selection > array_length(options) - 1) selection = 0;

pointer_timer += 0.1;
pointer_y_offset = sin(pointer_timer * 2) * 1.5;

// Confirm
if (keyboard_check_pressed(ord("Z"))) {
    
    // ⭐ STOP GAME OVER MUSIC BEFORE LEAVING
    if (audio_is_playing(global.music_game_over)) {
        audio_stop_sound(global.music_game_over);
    }
    global.current_music = noone;
    
    switch (selection) {
        case 0: // Load Last Save
            global.follower_present = true;
            global.follower_frozen = false;
            global.battle_lost = false;
            
            if (file_exists("save.json")) {
                load_game_json();
            } else {
                instance_activate_all();
                
                with (obj_player) instance_destroy();
                with (obj_follower) instance_destroy();
                with (oBattle) instance_destroy();
                with (oBattleUnitPC) instance_destroy();
                with (oBattleUnitEnemy) instance_destroy();
                with (oMenu) instance_destroy();
                
                room_goto(rm_mainmenu1);
            }
            break;
            
        case 1: // Return to Main Menu
            global.battle_lost = false;
            global.follower_present = true;
            global.follower_frozen = false;
            
            instance_activate_all();
            
            with (obj_player) instance_destroy();
            with (obj_follower) instance_destroy();
            with (oBattle) instance_destroy();
            with (oBattleUnitPC) instance_destroy();
            with (oBattleUnitEnemy) instance_destroy();
            with (oMenu) instance_destroy();
            
            room_goto(rm_mainmenu1);
            break;
    }
}
// ═══════════════════════════════════════════════════════
// obj_GameOver - CREATE EVENT
// ═══════════════════════════════════════════════════════

//STOP ALL MUSIC AND PLAY GAME OVER MUSIC 
// Stop battle music
if (audio_is_playing(global.music_battle)) {
    audio_stop_sound(global.music_battle);
}
if (audio_is_playing(global.music_boss_battle)) {
    audio_stop_sound(global.music_boss_battle);
}

// Stop any currently playing music
if (global.current_music != noone && audio_is_playing(global.current_music)) {
    audio_stop_sound(global.current_music);
}

// Play game over music
global.music_id = audio_play_sound(global.music_game_over, 10, false); // false = don't loop
audio_sound_gain(global.music_game_over, global.music_volume * global.master_volume, 0);
global.current_music = global.music_game_over;

show_debug_message("🎵 Game Over music started");

// Battle state cleanup
global.in_battle = false;

// ═══════════════════════════════════════════════════════
// DIALOGUE SETUP
// ═══════════════════════════════════════════════════════

// --- Dialogue Setup ---
dialogue_lines_sol = [
    "On your feet! The world hasn't earned your surrender.",
    "You didn't lose — you learned. Now use it. Fight again.",
    "I won't let you fade here. Rise, and push back harder.",
    "Feel that fire inside? Good. Stoke it. We go again.",
    "You carry my flame. Flames don't die quietly. Stand and ignite once more.",
    "If this were training, I'd give you a gold star for effort. And nothing else.",
    "Impressive fall. Very dramatic. 10/10 form, 0/10 survival.",
    "I blinked and you died. Stop doing that.",
    "At this rate, we need a 'Frequent Falling' reward card for you.",
    "Are you fighting enemies or hugging them to death? Because it's not working."
];

dialogue_lines_luna = [
    "Hush... let the silence mend the pieces of your heart.",
    "You didn't fail. You reached your limit. Limits can grow.",
    "Close your eyes. I'll watch over you until you rise.",
    "You're safe now. Take your time before you stand again.",
    "I'm proud of you. Even now.",
    "Let the tears fall if they must… they'll water your strength.",
    "Your light flickered, but it never went out.",
    "Even defeat can be gentle, if you allow it.",
    "I'm right here. Let my voice guide you back.",
    "When you rise again, you'll shine brighter than before."
];

// Pick random speaker
speaker = choose("Sol", "Luna");
if (speaker == "Sol") {
    dialogue_full = dialogue_lines_sol[irandom(array_length(dialogue_lines_sol)-1)];
    dialogue_color = c_yellow;
} else {
    dialogue_full = dialogue_lines_luna[irandom(array_length(dialogue_lines_luna)-1)];
    dialogue_color = c_blue;
}

// Typing system
dialogue_visible = "";
typing_speed = 1;
typing_pause_timer = 0;

// Required variables
dialogue_started = false;
dialogue_start_delay = 90; // delay before typing begins
dialogue_done = false;

// --- Options ---
options = ["Load Last Save", "Return to Main Menu"];
selection = 0; // Start at 0 (will be disabled until dialogue is done)

// Pointer animation
pointer_y_offset = 0;
pointer_timer = 0;

// Fade-in system
fade_alpha = 0;
fade_speed = 0.02;
fade_done = false;
// oGameRoomMusic - CREATE EVENT
// Plays music ONLY in gameroom (not persistent)

// Play gameroom music
var music = audio_play_sound(Final_Quest___Gentler_Moments, 1, true);
audio_sound_gain(music, 0.8, 0);

show_debug_message("GameRoom music started!");
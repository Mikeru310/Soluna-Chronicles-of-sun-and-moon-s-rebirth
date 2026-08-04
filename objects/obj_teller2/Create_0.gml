dialogue_stage = 0;
interact = false;
has_talked = false; // ✅ NEW: Track if the dialogue already finished
dialogue_ended = false; // ✅ This line is required!

spawn_location_name = "Steppe Ridge";

welcome_text = "Greetings, traveler. This is Steppe Ridge. Would you like to rest here?";
response_yes = "You stretch and take a deep breath. You're ready.";
response_no  = "Suit yourself. Be careful out there.";

// 🔍 Find the actual spawn marker instance placed in the room
spawn_marker = instance_find(obj_spawn_marker_SteppeRidge, 0);

// ✅ Only assign label if it exists
if (spawn_marker != noone) {
    spawn_marker.marker_label = "Steppe Ridge";
}
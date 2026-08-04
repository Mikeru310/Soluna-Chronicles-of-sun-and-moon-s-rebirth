         dialogue_stage = 0;
interact = false;
has_talked = false;
dialogue_ended = false;

spawn_location_name = "Gladeheart Village";

welcome_text = "Hello, welcome to Gladeheart Village. Would you like to rest here?";
response_yes = "You feel well rested.";
response_no  = "Very well. Enjoy your visit!";

// 🔍 Find the actual spawn marker instance placed in the room
spawn_marker = instance_find(obj_spawn_marker_gladeheart, 0);

// ✅ Only assign label if it exists
if (spawn_marker != noone) {
    spawn_marker.marker_label = "Gladeheart Village";
}
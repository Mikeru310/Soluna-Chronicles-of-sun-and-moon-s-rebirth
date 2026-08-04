/// Initialize cutscene system
pulse_actor = noone;
pulse_color = c_white;
pulse_alpha = 0;
pulse_speed = 0.05;
pulse_phase = 0;



cutscene_steps = [];
cutscene_index = 0;
cutscene_timer = 0;
active = false;
_fadeAlpha = 0;
if (!variable_global_exists("battle_lost")) global.battle_lost = false;

// --- Detach camera if following a target ---
var cam = view_camera[0];
if (camera_get_view_target(cam) != noone) {
    // store who the camera was following (so we can reattach later)
    old_camera_target = camera_get_view_target(cam);
    camera_set_view_target(cam, noone);
} else {
    old_camera_target = noone;
}
//// If the player just started a new game, start the intro cutscene
if (global.play_intro) {
    instance_create_layer(0, 0, "Instances", obj_cutscene_intro);
    global.play_intro = false; // reset so it doesn’t replay
}
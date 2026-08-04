/// oLight - Create
light_radius = 1000;   // how big the light hole is
light_alpha  = 0;     // 0 = no light, 1 = full light
light_time   = 0;     // frames left to stay fully lit
fade_speed   = 0.01;  // how fast it fades when time runs out


// Define the function for this instance
ActivateLight = function(_duration) {
    light_time  = _duration;
    light_alpha = 1;
};
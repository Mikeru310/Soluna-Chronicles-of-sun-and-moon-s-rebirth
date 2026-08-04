if (variable_instance_exists(id, "_effect_active") && _effect_active) {
    draw_sprite(_effect_sprite, floor(_effect_frame), _effect_x, _effect_y);
}


/// PULSE GLOW (simple version)
if (instance_exists(pulse_actor))
{
    // Update pulse
    if (pulse_phase == 0) {
        pulse_alpha += pulse_speed;
        if (pulse_alpha >= 1) { pulse_alpha = 1; pulse_phase = 1; }
    } else {
        pulse_alpha -= pulse_speed;
        if (pulse_alpha <= 0) { pulse_alpha = 0; pulse_phase = 0; }
    }

    // Draw actor glow
    var sx = pulse_actor.sprite_index;
    var fr = pulse_actor.image_index;
    var xx = pulse_actor.x;
    var yy = pulse_actor.y;

    draw_set_alpha(pulse_alpha * 0.4);
    draw_sprite_ext(sx, fr, xx, yy, 1.1, 1.1, 0, pulse_color, 1);

    draw_set_alpha(1);
}



// ---------------------------------------------------------
// SAFE DRAW FOR DISINTEGRATE EFFECT
// ---------------------------------------------------------

if (active && cutscene_index < array_length(cutscene_steps)) {

    var step = cutscene_steps[cutscene_index];

    if (step.type == "disintegrate actor" && variable_instance_exists(step, "_pixels")) {

        for (var i = 0; i < array_length(step._pixels); i++) {
            var p = step._pixels[i];

            draw_set_color(p.col);
            draw_set_alpha(p.alpha);

            // 3×3 chunky visible particles
            draw_rectangle(p.x, p.y, p.x + 3, p.y + 3, false);
        }

        draw_set_color(c_white);
        draw_set_alpha(1);
    }
}


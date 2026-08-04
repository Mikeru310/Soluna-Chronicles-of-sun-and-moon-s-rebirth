event_inherited();

// Apply debuff tint
if (hp > 0) {
    image_blend = status_get_color(id);
}

if (hp <= 0) {
    // Set sprite to faint animation if not already set
    if (sprite_index != sprites.down) {
        sprite_index = sprites.down;
        image_index = 0;          // start from first frame
        image_speed = 1;          // play the animation once
    }

    // When animation reaches the last frame, freeze it
    if (image_index >= image_number - 1) {
        image_index = image_number - 1;
        image_speed = 0;
    }
}
else {
    // If revived, go back to idle
    if (sprite_index == sprites.down) {
        sprite_index = sprites.idle;
        image_speed = 1;
    }
}

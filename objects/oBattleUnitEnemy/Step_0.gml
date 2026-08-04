event_inherited();

if (hp <= 0) {
    image_blend = c_red;
    image_alpha -= 0.01;
}

else {
    // STATUS COLOR (Burn / Poison / etc)
image_blend = status_get_color(id);
}
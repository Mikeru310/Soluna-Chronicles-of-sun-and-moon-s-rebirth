if (interaction_cooldown > 0) {
    interaction_cooldown -= 1;
}

if (instance_exists(obj_player)) {
    var player_close = point_distance(x, y, obj_player.x, obj_player.y) < 50;

    // Only allow interaction if close, pressed Z, no textbox open, no shop open, cooldown is over
    if (player_close && keyboard_check_pressed(ord("Z")) 
        && !instance_exists(obj_textbox) 
        && !instance_exists(Swamp_shop) 
        && interaction_cooldown <= 0) 
    {
        create_textbox(text_id);
        interaction_cooldown = room_speed; // 1 second cooldown
        shop_created = false; // Reset shop creation flag
    }
    
    // Create shop when textbox closes (add this section)
    if (player_close && !instance_exists(obj_textbox) 
        && interaction_cooldown > 0 
        && !shop_created 
        && !instance_exists(Swamp_shop))
    {
        instance_create_layer(x, y, "Instances", Swamp_shop);
        shop_created = true;
    }
}
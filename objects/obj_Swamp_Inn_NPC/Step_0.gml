

if (interaction_cooldown > 0) {
    interaction_cooldown -= 1;
}

if (instance_exists(obj_player)) {
    var player_close = point_distance(x, y, obj_player.x, obj_player.y) < 15;

    // Only allow interaction if close, pressed Z, no textbox open, no shop open, cooldown is over
    if (player_close && keyboard_check_pressed(ord("Z")) 
        && !instance_exists(obj_textbox) 
        && !instance_exists(obj_shop) 
        && interaction_cooldown <= 0) 
    {
        create_textbox(text_id);
        interaction_cooldown = room_speed; // 1 second cooldown
    }
}

//if (place_meeting(x, y, obj_player)) {
    //// Get collision instance
    //var _player = instance_place(x, y, obj_player);
    //
    //// Move player back to their previous position
    //if (instance_exists(_player)) {
        //_player.x = _player.previous_x;
        //_player.y = _player.previous_y;
    //}
//}
//
//// Update all players' previous positions
//with (obj_player) {
    //previous_x = x;
    //previous_y = y;
//}
 //
// obj_game_controller - Step Event
   if (keyboard_check_pressed(vk_space)) {
           var file = "save.json";
    if (file_exists(file)) {
        file_delete(file);
        show_debug_message("save.json deleted");
    }
       show_debug_message("Controller is alive! Room: " + room_get_name(room));
         show_debug_message("file deleted")
   }
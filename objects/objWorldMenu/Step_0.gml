



hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
if (hover > option_count -1) hover = 0;
         if (hover < 0) hover = option_count-1;
                  //
if  (keyboard_check_pressed(ord("Z"))) {
         if (array_length(option[hover]) == 2) {
                  var _func = option[hover][1];
                  
                  if (_func != -1) _func();
         }
         instance_destroy();
         objGame.menu_open = false;
}


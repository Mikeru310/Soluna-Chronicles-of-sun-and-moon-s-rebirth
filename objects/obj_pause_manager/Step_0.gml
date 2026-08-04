if (keyboard_check_pressed(ord("C"))) {
         if (global.game_state == GAME_STATE.RUNNING) {
                  global.game_state = GAME_STATE.PAUSED;
         }
         
        else {
                if  (global.game_state == GAME_STATE.PAUSED) {
                  global.game_state = GAME_STATE.RUNNING;
         }
}
}

//obj_pause_manager Event: Step at line 8: Assignment operator expected
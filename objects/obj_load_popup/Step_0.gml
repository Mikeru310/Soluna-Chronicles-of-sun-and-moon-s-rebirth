if (keyboard_check_pressed(vk_left))  choice = 0;
if (keyboard_check_pressed(vk_right)) choice = 1;

if (keyboard_check_pressed(ord("Z"))) {
    if (choice == 0) {
        global.force_teleport = true;
        room_goto(global.save_room);
    }
    instance_destroy();
}

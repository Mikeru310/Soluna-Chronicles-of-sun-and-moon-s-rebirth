event_inherited();
path_start(pth_ExpiramentalPath, 1, path_action_reverse, true);

paused = false;
pause_timer = 0;
paused_position = 0;

// Walking sprites
sprite_up = spr_Haru_WALKING_BACK;
sprite_down = spr_Haru_WALKING_FRONT;
sprite_left = spr_Haru_WALKING_L_S_VIEW;
sprite_right = spr_Haru_WALKING_R_S_VIEW;

// Idle sprites
idle_up = spr_Haru_IDLE_BACK;
idle_down = spr_Haru_IDLE_FRONT;
idle_left = spr_Haru_IDLE_L_S_VIEW;
idle_right = spr_Haru_IDLE_R_S_VIEW;

last_x = x;
last_y = y;
last_dir = "down"; // default idle facing direction

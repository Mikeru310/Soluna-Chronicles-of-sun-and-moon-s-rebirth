var _hor = clamp(target_x -x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);

move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap, obj_slime]);






escapeDelay = max(escapeDelay-1, 0);

if (dead == true) 
{
	image_alpha -= 0.05;
	image_blend = c_red;
	if (image_alpha <= 0) instance_destroy();
}


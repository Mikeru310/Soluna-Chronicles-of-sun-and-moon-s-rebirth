image_alpha -= 0.02;
if (vspeed < 0) image_alpha = 1.0;
    if(y > start) vspeed = 0;
        if(image_alpha <= 0) instance_destroy();
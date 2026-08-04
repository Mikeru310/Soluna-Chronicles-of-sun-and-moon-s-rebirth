var spacing = 80;
var start_y = 200;
var start_x = 640 - 100; // center X assuming 200px button width

instance_create_layer(start_x, start_y, "Menu_Buttons", obj_new_game);
instance_create_layer(start_x, start_y + spacing, "Menu_Buttons", obj_load_game);
instance_create_layer(start_x, start_y + spacing * 2, "Menu_Buttons", obj_options);
instance_create_layer(start_x, start_y + spacing * 3, "Menu_Buttons", obj_quit);

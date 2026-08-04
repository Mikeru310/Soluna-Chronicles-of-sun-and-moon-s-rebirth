// C Pressed Event of objMenu
if (!instance_exists(obj_inventory_gui) 
&& !instance_exists(obj_rune_menu) 
&& !instance_exists(objStatView)
&& !instance_exists(obj_textbox)
         && !instance_exists(obj_cutscene)
&& !objGame.menu_open) 
{
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);

    var _menu = [

        ["Inventory", function() { 
            var cam_x = camera_get_view_x(view_camera[0]);
            var cam_y = camera_get_view_y(view_camera[0]);
            instance_create_layer(cam_x + 10, cam_y + 10, "Instances", obj_inventory_gui); 
        }],
    ];

    // ★ Only add Runes if boss 1 is beaten
    if (global.scene5_done) {
        array_push(_menu,
            ["Runes", function() { 
                var cam_x = camera_get_view_x(view_camera[0]);
                var cam_y = camera_get_view_y(view_camera[0]);
                instance_create_layer(cam_x + 10, cam_y + 10, "Instances", obj_rune_menu); 
            }]
        );
    }

    // Add Stats, Quest, Map
    array_push(_menu,
        ["Stats", function() {
            var cam_x = camera_get_view_x(view_camera[0]);
            var cam_y = camera_get_view_y(view_camera[0]);
            instance_create_layer(cam_x + 10, cam_y + 10, "Instances", objStatView); 
        }],

        ["Quest", function() {
            var cam_x = camera_get_view_x(view_camera[0]);
            var cam_y = camera_get_view_y(view_camera[0]);
            instance_create_layer(cam_x + 10, cam_y + 10, "Instances", obj_quest_menu); 
        }],

        ["Map", function() {
            var cam_x = camera_get_view_x(view_camera[0]);
            var cam_y = camera_get_view_y(view_camera[0]);
            instance_create_layer(cam_x + 10, cam_y + 10, "Instances", obj_Map_menu); 
        }]
    );

    // ⭐ NEW OPTION: Quit to Menu
    array_push(_menu,
        ["Quit to Menu", function() {

    // Close pause menu flag
    objGame.menu_open = false;

    // 🔥 FIX: Only destroy player/follower if you're in a gameplay room,
    // NOT when you're already going to the menu.
    if (room != rm_mainmenu1) {
        if (instance_exists(obj_player)) with (obj_player) instance_destroy();
        if (instance_exists(obj_follower)) with (obj_follower) instance_destroy();
        if (instance_exists(obj_Indicator_gui)) with (obj_Indicator_gui) instance_destroy();
    }

    // Go back to main menu
    room_goto(rm_mainmenu1);
}]
    );

    // Create the menu
    WorldMenu(
        cam_x + 10,
        cam_y + 96,
        _menu,
        "Game Paused"
    );

    objGame.menu_open = true;
}

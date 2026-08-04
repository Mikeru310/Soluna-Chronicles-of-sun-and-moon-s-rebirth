/// obj_guide_ui - Step Event

// List of objects or conditions that should hide the guide
var hide =
    instance_exists(obj_textbox)
 || instance_exists(obj_inventory_gui)
 || instance_exists(objStatView)
 || instance_exists(obj_rune_menu)
 || instance_exists(obj_shop)
 || instance_exists(obj_cutscene)
 || (instance_exists(objGame) && objGame.menu_open)
 || instance_exists(objGameOver);

// Update visibility
visible = !hide;

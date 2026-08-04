// === Save path must be defined first ===
global.save_path = "save_data.json";

// === Default values ===
global.saved_x = 0;
global.saved_y = 0;
global.save_room = room;
global.last_saved_label = "";
global.feedback_text = "";
global.feedback_timer = 0;
global.force_teleport = false;

// === Load save data if it exists ===
if (file_exists(global.save_path)) {
    var raw = "";
    var file = file_text_open_read(global.save_path);
    if (file != -1) {
        raw = file_text_read_string(file);
        file_text_close(file);

        var json = json_parse(raw);
        if (json != undefined) {
            if (variable_struct_exists(json, "x")) global.saved_x = json.x;
            if (variable_struct_exists(json, "y")) global.saved_y = json.y;

            if (variable_struct_exists(json, "room")) {
                var room_index = asset_get_index(json.room);
                if (room_exists(room_index)) {
                    global.save_room = room_index;
                }
            }

            if (variable_struct_exists(json, "label")) {
                global.last_saved_label = json.label;
            }
        }
    }
}

persistent = true;

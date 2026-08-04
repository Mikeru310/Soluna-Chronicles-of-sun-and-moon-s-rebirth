if (keyboard_check_pressed(ord("P"))) {
    if (file_exists(global.save_path)) {
        var file = file_text_open_read(global.save_path);
        var raw = file_text_read_string(file);
        file_text_close(file);
        show_debug_message("=== SAVE FILE CONTENT ===");
        show_debug_message(raw);
    } else {
        show_debug_message("Save file not found!");
    }
}

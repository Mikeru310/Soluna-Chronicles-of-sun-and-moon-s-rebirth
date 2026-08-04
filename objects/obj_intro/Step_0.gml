show_time++;

if (show_time > delay) {
    current_line++;
    show_time = 0;

    if (current_line >= array_length(text_lines)) {
        room_goto(SilverLake_chapter1);
    }
}

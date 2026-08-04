if (global.feedback_timer > 0) {
    global.feedback_timer--;
    if (global.feedback_timer == 0) {
        global.feedback_text = "";
    }
}

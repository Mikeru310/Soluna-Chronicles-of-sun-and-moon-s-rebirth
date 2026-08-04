// Wrap the description text to fit within the UI's width
function wrap_text(text, max_width) {
    var result = "";
    var current_line = "";
    var word_array = string_split(text, " ");

    for (var i = 0; i < array_length(word_array); i++) {
        var test_line = current_line + word_array[i] + " ";
        if (string_width(test_line) > max_width) {
            result += current_line + "\n"; // Add line break
            current_line = word_array[i] + " ";
        } else {
            current_line = test_line;
        }
    }

    result += current_line;
    return result;
}

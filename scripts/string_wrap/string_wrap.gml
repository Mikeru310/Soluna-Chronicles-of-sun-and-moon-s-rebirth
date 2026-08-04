/// @function string_wrap(_text, _width, _font)
/// @description Wraps text by width for UI boxes
function string_wrap(_text, _width, _font) {
    if (!font_exists(_font)) return _text;
    draw_set_font(_font);
    
    var result = "";
    var words = string_split(_text, " ");
    var line = "";

    for (var i = 0; i < array_length(words); i++) {
        var test_line = line + words[i] + " ";
        if (string_width(test_line) > _width) {
            result += line + "\n";
            line = words[i] + " ";
        } else {
            line = test_line;
        }
    }
    return result + line;
}

/// @param text
function src_text(_text) {
    // Check if it contains a colon (Name:Message)
    var colonPos = string_pos(":", _text);

    if (colonPos > 0) {
        speaker[page_number] = string_copy(_text, 1, colonPos - 1); // before :
        text[page_number] = string_copy(_text, colonPos + 1, string_length(_text)); // after :
         current_speaker = speaker[page_number];
    } else {
        speaker[page_number] = ""; // no speaker name
        text[page_number] = _text;
    }

    text_length[page_number] = string_length(text[page_number]);
    page_number++;
}










/// @param text_id
function create_textbox(_text_id) {
    
    with (instance_create_depth(0, 0, -9999, obj_textbox)) 
        {
            src_game_text(_text_id);
        }
    
}

/// @param option
/// @param link_id
function src_option(_option, _link_id) {
    option[option_number] = _option;
    option_link_id[option_number] = _link_id;
    
    option_number++;
}







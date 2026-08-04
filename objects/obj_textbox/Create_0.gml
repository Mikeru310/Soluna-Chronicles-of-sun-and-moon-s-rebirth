     

depth = -999999999; // textbox ALWAYS on top
     
 //textbox parameters
textbox_width = 190;
textbox_height = 63;
border = 8; //changed from 0 to 8
line_sep = 12
line_width = textbox_width - border * 2;
     
textbox_callback = undefined;
txtb_spr = spr_UI;
txtb_img = 0;
txtb_img_spd = 1/60;
     
     //the text
page = 0;
text[0] = "";
page_number = 0; 
text[0] = "";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;
     
     //speaker
speaker[0] = "";
current_speaker = "";
     
     //option
option[0] = "";
option_link_id[0] = -1;
option_position = 0;
option_number = 0;
     
setup = false;
punctuation_pause = 0
pause_duration = 30
display_set_gui_size(320, 180);

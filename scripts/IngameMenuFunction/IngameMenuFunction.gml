function WorldMenu(_x, _y, _options, _description = -1){

         with (instance_create_depth(_x,_y, -999, objWorldMenu)) {
                  
                  option = _options;
                  desc = _description;
                  option_count = array_length(_options)
                  hovermarker = "* ";
                  
                  margin = 8;
                  draw_set_font(m3x6);
                  
                  width = 1;
                  
                  if (_description != -1) width = max(width, string_width(_description));
                           for (var i = 0; i < option_count; i++) {
                                    width = max(width, string_width(_options[i][0]));
                           }
                  
                  width += string_width(hovermarker);
                  
                  heightLine = 17;
                  height = heightLine * (option_count + !(desc == -1));
                  
                  widthFull = width + margin * 2;
                  heightFull = height + margin * 2;
                  
                  
         }
         
         
         objGame.menu_open = true;
}
draw_self();

////// ✅ Only show if this marker is the current save location
if (room == global.save_room && x == global.saved_x && y == global.saved_y) {
   draw_set_color(c_lime);
    
    var label = "Spawn Marker";
   if (variable_instance_exists(id, "marker_label")) {
      label = marker_label;
   }
  
 draw_text(x - 16, y - 20, "Last Save: " + label);

}
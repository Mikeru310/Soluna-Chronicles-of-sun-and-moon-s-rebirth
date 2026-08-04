/// DRAW EVENT
if (!instance_exists(parent_npc)) exit;

draw_set_color(c_white);

var spr = parent_npc.sprite_index;
var xo  = sprite_get_xoffset(spr);
var yo  = sprite_get_yoffset(spr);

var world_x = parent_npc.x - xo + (sprite_get_width(spr)/2) + offset_x;
var world_y = parent_npc.y - yo + offset_y;

switch (state) {

    case "available": // yellow
        draw_sprite(mark_quest_marker_quest, 0, world_x, world_y);
    break;

    case "progress":  // blue
        draw_sprite(mark_quest_marker_progress, 0, world_x, world_y);
    break;

    case "done":      // green
        draw_sprite(mark_quest_marker_active, 0, world_x, world_y);
    break;
}

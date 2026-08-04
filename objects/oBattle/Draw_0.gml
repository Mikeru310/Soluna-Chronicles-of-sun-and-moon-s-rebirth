
draw_sprite(battleBackground, 0, x, y);


// ======================================================================
// DRAW UNITS IN DEPTH ORDER
// ======================================================================
var _unitWithCurrentTurn = unitTurnOrder[turn].id;
for (var i = 0; i < array_length(unitRenderOrder); i++)
{
    with (unitRenderOrder[i]) draw_self();
}


// ======================================================================
// LEFT PANELS
// ======================================================================

// Haru box
draw_sprite_stretched(spr_UI, 0, x + 4, y + 14, 70, 60);

// Maya box
draw_sprite_stretched(spr_UI, 0, x + 4, y + 78, 70, 60);


// ======================================================================
// MENU BOX — original stretched
// ======================================================================
var menu_x = x + 65;
var menu_y = y + 100;
var menu_w = 185;
var menu_h = 95;

draw_sprite_stretched(spr_actionsUI, 0, menu_x, menu_y, menu_w, menu_h);

//----------------------------------------------
// RIGHT ENEMY BOX (moves freely)
//----------------------------------------------
var enemy_box_x = x + 200;   // <--- MOVE THIS ONLY
var enemy_box_y = y + 105;
var enemy_box_w = 150;
var enemy_box_h = 80;

draw_sprite_stretched(spr_enemyUI, 0, enemy_box_x, enemy_box_y, enemy_box_w, enemy_box_h);


//----------------------------------------------
// ENEMY TEXT (stays in perfect position)
//----------------------------------------------
draw_set_font(m3x6);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// DO NOT REMOVE "x +"
// DO NOT REMOVE "y +"
var ex = x + 245;    // <--- FINAL PERFECT X
var ey = y + 120;    // <--- FINAL PERFECT Y

var spacing = 16;

for (var i = 0; i < array_length(enemyUnits); i++)
{
    var _enemy = enemyUnits[i];

    if (_enemy.hp > 0)
    {
        draw_set_color(c_black);
        if (_enemy.id == _unitWithCurrentTurn)
            draw_set_color(make_color_rgb(30, 80, 255));

        draw_text(
            ex,
            ey + (i * spacing),
            _enemy.name + ": " + string(_enemy.hp) + "/" + string(_enemy.hpmax)
        );
    }
}



// ======================================================================
// PARTY INFO (HARU + MAYA)
// ======================================================================
for (var i = 0; i < array_length(partyUnits); i++)
{
    var _char = partyUnits[i];

    var box_y = y + 18 + (i * 64);

    // NAME
    draw_set_font(m3x6);
    draw_set_color(c_white);
    if (_char.id == _unitWithCurrentTurn) draw_set_color(c_yellow);
    if (_char.hp <= 0) draw_set_color(c_red);
    draw_set_halign(fa_left);
    draw_text(x + 12, box_y, _char.name);

    // HP
    draw_set_color(c_white);
    if (_char.hp < _char.hpmax * 0.5) draw_set_color(c_orange);
    if (_char.hp <= 0) draw_set_color(c_red);
    draw_text(x + 12, box_y + 12, "HP: " + string(_char.hp) + "/" + string(_char.hpmax));

    // MP
    draw_set_color(c_white);
    if (_char.mp < _char.mpmax * 0.5) draw_set_color(c_orange);
    if (_char.hp <= 0) draw_set_color(c_red);
    draw_text(x + 12, box_y + 24, "MP: " + string(_char.mp) + "/" + string(_char.mpmax));

    // EXP
    draw_set_color(c_white);
    draw_text(x + 12, box_y + 36, "EXP: " + string(_char.currentXp) + "/" + string(_char.xpLevelUp));
}


// ======================================================================
// ACTION HOVER DESCRIPTION
// ======================================================================
if (show_hover_description && hover_description != "")
{
    draw_set_font(m3x6_smaller);
    var _txt = hover_description;
    var _tw = string_width(_txt) + 20;

    var _tx = x + 160 - (_tw * 0.5);
    var _ty = y + 92;

    draw_sprite_stretched(spr_UI, 0, _tx, _ty, _tw, 22);

    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(x + 160, _ty + 4, _txt);
}


// ======================================================================
// TARGET CURSOR
// ======================================================================
if (cursor.active)
{
    with (cursor)
    {
        if (activeTarget != noone)
        {
            if (!is_array(activeTarget))
            {
                draw_sprite(spr_pointer, 0, activeTarget.x, activeTarget.y);
            }
            else
            {
                draw_set_alpha(sin(get_timer()/50000) + 1);
                for (var i = 0; i < array_length(activeTarget); i++)
                {
                    draw_sprite(spr_pointer, 0, activeTarget[i].x, activeTarget[i].y);
                }
                draw_set_alpha(1);
            }
        }
    }
}


// ======================================================================
// MAIN BATTLE TEXT
// ======================================================================
if (battleText != "")
{
    var _w = string_width(battleText) + 20;

    draw_sprite_stretched(spr_UI, 0, x + 160 - (_w*0.5), y + 2, _w, 22);

    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(x + 160, y + 6, battleText);
}


// ======================================================================
// TUTORIAL TEXT
// ======================================================================
if (show_tutorial_text && tutorial_text != "")
{
    draw_set_font(m3x6_smaller);

    var _tw = string_width(tutorial_text) + 20;
    var _tx = x + 160 - (_tw * 0.5);

    draw_sprite_stretched(spr_UI, 0, _tx, y + 150, _tw, 22);

    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(x + 160, y + 155, tutorial_text);
}


// ======================================================================
// *** NEW: FADE OVERLAY (MUST BE LAST) ***
// ======================================================================
if (battle_fade_alpha > 0)
{
    draw_set_color(c_black);
    draw_set_alpha(battle_fade_alpha);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
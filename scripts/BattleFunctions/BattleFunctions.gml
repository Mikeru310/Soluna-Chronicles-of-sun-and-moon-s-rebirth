function NewEncounter(_enemies, _bg, _tutorial) {
    instance_create_depth(
        camera_get_view_x(view_camera[0]),
        camera_get_view_y(view_camera[0]),
        -9999,
        oBattle,
        {
            enemies: _enemies,
            creator: id,
            battleBackground: _bg,
            tutorialMode: (_tutorial ?? false)
        }
    );
}

function mutate_lucian_hp() {
    global.enemies.Lucian_The_Herald.hpmax += global.party[0].hp;
    global.enemies.Lucian_The_Herald.hp = global.enemies.Lucian_The_Herald.hpmax;
}

function mutate_haru_hp() {
    global.party[0].hpmax += 10*global.party[0].level;
}







//hp change or damage indicator for oBattleFloatingText
function BattleChangeHP(_target, _amount, _AliveDeadOrEither = 0, _customColor = -1) {
    var _failed = false;

    if ((_AliveDeadOrEither == 0) && (_target.hp <= 0)) _failed = true;
    if ((_AliveDeadOrEither == 1) && (_target.hp > 0)) _failed = true;

    // Default color setup
    var _col = c_white;
    if (_amount > 0) _col = c_lime;
    if (_amount < 0) _col = c_white;

    // Override if custom color is passed
    if (_customColor != -1) {
        _col = _customColor;
    }
         
    // Cure text
    if (_amount == 0 && _customColor != -1) {
        _amount = "cured";
    }

    // Show "failed" text if target is invalid
    if (_failed) {
        _col = c_white;
        _amount = "failed";
    }

    // Create floating text
    instance_create_depth(
        _target.x,
        _target.y, 
        _target.depth - 1,
        oBattleFloatingText,
        {
            font: m3x6,
            col: _col,
            text: string(_amount)
        }
    );

    // ⛔ PREVENT STRING FROM ENTERING HP MATH
    if (is_string(_amount)) {
        return;
    }

    // Apply HP change
    if (!_failed) {
        _target.hp = clamp(_target.hp + _amount, 0, _target.hpmax);
    }
}




function BattleChangeMP(_target, _amount, _show = false)
{
         if (_show) instance_create_depth(_target.x,_target.y,_target.depth-1, oBattleFloatingText, {font: m3x6, col: c_aqua, text: string(_amount) + "mp"})
         _target.mp = clamp(_target.mp + _amount, 0, _target.mpmax);
}





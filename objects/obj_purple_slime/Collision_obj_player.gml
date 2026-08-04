if (escapeDelay == 0) && (!dead)
{
    var _enemies = encounter_data;
    var _bg = encounter_bg;

    // ✅ If nothing set (or left as default), use fallback
    if (_enemies == noone) {
        _enemies = [global.enemies.purple_slime, global.enemies.purple_slime];
    }

    if (_bg < 0) {
        _bg = bg_grasslandsBattle;
    }

    NewEncounter(_enemies, _bg);
    instance_destroy();
}

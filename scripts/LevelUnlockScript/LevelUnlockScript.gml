/// @function scr_check_magic_unlocks(_unit)
/// @desc Checks and unlocks spells based on level + allowed character.
/// @param _unit The party unit struct.

function scr_check_magic_unlocks(_unit) {
    var _actionKeys = variable_struct_get_names(global.actionLibrary);

    for (var i = 0; i < array_length(_actionKeys); i++) {
        var _key = _actionKeys[i];
        var _action = global.actionLibrary[$ _key];

        // Validate the struct and level unlock field
        if (is_struct(_action) && variable_struct_exists(_action, "lvlUnlock")) {
            var _requiredLevel = _action.lvlUnlock;

            // ✅ Check if this unit is allowed to learn the skill
            if (variable_struct_exists(_action, "user")) {
                var allowedUser = _action.user;

                // Skip if this skill isn't meant for this unit
                if (allowedUser != "Both" && allowedUser != "All" && allowedUser != _unit.name) {
                    continue;
                }
            }

            // Check if unit's level meets the requirement
            if (_unit.level >= _requiredLevel) {

                // Ensure the actions array exists
                if (!is_array(_unit.actions)) _unit.actions = [];

                // Check if already learned
                var alreadyHas = false;
                for (var j = 0; j < array_length(_unit.actions); j++) {
                    var a = _unit.actions[j];
                    if (is_struct(a) && variable_struct_exists(a, "name")) {
                        if (a.name == _action.name) {
                            alreadyHas = true;
                            break;
                        }
                    }
                }

                // Unlock if not already known
                if (!alreadyHas) {
                    array_push(_unit.actions, _action);
                    show_debug_message(_unit.name + " learned new skill: " + _action.name + "!");

                    if (variable_instance_exists(oBattle, "battleEndMessages")) {
                        array_push(oBattle.battleEndMessages, _unit.name + " learned " + _action.name + "!");
                    }
                }
            }
        }
    }
}
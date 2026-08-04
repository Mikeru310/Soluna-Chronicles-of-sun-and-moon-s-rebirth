function save_game_json() {
    // ⭐ DEBUG: Check gold before saving
    show_debug_message("=== SAVE DEBUG ===");
    show_debug_message("global.gold exists: " + string(variable_global_exists("gold")));
    show_debug_message("global.gold value: " + string(global.gold));
    
    if (!variable_global_exists("chests_opened")) global.chests_opened = [];
    if (!variable_global_exists("cutscenes_played")) global.cutscenes_played = [];
    if (!variable_global_exists("follower_unlocked")) global.follower_unlocked = false;
    if (!variable_global_exists("follower_present")) global.follower_present = false;

    // Rune safety
    if (!variable_global_exists("haru_runes")) global.haru_runes = [0, 0, 0];
    if (!variable_global_exists("maya_runes")) global.maya_runes = [0, 0, 0];

    // Boss array safety
    if (!variable_global_exists("bosses")) global.bosses = [false, false, false, false];

    // Gold safety
    if (!variable_global_exists("gold")) {
        show_debug_message("⚠️ WARNING: global.gold didn't exist, initializing to 0");
        global.gold = 0;
    }

    var save = {
        x: obj_player.x,
        y: obj_player.y,
        room: room,

        inventory: [],
        party: [],

        // ⭐ Save gold
        gold: global.gold,

        chests_opened: global.chests_opened,
        cutscenes_played: global.cutscenes_played,

        follower_unlocked: global.follower_unlocked,
        follower_present: instance_exists(obj_follower),

        haru_runes: global.haru_runes,
        maya_runes: global.maya_runes,

        bosses: global.bosses,

        // ⭐ NEW: Save rune menu unlock
        scene5_done: variable_global_exists("scene5_done") ? global.scene5_done : false
    };

    // --- Save Inventory ---
    var inv_len = array_length(global.inventory);
    for (var i = 0; i < inv_len; i++) {
        var entry = global.inventory[i];
        var item_struct = entry[0];
        var amount = entry[1];

        var item_key = "";
        var names = variable_struct_get_names(global.items);
        for (var n = 0; n < array_length(names); n++) {
            var nm = names[n];
            if (variable_struct_get(global.items, nm) == item_struct) {
                item_key = nm;
                break;
            }
        }
        if (item_key == "") item_key = string(item_struct.name);

        array_push(save.inventory, {
            key: item_key,
            amount: amount
        });
    }

    // --- Save Party ---
    var party_len = array_length(global.party);
    for (var i = 0; i < party_len; i++) {
        var member = global.party[i];

        var action_names = [];
        var action_keys = variable_struct_get_names(global.actionLibrary);

        for (var a = 0; a < array_length(member.actions); a++) {
            var act = member.actions[a];
            var key_found = "";

            for (var k = 0; k < array_length(action_keys); k++) {
                var key = action_keys[k];
                if (variable_struct_get(global.actionLibrary, key) == act) {
                    key_found = key;
                    break;
                }
            }

            if (key_found == "") key_found = "unknown_action";
            array_push(action_names, key_found);
        }

        array_push(save.party, {
            name: member.name,
            hp: member.hp,
            hpmax: member.hpmax,
            mp: member.mp,
            mpmax: member.mpmax,
            strength: member.strength,
            level: member.level,
            currentXp: member.currentXp,
            xpLevelUp: member.xpLevelUp,
            actions: action_names
        });
    }

    // ==========================================================
    // ⭐⭐⭐ QUEST SYSTEM SAVE ⭐⭐⭐
    // ==========================================================

    var quest_flag_names = [
        "side_quest_0_requested","side_quest_0_started","side_quest_0_complete",
        "side_quest_0_item_found","side_quest_0_receiver_hint_given","side_quest_0_given",

        "side_quest_1_requested","side_quest_1_started","side_quest_1_complete",
        "side_quest_1_item_found","side_quest_1_receiver_hint_given","side_quest_1_given",

        "side_quest_2_requested","side_quest_2_started","side_quest_2_complete",
        "side_quest_2_item_found","side_quest_2_given",

        "side_quest_3_requested","side_quest_3_started","side_quest_3_complete",
        "side_quest_3_item_found","side_quest_3_given",

        "side_quest_4_requested","side_quest_4_started","side_quest_4_complete",
        "side_quest_4_item_found","side_quest_4_given",

        "side_quest_5_requested","side_quest_5_started","side_quest_5_complete",
        "side_quest_5_item_found","side_quest_5_given",

        "side_quest_6_requested","side_quest_6_started","side_quest_6_complete",
        "side_quest_6_item_found","side_quest_6_given",

        "side_quest_7_requested","side_quest_7_started","side_quest_7_complete",
        "side_quest_7_item_found","side_quest_7_given"
    ];

    save.quest_flags = {};

    for (var q = 0; q < array_length(quest_flag_names); q++) {
        var name = quest_flag_names[q];
        variable_struct_set(save.quest_flags, name, variable_global_get(name));
    }

    // Save quest data
    save.quest_data = [];

    if (variable_global_exists("quest_data") && is_array(global.quest_data)) {
        for (var i = 0; i < array_length(global.quest_data); i++) {
            var src = global.quest_data[i];
            if (is_undefined(src) || src == 0) continue;

            if (!ds_exists(src, ds_type_map)) {
                array_push(save.quest_data, src);
                continue;
            }

            var dst = {};
            var key = ds_map_find_first(src);
            while (!is_undefined(key)) {
                variable_struct_set(dst, key, src[? key]);
                key = ds_map_find_next(src, key);
            }
            array_push(save.quest_data, dst);
        }
    }

    // --- Write file ---
    var json_string = json_stringify(save);

    var file = file_text_open_write("save.json");
    file_text_write_string(file, json_string);
    file_text_close(file);

    show_debug_message("=== SAVE COMPLETE ===");
    //show_message("JSON Save Complete!");
}

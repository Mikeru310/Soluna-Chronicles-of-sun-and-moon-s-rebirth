function load_game_json() {
    if (!file_exists("save.json")) {
        show_message("Save file not found.");
        return;
    }

    var file = file_text_open_read("save.json");
    var json_data = file_text_read_string(file);
    file_text_close(file);
    
    var data = json_parse(json_data);

    show_debug_message("=== LOAD DEBUG ===");

    global.load_x = data.x;
    global.load_y = data.y;
    global.load_room = data.room;

    // --- Load Inventory ---
    global.inventory = [];
    for (var i = 0; i < array_length(data.inventory); i++) {
        var entry = data.inventory[i];
        var item_key = entry.key;
        var amount = entry.amount;

        if (variable_struct_exists(global.items, item_key)) {
            var item_struct = variable_struct_get(global.items, item_key);
            array_push(global.inventory, [item_struct, amount]);
        } else {
            var placeholder = {
                name: item_key,
                description: "Unknown item",
                sprite: noone,
                func: function() {}
            };
            array_push(global.inventory, [placeholder, amount]);
        }
    }

    // --- Load Party ---
    if (variable_struct_exists(data, "party")) {
        for (var i = 0; i < array_length(data.party); i++) {
            if (i < array_length(global.party)) {
                var loaded = data.party[i];
                var member = global.party[i];

                member.hp        = loaded.hp;
                member.hpmax     = loaded.hpmax;
                member.mp        = loaded.mp;
                member.mpmax     = loaded.mpmax;
                member.strength  = loaded.strength;
                member.level     = loaded.level;
                member.currentXp = loaded.currentXp;
                member.xpLevelUp = loaded.xpLevelUp;

                member.actions = [];
                for (var a = 0; a < array_length(loaded.actions); a++) {
                    var act_name = loaded.actions[a];
                    if (variable_struct_exists(global.actionLibrary, act_name)) {
                        array_push(member.actions, variable_struct_get(global.actionLibrary, act_name));
                    }
                }
            }
        }
    }

    // --- Load chests & cutscenes ---
    global.chests_opened   = variable_struct_exists(data, "chests_opened")   ? data.chests_opened   : [];
    global.cutscenes_played = variable_struct_exists(data, "cutscenes_played") ? data.cutscenes_played : [];

    // --- Load gold ---
    if (!variable_global_exists("gold")) global.gold = 0;
    global.gold = variable_struct_exists(data, "gold") ? data.gold : 0;

    // --- Load other flags ---
    global.follower_unlocked = variable_struct_exists(data, "follower_unlocked") ? data.follower_unlocked : false;
    global.follower_present  = variable_struct_exists(data, "follower_present")  ? data.follower_present  : false;

    global.haru_runes = variable_struct_exists(data, "haru_runes") ? data.haru_runes : [0,0,0];
    global.maya_runes = variable_struct_exists(data, "maya_runes") ? data.maya_runes : [0,0,0];

    global.bosses = variable_struct_exists(data, "bosses") ? data.bosses : [false,false,false,false];

    // ⭐ RESTORE SCENE 5 FLAG
    if (variable_struct_exists(data, "scene5_done")) {
        global.scene5_done = data.scene5_done;
    } else {
        // fallback: check if cutscene listed
        global.scene5_done = false;
        for (var i = 0; i < array_length(global.cutscenes_played); i++) {
            if (global.cutscenes_played[i] == "scene 5") {
                global.scene5_done = true;
                break;
            }
        }
    }
    show_debug_message("scene5_done after load: " + string(global.scene5_done));

    // --- Spawn player ---
    if (!instance_exists(obj_player)) {
        instance_create_depth(global.load_x, global.load_y, 0, obj_player);
    } else {
        var inst = instance_find(obj_player, 0);
        inst.x = global.load_x;
        inst.y = global.load_y;
    }

    // --- Load Quest Flags ---
    if (variable_struct_exists(data, "quest_flags")) {
        var keys = variable_struct_get_names(data.quest_flags);
        for (var i = 0; i < array_length(keys); i++) {
            var k = keys[i];
            variable_global_set(k, data.quest_flags[$ k]);
        }
    }

    // --- Load Quest Data ---
    global.quest_data = [];

    if (variable_struct_exists(data, "quest_data")) {
        var qd = data.quest_data;

        for (var i = 0; i < array_length(qd); i++) {
            var src = qd[i];
            if (!is_struct(src)) continue;

            var m = ds_map_create();
            var keys = variable_struct_get_names(src);

            for (var j = 0; j < array_length(keys); j++) {
                var key = keys[j];
                ds_map_add(m, key, src[$ key]);
            }

            array_push(global.quest_data, m);
        }
    }

    if (array_length(global.quest_data) == 0) {
        if (script_exists(scr_rebuild_quests)) {
            scr_rebuild_quests();
        } else {
            global.quest_data = [];
        }
    }

    show_debug_message("=== LOAD COMPLETE ===");
    room_goto(global.load_room);
}

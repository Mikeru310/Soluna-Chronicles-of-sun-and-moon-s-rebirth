function reset_game_progress() {
    show_debug_message("=== RESETTING GAME PROGRESS ===");

    // =====================================================
    // BASIC WORLD RESET
    // =====================================================

    // Clear inventory
    global.inventory = [
        [global.items.small_potion, 1]
    ];

    // Reset gold
    global.gold = 0;

    // Reset chests and cutscenes
    global.chests_opened = [];
    global.cutscenes_played = [];

    //NOTE:
    //scene 5, follower unlock and follower present
    //Gold value to 0 if you want reset to 0  
    //false if you want to new game
    
    
    // Scene 5 reset
    global.scene5_done = false;

    // =====================================================
    // FOLLOWER RESET
    // =====================================================
    global.follower_unlocked = false;
    global.follower_present  = false;

    if (instance_exists(obj_follower)) {
        instance_destroy(obj_follower);
    }

    // =====================================================
    // RUNE RESET
    // =====================================================
    global.haru_runes = [0, 0, 0];
    global.maya_runes = [0, 0, 0];

    // =====================================================
    // RESET BOSSES
    // =====================================================
    global.bosses = [false, false, false, false];

    // =====================================================
    // QUEST FLAG RESET
    // =====================================================
    var quest_flags = [
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

    for (var i = 0; i < array_length(quest_flags); i++) {
        variable_global_set(quest_flags[i], false);
    }

    // =====================================================
    // QUEST DATA (MAPS)
    // =====================================================

    if (variable_global_exists("quest_data") && is_array(global.quest_data)) {
        for (var i = 0; i < array_length(global.quest_data); i++) {
            var entry = global.quest_data[i];
            if (ds_exists(entry, ds_type_map)) {
                ds_map_destroy(entry);
            }
        }
    }
    global.quest_data = [];

    // =====================================================
    // ⭐ RESET PARTY STATS (HARU & MAYA)
    // =====================================================
    global.party = [
        {
            name: "Haru",
            hp: 15,
            hpmax: 15,
            mp: 5,
            mpmax: 5,
            strength: 4,
            level: 1,
            currentXp: 7,
            xpLevelUp: scr_get_xp_required("Haru", 1),

            debuffs: [],
            sprites: {
                idle: battle_haru,
                attack: battle_haru,
                defend: battle_haru,
                cast: battle_haru,
                down: fainted_haru
            },

            actions: [
                global.actionLibrary.attack,
                global.actionLibrary.escape
            ]
        },

        {
            name: "Maya",
            hp: 10,
            hpmax: 10,
            mp: 20,
            mpmax: 20,
            strength: 2,
            level: 1,
            currentXp: 0,
            xpLevelUp: scr_get_xp_required("Maya", 1),

            debuffs: [],
            sprites: {
                idle: battle_maya,
                attack: battle_maya,
                defend: battle_maya,
                cast: battle_maya,
                down: faint_maya
            },

            actions: [
                global.actionLibrary.attack,
                global.actionLibrary.purify,
                global.actionLibrary.escape
            ]
        }
    ];

    // =====================================================
    // DONE
    // =====================================================
    show_debug_message("=== PROGRESS RESET COMPLETE ===");
    //show_message("Game progress has been reset!");
}




// Alternative: Reset progress but keep the save file updated
function reset_and_save() {
    reset_game_progress();
    save_game_json(); // Save the reset state
}
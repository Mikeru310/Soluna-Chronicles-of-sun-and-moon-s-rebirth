/// obj_quest_controller — Create Event
persistent = true;

// === Force GUI size once (initially) ===
display_set_gui_size(320, 180);
global.gui_ready = true;

// === Quest Globals ===
global.quest_initialized = true;

// --- Data containers ---
// Only create quest_data if it does NOT exist OR is invalid
if (!variable_global_exists("quest_data") || !is_array(global.quest_data)) {
    global.quest_data = [];
}

if (!variable_global_exists("quest_completed")) global.quest_completed = [];
if (!variable_global_exists("active_quest")) global.active_quest = -1;

if (!variable_global_exists("side_quest_data")) global.side_quest_data = [];
if (!variable_global_exists("craft_quest_data")) global.craft_quest_data = [];
if (!variable_global_exists("side_quest_2_progress")) global.side_quest_2_progress = 0;
if (!variable_global_exists("side_quest_2_total")) global.side_quest_2_total = 2;

// --- Dialogue State ---
dialogue_state = {
    active: false,
    lines: [],
    index: 0,
    draw_char: 0,
    timer: 0,
    speed: 2,
    options: [],
    option_index: 0
};

// --- Quest Flags Map ---
if (!variable_global_exists("quest_flags"))
    global.quest_flags = ds_map_create();


// =============================
//   MAIN QUEST GLOBAL FLAGS
// =============================
if (!variable_global_exists("side_quest_0_requested"))
    global.side_quest_0_requested = false;

if (!variable_global_exists("side_quest_0_started"))
    global.side_quest_0_started = false;

if (!variable_global_exists("side_quest_0_complete"))
    global.side_quest_0_complete = false;

if (!variable_global_exists("side_quest_0_item_found"))
    global.side_quest_0_item_found = false;

if (!variable_global_exists("side_quest_0_receiver_hint_given"))
    global.side_quest_0_receiver_hint_given = false;

if (!variable_global_exists("side_quest_0_given"))
    global.side_quest_0_given = false;


// =============================
//   SIDE QUEST 1 GLOBAL FLAGS
// =============================
if (!variable_global_exists("side_quest_1_requested"))
    global.side_quest_1_requested = false;

if (!variable_global_exists("side_quest_1_started"))
    global.side_quest_1_started = false;

if (!variable_global_exists("side_quest_1_complete"))
    global.side_quest_1_complete = false;

if (!variable_global_exists("side_quest_1_item_found"))
    global.side_quest_1_item_found = false;

if (!variable_global_exists("side_quest_1_receiver_hint_given"))
    global.side_quest_1_receiver_hint_given = false;

if (!variable_global_exists("side_quest_1_given"))
    global.side_quest_1_given = false;


if (!variable_global_exists("side_quest_2_requested")) global.side_quest_2_requested = false;
if (!variable_global_exists("side_quest_2_started")) global.side_quest_2_started = false;
if (!variable_global_exists("side_quest_2_complete")) global.side_quest_2_complete = false;
if (!variable_global_exists("side_quest_2_item_found")) global.side_quest_2_item_found = false;
if (!variable_global_exists("side_quest_2_given")) global.side_quest_2_given = false;

if (!variable_global_exists("side_quest_3_requested")) global.side_quest_3_requested = false;
if (!variable_global_exists("side_quest_3_started")) global.side_quest_3_started = false;
if (!variable_global_exists("side_quest_3_complete")) global.side_quest_3_complete = false;
if (!variable_global_exists("side_quest_3_item_found")) global.side_quest_3_item_found = false;
if (!variable_global_exists("side_quest_3_given")) global.side_quest_3_given = false;

if (!variable_global_exists("side_quest_4_requested")) global.side_quest_4_requested = false;
if (!variable_global_exists("side_quest_4_started")) global.side_quest_4_started = false;
if (!variable_global_exists("side_quest_4_complete")) global.side_quest_4_complete = false;
if (!variable_global_exists("side_quest_4_item_found")) global.side_quest_4_item_found = false;
if (!variable_global_exists("side_quest_4_given")) global.side_quest_4_given = false;

if (!variable_global_exists("side_quest_5_requested")) global.side_quest_5_requested = false;
if (!variable_global_exists("side_quest_5_started")) global.side_quest_5_started = false;
if (!variable_global_exists("side_quest_5_complete")) global.side_quest_5_complete = false;
if (!variable_global_exists("side_quest_5_item_found")) global.side_quest_5_item_found = false;
if (!variable_global_exists("side_quest_5_given")) global.side_quest_5_given = false;

if (!variable_global_exists("side_quest_6_requested")) global.side_quest_6_requested = false;
if (!variable_global_exists("side_quest_6_started")) global.side_quest_6_started = false;
if (!variable_global_exists("side_quest_6_complete")) global.side_quest_6_complete = false;
if (!variable_global_exists("side_quest_6_item_found")) global.side_quest_6_item_found = false;
if (!variable_global_exists("side_quest_6_given")) global.side_quest_6_given = false;


if (!variable_global_exists("side_quest_7_requested")) global.side_quest_7_requested = false;
if (!variable_global_exists("side_quest_7_started")) global.side_quest_7_started = false;
if (!variable_global_exists("side_quest_7_complete")) global.side_quest_7_complete = false;
if (!variable_global_exists("side_quest_7_item_found")) global.side_quest_7_item_found = false;
if (!variable_global_exists("side_quest_7_given")) global.side_quest_7_given = false;

// Ensure popup object exists
if (!instance_exists(obj_quest_popup))
    instance_create_layer(0, 0, "Instances", obj_quest_popup);

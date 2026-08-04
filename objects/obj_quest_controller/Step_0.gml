/// obj_quest_controller — Step Event

// --- Keep GUI size stable ---
if (display_get_gui_width() != 320 || display_get_gui_height() != 180) {
    display_set_gui_size(320, 180);
}

// === Spawn the lost item chest ONLY if:
//
// 1) Quest started
// 2) Item not found
// 3) We are INSIDE rm_FOREST_ACT_1_1
// 4) The item doesn't already exist
//
if (global.side_quest_0_started 
    && !global.side_quest_0_item_found 
    && room == rm_FOREST_ACT_1_1)   // 🔥 Only spawn in this room
{
    if (!instance_exists(obj_side0_receiver)) {
        instance_create_layer(880, 400, "Instances", obj_side0_receiver);
    }
}


// === Spawn SIDE QUEST 1 item (Lost Beekeeper's Jar)
// Only if quest started, item not found, and we are in the correct room
if (global.side_quest_1_started
    && !global.side_quest_1_item_found
    && room == rm_FOREST_ACT_1_1)   // 🔥 change if needed
{
    if (!instance_exists(obj_side1_receiver)) {
        instance_create_layer(110, 330, "Instances", obj_side1_receiver);
    }
}


// === Spawn SIDE QUEST 2 item (Herbalist’s Fern Sample)
// Only if quest started, item not found, and we are in the correct room
if (global.side_quest_2_started
    && !global.side_quest_2_item_found
    && room == rm_Plain_Area_2_UPDATED)   // 🔥 change if needed
{
    if (!instance_exists(obj_side2_reciever)) {
        instance_create_layer(240, 1130, "Instances", obj_side2_reciever);
    }
}

// === Spawn SIDE QUEST 3 item (Merchant's Lost Parcel)
// Only if quest started, item not found, and we are in the correct room
if (global.side_quest_3_started
    && !global.side_quest_3_item_found
    && room == rm_Plain_Area_1_UPDATED)   // 🔥 change to the correct room!
{
    if (!instance_exists(obj_side3_reciever)) {
        instance_create_layer(1040, 175, "Instances", obj_side3_reciever);
    }
}

// === Spawn SIDE QUEST 4 item (Herder's Wooden Flute)
// Only if quest started, item not found, and we are in the correct room
if (global.side_quest_4_started
    && !global.side_quest_4_item_found
    && room == rm_Swamp_Area_2_UPDATED)     // 🔥 Change to your actual trail room!
{
    if (!instance_exists(obj_side4_receiver)) {
        instance_create_layer(50, 460, "Instances", obj_side4_receiver);
    }
}

// === Spawn SIDE QUEST 5 item (Neher's Wife's Ring)
// Only if quest started, item not found, and we are in the correct room
if (global.side_quest_5_started
    && !global.side_quest_5_item_found
    && room == rm_Swamp_Area_3_UPDATED)   // 🔥 UPDATE to your real room name
{
    if (!instance_exists(obj_side5_receiver)) {
        instance_create_layer(465, 915, "Instances", obj_side5_receiver);
    }
}

// === Spawn SIDE QUEST 6 item (Captain's Sword)
// Only if quest started, item not found, and in the correct room
if (global.side_quest_6_started
    && !global.side_quest_6_item_found
    && room == rm_Mountain_Area_1_UPDATED)   // 🔥 Replace with your actual room name
{
    if (!instance_exists(obj_side6_receiver)) {
        instance_create_layer(850, 205, "Instances", obj_side6_receiver);
    }
}

// === Spawn SIDE QUEST 7 item (Commander's Flag)
// Only if quest started, item not found, and we are in the correct room
if (global.side_quest_7_started
    && !global.side_quest_7_item_found
    && room == rm_Mountain_Area_3_UPDATED)   // 🔥 Replace with your actual Area 3 room name
{
    if (!instance_exists(obj_side7_receiver)) {
        instance_create_layer(270, 880, "Instances", obj_side7_receiver);
    }
}


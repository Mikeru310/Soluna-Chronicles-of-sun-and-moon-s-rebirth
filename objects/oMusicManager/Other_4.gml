// =====================================================
// oMusicSystem - ROOM START EVENT
// Handles music transitions between rooms
// =====================================================

// Don't play music during battles
if (global.in_battle) {
    exit;
}

// Determine which music should play based on room
var target_music = noone;

switch (room) {
    // Startup sequence - both use same menu music
    case rm_mainmenu1:
        target_music = global.music_menu;
        break;
    
         case rm_Forest_Shop_Interior_UPDATED:
                  case rm_Plain_Shop_Interior_UPDATED:
                  target_music = shop_music;
                           break;

    
    // ═══════════════════════════════════════════════════════
    // FOREST - ACT 1 (OUTDOOR)
    // ═══════════════════════════════════════════════════════
    case rm_FOREST_ACT_1_1:
    case rm_FOREST_ACT_1_2_UPDATED:
    case rm_FOREST_ACT_1_3_UPDATED:
        target_music = global.music_forest;
        break;
    
    // ═══════════════════════════════════════════════════════
    // FOREST - INTERIORS (Inn, Shop, NPC Houses)
    // ═══════════════════════════════════════════════════════
    case rm_Forest_Inn_Interior_UPDATED:
    case rm_Forest_NPC_Interior_UPDATED:
    
        target_music = global.music_interior;
        break;
    
    // ═══════════════════════════════════════════════════════
    // CAVE 
    // ═══════════════════════════════════════════════════════
    case rm_FOREST_1_4_CAVE:
    case rm_FOREST_1_4_CAVE_TREASUREROOM:
    case rm_FOREST_1_4_CAVE_BOSSROOM:
        target_music = global.music_cave;
        break;        
        
    // ═══════════════════════════════════════════════════════
    // PLAINS - ACT 2 (OUTDOOR)
    // ═══════════════════════════════════════════════════════
    case rm_Plain_Area_1_UPDATED:
    case rm_Plain_Area_2_UPDATED:
    case rm_Plain_Area_3_UPDATED:
    case rm_Plain_Area_4_UPDATED:
        target_music = global.music_plain;
        break;
    
    // ═══════════════════════════════════════════════════════
    // PLAINS - INTERIORS (Inn, Shop, NPC Houses)
    // ═══════════════════════════════════════════════════════
    case rm_Plain_Inn_Interior_UPDATED:
    case rm_Plain_NPC_Interior_UPDATED_1:
    case rm_Plain_NPC_Interior_UPDATED_2:
    case rm_Plain_NPC_Interior_UPDATED_3:
    case rm_Plain_NPC_Interior_UPDATED_4:
    case rm_Plain_NPC_Interior_UPDATED_5:
    case rm_Plain_NPC_Interior_UPDATED_6:
    case rm_Plain_NPC_Interior_UPDATED_7:
    case rm_Plain_NPC_Interior_UPDATED_8:
    case rm_Plain_NPC_Interior_UPDATED_9:
   
        target_music = global.music_interior;
        break;
        
    // ═══════════════════════════════════════════════════════
    // SWAMP - ACT 3 (OUTDOOR)
    // ═══════════════════════════════════════════════════════
    case rm_Swamp_Area_1_UPDATED:
    case rm_Swamp_Area_2_UPDATED:
    case rm_Swamp_Area_3_UPDATED:
    case rm_Swamp_Area_4_UPDATED:
        target_music = global.music_swamp;
        break;
    
    // ═══════════════════════════════════════════════════════
    // SWAMP - INTERIORS (Inn, Shop, NPC Houses)
    // ═══════════════════════════════════════════════════════
    case rm_Swamp_Inn_Interior_UPDATED:
    case rm_Swamp_NPC_Interior_UPDATED_1:
    case rm_Swamp_NPC_Interior_UPDATED_2:
    case rm_Swamp_NPC_Interior_UPDATED_3:
    case rm_Swamp_NPC_Interior_UPDATED_4:
 
        target_music = global.music_interior;
        break;
        
    // ═══════════════════════════════════════════════════════
    // MOUNTAIN - ACT 4 (OUTDOOR)
    // ═══════════════════════════════════════════════════════
    case rm_Mountain_Area_1_UPDATED:
    case rm_Mountain_Area_2_UPDATED:
    case rm_Mountain_Area_3_UPDATED:
    case rm_Mountain_Area_4_UPDATED:
        target_music = global.music_mountain;
        break;
    
    // ═══════════════════════════════════════════════════════
    // MOUNTAIN - INTERIORS (Inn)
    // ═══════════════════════════════════════════════════════
    case rm_Mountain_Inn_Interior_UPDATED:
        target_music = global.music_interior;
        break;
        
    default:
        // If no specific music, keep current music playing
        exit;
}

// Only change music if it's different from what's currently playing
if (target_music != global.current_music) {
    // Stop current music
    if (audio_is_playing(global.music_id)) {
        audio_stop_sound(global.music_id);
    }
    
    // Play new music
    global.previous_music = global.current_music;
    global.current_music = target_music;
    global.music_id = audio_play_sound(target_music, 1, true);
    audio_sound_gain(global.music_id, global.music_volume * global.master_volume, 0);
    
    show_debug_message("Room Start: Playing music for " + room_get_name(room));
}
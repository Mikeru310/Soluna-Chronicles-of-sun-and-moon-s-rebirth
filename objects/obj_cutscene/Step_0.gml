
// 🔥 ABORT CUTSCENE IF PLAYER LOST THE BATTLE
if (global.battle_lost)
{
    active = false;

    // Restore camera so it doesn't get stuck
    if (instance_exists(obj_player)) {
        camera_set_view_target(view_camera[0], obj_player);
    }

    show_debug_message("Cutscene aborted due to defeat.");

    instance_destroy(); // remove cutscene controller
    exit; // IMPORTANT
}




if (active) {
    if (cutscene_index < array_length(cutscene_steps)) {
        var step = cutscene_steps[cutscene_index];

        switch (step.type) {
            
        // Replace the "stop music" and "play music" cases in your obj_cutscene Step Event with these:

case "stop music":
    // Stop all currently playing music
    if (global.current_music != noone && audio_is_playing(global.current_music)) {
        audio_stop_sound(global.current_music);
        show_debug_message("🔇 Cutscene: Stopped music");
    }
    global.current_music = noone;
    
    // ⭐ FIX: Use cutscene_index instead of current_step
    cutscene_index++;
    break;

case "play music":
    // Get the music asset from the step
    var music_to_play = step.music;
    
    // Stop current music first
    if (global.current_music != noone && audio_is_playing(global.current_music)) {
        audio_stop_sound(global.current_music);
    }
    
    // Play new music if it exists
    if (music_to_play != noone && audio_exists(music_to_play)) {
        global.music_id = audio_play_sound(music_to_play, 10, true);
        audio_sound_gain(music_to_play, global.music_volume * global.master_volume, 0);
        global.current_music = music_to_play;
        show_debug_message("🎵 Cutscene: Started " + audio_get_name(music_to_play));
    }
    
    // ⭐ FIX: Use cutscene_index instead of current_step
    cutscene_index++;
    break;

                
         
         
         
         
         //------------------------------------------------------SWITCH ROOM ONLY-------------------------------------------//
case "switch room":
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;

        if (variable_instance_exists(step, "room_name")) {

            show_debug_message("Cutscene switching to room: " + string(step.room_name));

            // **IMPORTANT:** Do NOT increment cutscene_index.
            // Because when room changes, this instance is destroyed.
            room_goto(step.room_name);
        } 
        else {
            show_debug_message("ERROR: 'switch room' step missing room_name!");
            cutscene_index++; // fail-safe skip
        }
    }
break;
         
         
         
         
         
         
         
         
         
         
         //--------------------------------reduced to atoms effect------------------------------------------------------------------------------------------------------
         
       case "disintegrate actor":

    // 1️⃣ INITIALIZE ------------------------------------------------------
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;

        if (!instance_exists(step.actor)) {
            cutscene_index++;
            break;
        }

        step._actor = step.actor;
        step._pixels = [];

        var spr = step._actor.sprite_index;
        var ind = floor(step._actor.image_index);

        var w = sprite_get_width(spr);
        var h = sprite_get_height(spr);

        // Create surface
        var surf = surface_create(w, h);
        surface_set_target(surf);
        draw_clear_alpha(c_black, 0);
        draw_sprite(spr, ind, 0, 0);
        surface_reset_target();

        // Extract pixels
        for (var yy = 0; yy < h; yy++) {
            for (var xx = 0; xx < w; xx++) {
                var col = surface_getpixel(surf, xx, yy);

                if (col != 0) {
                    var p = {
                        x : step._actor.x + xx,
                        y : step._actor.y + yy,

                        // Slower spread
                        xs: random_range(-1, 1),
                        ys: random_range(-1, -0.1),

                        col: col,
                        alpha: 1
                    };
                    array_push(step._pixels, p);
                }
            }
        }

        surface_free(surf);

        // ⭐ Actor disappears instantly
        // Set follower globals before destroying the actor
        global.follower_present = false;
        global.follower_frozen  = true;

        with (step._actor) instance_destroy();
        step._actor = noone;
    }


    // 2️⃣ UPDATE ----------------------------------------------------------
    // (No check on step._actor anymore since it's gone)
    {
        for (var i = array_length(step._pixels) - 1; i >= 0; i--) {
            var px = step._pixels[i];

            // Slow movement
            px.x += px.xs;
            px.y += px.ys;

            // Optional gentle gravity (helps lingering)
            px.ys += 0.015;

            // Slow fade → linger longer
            px.alpha -= 0.015;

            if (px.alpha <= 0) {
                array_delete(step._pixels, i, 1);
            } else {
                step._pixels[i] = px;
            }
        }

        // Continue cutscene when all particles are gone
        if (array_length(step._pixels) <= 0) {
            cutscene_index++;
        }
    }

break;

         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         //--------------------------------------------GLOW--------------------------------------------------------------------------------------------------//
   case "pulse glow":
    pulse_actor = step.actor;
    pulse_color = step.color;
    pulse_speed = step.speed;
    cutscene_index++;
break;







         
     




         
         
         
         
         
         
         
         
         
         //-------------------------------------------ACTOR SHAKE LEFT-RIGHT-------------------------------------------//
case "shake actor":
    if (instance_exists(step.actor)) {

        // Initialize only once
        if (!variable_instance_exists(step, "_init")) {
            step._init = true;

            step.duration  = variable_instance_exists(step, "duration")  ? step.duration  : 0.4;
            step.intensity = variable_instance_exists(step, "intensity") ? step.intensity : 3;

            // convert to frames
            step._timer = step.duration * room_speed;

            // store real x position
            step._orig_x = step.actor.x;
        }

        // horizontal shake only
        var sx = random_range(-step.intensity, step.intensity);
        step.actor.x = step._orig_x + sx;

        // count down
        step._timer--;

        // done → reset
        if (step._timer <= 0) {
            step.actor.x = step._orig_x;
            cutscene_index++;
        }

    } else {
        cutscene_index++;
    }
break;


         
         
  //-----------------------------------------UNIQUE REMOVAL--------------------------------------------------------------------------------------------------------//       
         case "play vanish remove":
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;

        if (!variable_instance_exists(step, "sprite") 
        ||  !variable_instance_exists(step, "actor")) {
            cutscene_index++;
            break;
        }

        if (!instance_exists(step.actor)) {
            cutscene_index++;
            break;
        }

        _effect_active = true;
        _effect_sprite = step.sprite;
        _effect_x = step.actor.x;
        _effect_y = step.actor.y;

        _effect_frame = 0;
        _effect_final = sprite_get_number(step.sprite) - 1;

        _effect_speed = (variable_instance_exists(step, "speed")) ? step.speed : 5;
    }

    _effect_frame += _effect_speed / room_speed;

    if (floor(_effect_frame) >= _effect_final) {

        _effect_active = false;

        if (instance_exists(step.actor)) {
            with (step.actor) instance_destroy();
        }

        cutscene_index++;
    }
break;

         
         
         
         
         
         
         
         
         
         
         
 //------------------------------------------Unique spawner--------------------------------------------------------------------------------------------------------------//
         
        case "play appear spawn":
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;

        if (!variable_instance_exists(step, "sprite") 
        ||  !variable_instance_exists(step, "x_pos") 
        ||  !variable_instance_exists(step, "y_pos")) {
            cutscene_index++;
            break;
        }

        _effect_active = true;
        _effect_sprite = step.sprite;
        _effect_x = step.x_pos;
        _effect_y = step.y_pos;

        _effect_frame = 0;
        _effect_final = sprite_get_number(step.sprite) - 1;

        _effect_speed = (variable_instance_exists(step, "speed")) ? step.speed : 5;
    }

    _effect_frame += _effect_speed / room_speed;

    if (floor(_effect_frame) >= _effect_final) {
        _effect_active = false;

        var _layer = variable_instance_exists(step,"layer") ? step.layer : "Instances";
        var _spawn = variable_instance_exists(step,"spawn_object") ? step.spawn_object : obj_airy;

        instance_create_layer(step.x_pos, step.y_pos, _layer, _spawn);

        cutscene_index++;
    }
break;




         
         
         
         
         
         
         
         
        // ----------------------------------------------DETACH FOLLOWER---------------------------------------------- //
case "detach follower":
    if (!variable_instance_exists(step, "_done")) {
        step._done = true;

        // follower stays where they are, but stops updating
        global.follower_present = false;
        global.follower_frozen  = true;

        show_debug_message("Follower detached (frozen in place).");
    }
    cutscene_index++;
break;









// ----------------------------------------------ATTACH FOLLOWER---------------------------------------------- //
case "attach follower":
    if (!variable_instance_exists(step, "_done")) {
        step._done = true;

        global.follower_present = true;
        global.follower_frozen  = false;

        show_debug_message("Follower re-attached (following resumed).");
    }
    cutscene_index++;
break;


 // ----------------------------------------------Main Quest Update---------------------------------------------- //
case "main quest progress":
    if (!variable_instance_exists(step, "_done")) {
        step._done = true;
        scr_main_quest_progress(step.stage);
    }
    cutscene_index++;
break;



         
         
        
         
         
         
         
         
         
         //-------------------------------------------FADE OUT-------------------------------------------//
case "fade out":
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;
        step._speed = (variable_instance_exists(step, "speed")) ? step.speed : 0.05;
    }

    _fadeAlpha = clamp(_fadeAlpha + step._speed, 0, 1);

    // Once fully black, hold (optionally wait a bit)
    if (_fadeAlpha >= 1) {
        if (!variable_instance_exists(step, "_hold_timer")) {
            step._hold_timer = (variable_instance_exists(step, "hold")) ? step.hold * room_speed : 0;
        }
        if (step._hold_timer > 0) {
            step._hold_timer--;
        } else {
            cutscene_index++;
        }
    }
break;


//-------------------------------------------FADE IN-------------------------------------------//
case "fade in":
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;
        step._speed = (variable_instance_exists(step, "speed")) ? step.speed : 0.05;
    }

    _fadeAlpha = clamp(_fadeAlpha - step._speed, 0, 1);

    if (_fadeAlpha <= 0) {
        cutscene_index++;
    }
break;

         
         
         
         
         
         
         
         
         
         //------------------------------------------CHANGE ROOM AND ACTOR POSITION------------------------------------//
case "change room":
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;

        // Make sure the step has required data
        if (variable_instance_exists(step, "room_name") &&
            variable_instance_exists(step, "actor") &&
            variable_instance_exists(step, "x_pos") &&
            variable_instance_exists(step, "y_pos")) {

            // Move the actor to the new position before the room change (optional)
            if (instance_exists(step.actor)) {
                step.actor.x = step.x_pos;
                step.actor.y = step.y_pos;
            }

            // Change the room
            room_goto(step.room_name);
            show_debug_message("Room changed to " + string(step.room_name) +
                               ", actor repositioned to (" + string(step.x_pos) + ", " + string(step.y_pos) + ")");
        }
        else {
            show_debug_message("ERROR: 'change room' step missing room_name, actor, or x/y data!");
        }

        // Continue cutscene logic (safe cleanup)
        cutscene_index++;
    }
break;

         
         
         
         
         
         
         //----------------------------------------CAMERA SHAKE EFFECT------------------------------------------//
// Shakes the camera for a short duration
case "camera shake":
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;

        // Get camera (default to view_camera[0])
        step.cam = (variable_instance_exists(step, "cam")) ? step.cam : view_camera[0];

        // Default values if not provided
        step.duration = (variable_instance_exists(step, "duration")) ? step.duration : 0.5; // seconds
        step.intensity = (variable_instance_exists(step, "intensity")) ? step.intensity : 4; // pixels

        // Convert to frames
        step._timer = step.duration * room_speed;

        // Store original camera position
        step._orig_x = camera_get_view_x(step.cam);
        step._orig_y = camera_get_view_y(step.cam);
    }

    // Apply random offset each frame
    var shake_x = random_range(-step.intensity, step.intensity);
    var shake_y = random_range(-step.intensity, step.intensity);
    camera_set_view_pos(step.cam, step._orig_x + shake_x, step._orig_y + shake_y);

    // Decrease timer
    step._timer--;

    // End shake and reset position
    if (step._timer <= 0) {
        camera_set_view_pos(step.cam, step._orig_x, step._orig_y);
        cutscene_index++;
    }
break;

         
         
        //------------------------------------CREATE ACTOR VIA CODE------------------------------------------------//
case "create actor":
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;

        // Ensure required data is provided
        if (variable_instance_exists(step, "actor") &&
            variable_instance_exists(step, "x_pos") &&
            variable_instance_exists(step, "y_pos")) {

            var _layer = "Instances";
            if (variable_instance_exists(step, "layer")) {
                _layer = step.layer;
            }

            // Create the instance
            var new_actor = instance_create_layer(step.x_pos, step.y_pos, _layer, step.actor);

            show_debug_message("Created actor: " + string(step.actor) +
                               " at (" + string(step.x_pos) + ", " + string(step.y_pos) + ")");

            // ⭐ ADDED — mark follower presence
            if (step.actor == obj_follower) {
                global.follower_present = true;
            }

        } else {
            show_debug_message("ERROR: 'create actor' step missing object/x/y data!");
        }

        cutscene_index++;
    }
break;


         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         //-------------------------------------------BOUNCE EFFECT---------------------------------------//
// Makes an actor bounce up and down (jump or hop effect)
case "bounce":
    if (instance_exists(step.actor)) {
        if (!variable_instance_exists(step, "_init")) {
            step._init = true;
            step._start_y = step.actor.y;          // remember original Y
            step._phase = 0;                       // start phase of the bounce
        }

        // bounce parameters
        var bounce_height = (variable_instance_exists(step, "height")) ? step.height : 16;
        var bounce_speed  = (variable_instance_exists(step, "speed"))  ? step.speed  : 0.15;

        // apply sine wave motion
        step._phase += bounce_speed;
        step.actor.y = step._start_y - sin(step._phase * pi) * bounce_height;

        // when one full bounce is done, continue
        if (step._phase >= 1) {
            step.actor.y = step._start_y; // reset to original position
            cutscene_index++;
        }
    } else {
        // actor not found — skip
        cutscene_index++;
    }
break;
         
         
         
         
         
         
         
         
         
         
         
         
  //------------------------------------delete actor-------------------------------------------//       
         
         //------------------------------------delete actor-------------------------------------------//
case "delete actor":
    if (instance_exists(step.actor)) {

        // ⭐ ADDED — mark follower removed
        if (step.actor == obj_follower) {
            global.follower_present = false;
        }

        with (step.actor) instance_destroy();
        show_debug_message("Deleted actor: " + string(step.actor));
    }
    cutscene_index++;
break;

         
         
         
         
         
         
         
         
         
      //------------------------------------------------------ENTER BATTLE-------------------------------------------//   
         
         
         
         
         
         
         
         //enters a battle during a cutscene
         case "enter battle":
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;

        // optional safety check
        if (is_array(step.enemies) && step.bg != undefined) {
            // If the cutscene step defines "tutorial", use it — otherwise default to false
            var _tutorial = false;
            if (variable_instance_exists(step, "tutorial")) {
                _tutorial = step.tutorial;
            }

            // call your existing encounter script
            NewEncounter(step.enemies, step.bg, _tutorial);
        } 
        else {
            show_debug_message("Invalid enter battle parameters!");
        }

        // instantly continue or wait a frame if you prefer
        cutscene_index++;
    }
break;

         
         
         
         
         
         
         
       //--------------------------SPRITE CHANGE--------------------------------------------------------------------//  
         
         
         
         
         
         
         
         //manually manipulaates actor sprite
         case "set sprite":
    if (instance_exists(step.actor)) {
        // Change the sprite
        step.actor.sprite_index = step.sprite;

        // Reset facing direction (fixes wrong facing)
        step.actor.image_xscale = 1;

        // Optional: reset animation frame and speed if provided
        if (variable_instance_exists(step, "image_index"))
            step.actor.image_index = step.image_index;

        if (variable_instance_exists(step, "image_speed"))
            step.actor.image_speed = step.image_speed;
    }

    cutscene_index++;
break;

         
         
         
 //----------------------------------------------WAIT COUNTER--------------------------------------------------------------------//        
         
         
         
         
         //makes the cutscene wait for few seconds before continuing
         case "wait":
    // Initialize wait timer
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;
        step._timer = step.time * room_speed; // time in frames (or convert from seconds)
    }

    // Count down
    step._timer--;

    if (step._timer <= 0) {
        cutscene_index++;
    }
         break;
         
         
         
//-------------------------------------------------FOR CAMERA MOVEMENT------------------------------------------------------------//         
         
         
         //camera controller for cutscene
         case "move camera":
            if (!variable_instance_exists(step, "_init")) {
                step._init = true;
                step._target_x = step.move_x;
                step._target_y = step.move_y;
                if (!variable_instance_exists(step, "cam")) {
                    step.cam = view_camera[0]; // Default to main camera
                }
            }

            var cam_x = camera_get_view_x(step.cam);
            var cam_y = camera_get_view_y(step.cam);
            var dist = point_distance(cam_x, cam_y, step._target_x, step._target_y);

            if (dist > step.speed) {
                var dir = point_direction(cam_x, cam_y, step._target_x, step._target_y);
                cam_x += lengthdir_x(step.speed, dir);
                cam_y += lengthdir_y(step.speed, dir);
                camera_set_view_pos(step.cam, cam_x, cam_y);
            } else {
                camera_set_view_pos(step.cam, step._target_x, step._target_y);
                cutscene_index++;
            }
        break;
         
         
         
//-------------------------------------------MOVE CHARACTER----------------------------------------------------------------------------//         
         
         
        //if you dont wanna add path this is second option
case "move character":
    if (instance_exists(step.actor)) {
        if (!variable_instance_exists(step, "_init")) {
            step._init = true;
            step._target_x = step.move_x;
            step._target_y = step.move_y;

            // store the original sprite to restore later
            step._orig_sprite = step.actor.sprite_index;

            // if a move sprite is defined in the step, switch to it
            if (variable_instance_exists(step, "move_sprite")) {
                step.actor.sprite_index = step.move_sprite;
                step.actor.image_index = 0;
                step.actor.image_speed = 1;
            }
        }

        // move towards the target
        var dx = step._target_x - step.actor.x;
        var dy = step._target_y - step.actor.y;
        var dist = point_distance(step.actor.x, step.actor.y, step._target_x, step._target_y);

        if (dist > step.speed) {
            var dir = point_direction(step.actor.x, step.actor.y, step._target_x, step._target_y);
            step.actor.x += lengthdir_x(step.speed, dir);
            step.actor.y += lengthdir_y(step.speed, dir);

            // Only flip when no custom move_sprite is given
if (!variable_instance_exists(step, "move_sprite")) {
    if (abs(dx) > abs(dy)) {
        step.actor.image_xscale = (dx < 0) ? -1 : 1;
    }
}


        } else {
            // Snap to final position
            step.actor.x = step._target_x;
            step.actor.y = step._target_y;

            // restore the original sprite
            if (variable_instance_exists(step, "_orig_sprite")) {
                step.actor.sprite_index = step._orig_sprite;
                step.actor.image_speed = 0;
                step.actor.image_index = 0;
            }

            cutscene_index++;
        }
    } else {
        // Actor doesn't exist, skip
        cutscene_index++;
    }
break;
       

         
         
         
         
         
//-------------------------------------------MOVE MULTIPLE CHARACTERS-------------------------------------------//
case "move multiple characters":
    // initialize this step
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;

        // store sub-steps for each actor
        step._moves = [];

        for (var i = 0; i < array_length(step.actors); i++) {
            var a = step.actors[i];
            if (instance_exists(a.actor)) {
                var sub = {
                    actor: a.actor,
                    target_x: a.move_x,
                    target_y: a.move_y,
                    speed: a.speed,
                    done: false,
                    has_custom_sprite: variable_instance_exists(a, "move_sprite")
                };

                // store original sprite to restore later
                sub._orig_sprite = a.actor.sprite_index;

                // optional move sprite
                if (sub.has_custom_sprite) {
                    a.actor.sprite_index = a.move_sprite;
                    a.actor.image_index = 0;
                    a.actor.image_speed = 1;

                    // ⭐ VERY IMPORTANT: keep original xscale so it does NOT flip wrong
                    sub._orig_xscale = a.actor.image_xscale;
                }

                array_push(step._moves, sub);
            }
        }
    }

    var all_done = true;

    // process all moves
    for (var i = 0; i < array_length(step._moves); i++) {
        var m = step._moves[i];

        if (!m.done && instance_exists(m.actor)) {
            var dx = m.target_x - m.actor.x;
            var dy = m.target_y - m.actor.y;
            var dist = point_distance(m.actor.x, m.actor.y, m.target_x, m.target_y);

            if (dist > m.speed) {
                var dir = point_direction(m.actor.x, m.actor.y, m.target_x, m.target_y);
                m.actor.x += lengthdir_x(m.speed, dir);
                m.actor.y += lengthdir_y(m.speed, dir);

                // ⭐ FIX: ONLY auto-flip if NO custom move_sprite was provided
                if (!m.has_custom_sprite) {
                    if (abs(dx) > abs(dy)) {
                        m.actor.image_xscale = (dx < 0) ? -1 : 1;
                    }
                }

                all_done = false;
            } else {
                // snap to final position
                m.actor.x = m.target_x;
                m.actor.y = m.target_y;

                // restore original sprite
                m.actor.sprite_index = m._orig_sprite;

                // restore xscale ONLY if custom sprite was used
                if (m.has_custom_sprite) {
                    m.actor.image_xscale = m._orig_xscale;
                }

                m.actor.image_speed = 0;
                m.actor.image_index = 0;
                m.done = true;
            }
        }
    }

    // if all actors reached their destinations, move to next step
    if (all_done) {
        cutscene_index++;
    }
break;


         
         
         
         
         
         
         
         
         
         
         
         
         
//-----------------------------------------------path----------------------------------------------------------------------------------//                 

         
         
         
        
                  //if you want path for actor to move
        case "path":
            if (instance_exists(step.actor)) {
                if (!variable_instance_exists(step, "_init")) {
                    step._init = true;
                    // make the actor follow the path
                    with (step.actor) {
                        path_start(step.path, step.speed, step.end_action, step.absolute);
                    }
                }
                // check if actor finished its path
                if (step.actor.path_index == -1) {
                    cutscene_index++;
                }
            } else {
                cutscene_index++;
            }
        break;
         
         
         //--------------------------------------FOR DIALOGUE---------------------------------//
         
         
        case "dialogue":
    if (!variable_instance_exists(step, "_init")) {
        step._init = true;
        var controller = id; // cutscene controller
        with (instance_create_layer(0, 0, "Instances", obj_textbox)) {
            src_game_text(step.text_id);
            my_controller = controller; // save reference
            textbox_callback = function () {
                my_controller.cutscene_index++;
            };
        }
    }
break;

         
         
 
         
         
         
  
         
         
                 
         
        
         
         
         
        }
         
         
         
         
         
         
         
         
         //----------------------------------else block--------------------------------------------------------------//
    } 
        else {
    active = false;
    show_debug_message("Cutscene finished!");
         
         
         global.scene7_cutscene = false;
         global.scene8_cutscene = false;
         global.scene9_cutscene = false;

    // Save cutscene as completed
    array_push(global.cutscenes_played, trigger_id);
    
    if (trigger_id == "scene 5") {
        global.scene5_done = true;
    }

    // Scene 1 unlocks follower permanently (story flag)
    if (trigger_id == "scene 1") {
        global.follower_unlocked = true;
        global.follower_present  = true;
    }

    // ⭐ ADDED - Scene 13 goes to credits
    if (trigger_id == "scene 13") {
        room_goto(rm_credits);
         
        instance_destroy();
        exit; // Important - stop here, don't restore camera
    }

    // Restore camera
    if (instance_exists(obj_player)) {
        camera_set_view_target(view_camera[0], obj_player);
    }

    // Scene 1 spawns follower ONCE
    if (trigger_id == "scene 1") {
        if (!instance_exists(obj_follower)) {
            var _f = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_follower);
            _f.record = 15;
        }
        global.follower_present = true;
    }

    instance_destroy();
}
}

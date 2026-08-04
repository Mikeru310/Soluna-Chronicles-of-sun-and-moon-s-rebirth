// =====================================================
// oBattle - CREATE EVENT (COMPLETE WITH MUSIC)
// =====================================================

// START BATTLE MUSIC
if (!global.in_battle) {
    global.in_battle = true;
    global.previous_music = global.current_music; // Store current music
    
    if (global.current_music != noone) audio_stop_sound(global.current_music);
        

    
    global.music_id = audio_play_sound(global.music_battle, 15, true);
    audio_sound_gain(global.music_battle, global.music_volume, 0);
    global.current_music = global.music_battle;
}


//UI SOUNDS
snd_ui_move = move_select_snd;
snd_ui_select = move_select_snd;
snd_ui_back = back_snd

// ===========================================================================
// SAFETY DEFAULTS — MUST EXIST EVEN IN NORMAL BATTLES
// ===========================================================================
tutorialActive          = false;
tutorialDone            = false;

tutorialLock            = false;

tutorialForceAttack     = false;
tutorialForceTarget     = false;
tutorialForceItem       = false;
tutorialForcePotion     = false;
tutorialForceHealTarget = false;

tutorialSeenDamage      = false;

tutorialStep            = 0;
tutorialTimer           = 0;
tutorialCursorStep      = 0;

tutorial_text           = "";
show_tutorial_text      = false;

// ===========================================================================
// OLD O-BATTLE TRANSITION SYSTEM (FULLY REPLICATED)
// ===========================================================================
// ===========================================================================
// OLD O-BATTLE TRANSITION SYSTEM (FULLY REPLICATED)
// ===========================================================================
battle_fade_alpha = 1;  // *** CHANGED: Start fully black (was 0)
battle_fade_speed = 0.05;
battle_fade_state = 1;  // *** CHANGED: Start with fade-in (was 2)
transitionProg = 1;

// Create transition screenshot
var _w = surface_get_width(application_surface);
var _h = surface_get_height(application_surface);
//surfTransition = surface_create(_w, _h);

// Copy screen before battle starts
//surface_copy(surfTransition, 0, 0, application_surface);

// Freeze everything from the room
instance_deactivate_all(true);

// ===========================================================================
// BATTLE VARIABLES INITIALIZATION
// ===========================================================================
battleWaitForMenu = false;
battleWaitTimeFrames = 90;
battleWaitTimeRemaining = 0;
battleText = "";
battleEndMessageProg = 0;
battleEndMessages = [];
battleXpGained = 0;
conclusionType = -1;
escaped = false;
turn = 0;
turnCount = 0;
roundCount = 0;
units = [];
unitTurnOrder = [];
unitRenderOrder = [];
unitDepth = depth - 10;

// Hover info
hover_description = "";
show_hover_description = false;
// ===========================================================================
// CURSOR STRUCT
// ===========================================================================
cursor = {
    activeUser: noone,
    activeTarget: noone,
    activeAction: -1,
    targetSide: -1,
    targetIndex: 0,
    targetAll: false,
    confirmDelay: 0,
    active: false
};

// Reset tutorial text state
tutorial_text = "";
show_tutorial_text = false;

// ===========================================================================
// TUTORIAL SETUP
// ===========================================================================
if (variable_instance_exists(id, "tutorialMode") && tutorialMode) {
    tutorialStep = 0;
    tutorialActive = true;
    tutorialDone = false;
    tutorialTimer = 0;
    tutorialLock = true;
    tutorialCursorStep = 0;

    tutorialForceItem       = false;
    tutorialForcePotion     = false;
    tutorialForceHealTarget = false;
    tutorialSeenDamage      = false;
}
else {
    tutorialActive = false;
}

// ===========================================================================
// ENEMY SPAWN
// ===========================================================================
for (var i = 0; i < array_length(enemies); i++) {

    var enemy = instance_create_depth(
        x + 250 + (i * 10),
        y + 68 + (i * 10),
        depth - 10,
        oBattleUnitEnemy,
        enemies[i]
    );

    enemy.debuffs = [];
    array_push(units, enemy);

    // Naming logic (A, B, C…)
    var baseName = enemy.name;
    var count = 0;

    for (var j = 0; j <= i; j++) {
        if (j < i && enemyUnits[j].name == baseName + " " + chr(64 + count + 1)) count++;
        else if (j < i && enemyUnits[j].name == baseName) count++;
    }

    enemy.name = baseName + " " + chr(65 + count);
    enemyUnits[i] = enemy;
}

// ===========================================================================
// PARTY SPAWN (WITH MAYA REMOVAL FOR MAYA_VESSELOFCALAMITY)
// ===========================================================================
if (variable_instance_exists(id, "tutorialMode") && tutorialMode)
{
    partyUnits = [];

    var haru = global.party[0];
    var _haruUnit = instance_create_depth(
        x + 115,
        y + 78,
        depth - 10,
        oBattleUnitPC,
        haru
    );

    array_push(units, _haruUnit);
    array_push(partyUnits, _haruUnit);
}
else
{
    // Check if Maya boss is present
    var _mayaBoss = array_any(enemies, function(_e) {
        return (_e == global.enemies.Maya_VesselOfCalamity);
    });

    if (_mayaBoss && array_length(global.party) > 1) {
        array_delete(global.party, 1, 1); // Remove Maya from party
    }

    // Normal party spawn
    for (var i = 0; i < array_length(global.party); i++) {
        partyUnits[i] = instance_create_depth(
            x + 115 - (i * 15),
            y + 78 - (i * 10),
            depth - 10,
            oBattleUnitPC,
            global.party[i]
        );

        array_push(units, partyUnits[i]);
    }
}
// ===========================================================================
// SHUFFLE TURN ORDER
// ===========================================================================
unitTurnOrder = array_shuffle(units);

// ===========================================================================
// RENDER ORDER FUNCTION
// ===========================================================================
RefreshRenderOrder = function() {
    unitRenderOrder = [];
    array_copy(unitRenderOrder, 0, units, 0, array_length(units));

    array_sort(unitRenderOrder, function(_1, _2) {
        return _1.y - _2.y; // lower y = further back
    });
};

RefreshRenderOrder();

// ===========================================================================
// ---------------------- BATTLE STATE FUNCTIONS -----------------------------
// ===========================================================================

function BattleStateSelectAction() {
    if (!instance_exists(oMenu)) {

        var _unit = unitTurnOrder[turn];

        _unit.isStunned = false;

        if (!is_undefined(_unit.debuffs)) {
            ProcessDebuffs(_unit);

            if (_unit.hp <= 0) {
                battleState = BattleStateVictoryCheck;
                exit;
            }
        }

        if (!instance_exists(_unit) || (_unit.hp <= 0)) {
            battleState = BattleStateVictoryCheck;
            exit;
        }

        if (_unit.isStunned) {
            battleText = _unit.name + " is stunned and cannot move!";
            turn++;

            if (turn >= array_length(unitTurnOrder)) {
                turn = 0;
                roundCount++;
            }

            exit;
        }

        // -------------------------
        // PLAYER TURN (PC unit)
        // -------------------------
        if (_unit.object_index == oBattleUnitPC) {

            var _menuOptions = [];
            var _subMenus = {};

            // Inventory → item actions
            var _inventoryActions = [];
            for (var i = 0; i < array_length(global.inventory); i++) {
                if (global.inventory[i][1] > 0) {
                    var _itemAction = global.inventory[i][0];
                    _itemAction.count = global.inventory[i][1];
                    array_push(_inventoryActions, _itemAction);
                }
            }

            var _actionList = array_union(_unit.actions, _inventoryActions);

            // Remove Escape if boss present
            var _bossPresent = array_any(enemyUnits, function(_e) {
                return (!is_undefined(_e.isBoss) && _e.isBoss);
            });

            if (_bossPresent) {
                _actionList = array_filter(_actionList, function(_a) {
                    return (_a.name != "Escape");
                });
            }

            // <<< ADDED: Remove Escape during tutorial
            if (tutorialActive) {
                _actionList = array_filter(_actionList, function(_a) {
                    return (_a.name != "Escape");
                });
            }
            // <<< END ADDED

            // Build menu
            for (var i = 0; i < array_length(_actionList); i++) {
                var _action = _actionList[i];
                var _available = isActionAvailable(_unit, _action);
                var _nameText = _action.name;

                if (_action.subMenu == "Item") {
                    _nameText += string(" x{0}", _action.count);
                }

                // No submenu
                if (_action.subMenu == -1) {
                    array_push(_menuOptions, [_nameText, MenuSelectAction, [_unit, _action], _available]);
                }
                else {
                    // Submenu logic
                    if (is_undefined(_subMenus[$ _action.subMenu])) {
                        variable_struct_set(_subMenus, _action.subMenu,
                            [[_nameText, MenuSelectAction, [_unit, _action], _available]]);
                    } else {
                        array_push(_subMenus[$ _action.subMenu],
                            [_nameText, MenuSelectAction, [_unit, _action], _available]);
                    }
                }
            }

            // Add Back options to submenus
            var _subMenuNames = variable_struct_get_names(_subMenus);
            for (var i = 0; i < array_length(_subMenuNames); i++) {
                array_push(_subMenus[$ _subMenuNames[i]], ["Back", MenuGoBack, -1, true]);
                array_push(_menuOptions,
                    [_subMenuNames[i], SubMenu, [_subMenus[$ _subMenuNames[i]]], true]);
            }

            // Create main action menu
            Menu(x + 100, y + 117, _menuOptions, , 74, 59);
        }

        // -------------------------
        // ENEMY TURN
        // -------------------------
        else {
            var _enemyAction = _unit.AIscript();
            if (_enemyAction != -1)
                BeginAction(_unit.id, _enemyAction[0], _enemyAction[1]);
        }
    }
}

// ===========================================================================
// BEGIN ACTION
// ===========================================================================
function BeginAction(_user, _action, _targets) {

    currentUser   = _user;
    currentAction = _action;
    currentTargets = _targets;

    battleText = string_ext(_action.description, [_user.name]);

    if (variable_struct_exists(_action, "sound")) {
        var snd = audio_play_sound(_action.sound, 5, false);
        audio_sound_gain(snd, global.sound_volume, 0);
    }

    if (!is_array(currentTargets))
        currentTargets = [currentTargets];

    battleWaitTimeRemaining = battleWaitTimeFrames;

    // Do user animation
    with (_user) {
        acting = true;

        if (!is_undefined(_action[$ "userAnimation"]) &&
            !is_undefined(sprites[$ _action.userAnimation]))
        {
            sprite_index = sprites[$ _action.userAnimation];
            image_index = 0;
        }

        // Consume item
        if (_action.subMenu == "Item") {
            for (var i = 0; i < array_length(global.inventory); i++) {
                if (global.inventory[i][0] == _action) {
                    global.inventory[i][1] -= 1;
                    break;
                }
            }
        }
    }

    battleState = BattleStatePerformAction;
}

// ===========================================================================
// PERFORM ACTION STATE
// ===========================================================================
function BattleStatePerformAction() {

    if (currentUser.acting) {

        if (currentUser.image_index >= currentUser.image_number - 1) {

            with (currentUser) {
                sprite_index = sprites.idle;
                image_index = 0;
                acting = false;
            }

            // Spawn effect graphics
            if (variable_struct_exists(currentAction, "effectSprite")) {

                if (currentAction.effectOnTarget == Mode.Always ||
                    currentAction.effectOnTarget == Mode.Varies)
                {
                    for (var i = 0; i < array_length(currentTargets); i++) {
                        instance_create_depth(
                            currentTargets[i].x,
                            currentTargets[i].y,
                            currentTargets[i].depth - 1,
                            oBattleEffect,
                            { sprite_index: currentAction.effectSprite }
                        );
                    }
                }
                else {
                    var _effectSprite = currentAction.effectSprite;

                    if (variable_struct_exists(currentAction, "effectSpriteNoTarget"))
                        _effectSprite = currentAction.effectSpriteNoTarget;

                    instance_create_depth(
                        x, y, depth - 100,
                        oBattleEffect,
                        { sprite_index: _effectSprite }
                    );
                }
            }

            currentAction.func(currentUser, currentTargets);
        }

    } else {

        if (!instance_exists(oBattleEffect)) {
            battleWaitTimeRemaining--;

            if (battleWaitTimeRemaining <= 0) {
                battleState = BattleStateVictoryCheck;
            }
        }
    }
}

// ===========================================================================
// VICTORY CHECK
// ===========================================================================
function BattleStateVictoryCheck() {

    var _end = false;

    var noEnemiesAlive = !array_any(enemyUnits, function(_u) { return _u.hp > 0; });
    var noPartyAlive   = !array_any(partyUnits, function(_u) { return _u.hp > 0; });

    // Lose
    if (noPartyAlive) {
        _end = true;
        conclusionType = 0;
        battleEndMessages[0] = "All resistance has withered...";
    }

    // Win
    else if (noEnemiesAlive) {

        _end = true;
        conclusionType = 1;

        battleEndMessages[0] = "Victory!!";

        // XP gain
        battleXpGained = 0;
        for (var i = 0; i < array_length(enemyUnits); i++) {
            battleXpGained += enemyUnits[i].xpValue;
        }

        battleEndMessages[1] =
            string("Gained {0} experience points", battleXpGained);

        // Boss flags
        for (var i = 0; i < array_length(enemyUnits); i++) {
            var _e = enemyUnits[i];

            if (!is_undefined(_e.isBoss) && _e.isBoss &&
                !is_undefined(_e.bossID))
            {
                global.bosses[_e.bossID - 1] = true;
            }
        }

        // Gold gain
        var totalGold = 0;
        for (var i = 0; i < array_length(enemyUnits); i++) {
            var _e = enemyUnits[i];
            var goldDrop = _e.goldDrop();

            if (!is_undefined(_e.isBoss) && _e.isBoss)
                goldDrop = round(goldDrop * 1.5);

            totalGold += goldDrop;
        }

        array_push(battleEndMessages,
            "Gained " + string(totalGold) + " gold!");

        if (!variable_global_exists("gold"))
            global.gold = 0;

        global.gold += totalGold;

        // Apply XP to living members
        var living = array_filter(partyUnits, function(_u) { return _u.hp > 0; });
        var xpEach = floor(battleXpGained / max(1, array_length(living)));
        var maxLvl = GetMaxLevelUnlocked();

        for (var i = 0; i < array_length(living); i++) {
            var _p = living[i];
            _p.currentXp += xpEach;

            while (_p.currentXp >= _p.xpLevelUp &&
                   _p.level < maxLvl)
            {
                var old_hp  = _p.hpmax;
                var old_mp  = _p.mpmax;
                var old_str = _p.strength;

                // Level up
                _p.currentXp -= _p.xpLevelUp;
                _p.level++;
                _p.xpLevelUp = scr_get_xp_required(_p.name, _p.level);

                ApplyLevelStats(_p);

                _p.hp = _p.hpmax;
                _p.mp = _p.mpmax;

                array_push(battleEndMessages,
                    _p.name + " leveled up to Level " + string(_p.level) + "!");

                if (old_hp != _p.hpmax)
                    array_push(battleEndMessages,
                        "HP: " + string(old_hp) + " > " + string(_p.hpmax));

                if (old_mp != _p.mpmax)
                    array_push(battleEndMessages,
                        "MP: " + string(old_mp) + " > " + string(_p.mpmax));

                if (old_str != _p.strength)
                    array_push(battleEndMessages,
                        "ATK: " + string(old_str) + " > " + string(_p.strength));

                scr_check_magic_unlocks(_p);
            }

            if (_p.level >= maxLvl && _p.currentXp >= _p.xpLevelUp) {
                _p.currentXp = _p.xpLevelUp - 1;
                array_push(battleEndMessages,
                    _p.name + " reached the current level cap (" +
                    string(maxLvl) + ")!");
            }
        }
    }

    // Escape ends battle
    if (escaped) {
        _end = true;
        conclusionType = 2;

        battleEndMessages[0] = "Escaped!";
        battleEndMessages[1] = "No experience gained.";
    }

    battleState = _end ? BattleStateEnding : BattleStateTurnProgression;
}

// ===========================================================================
// TURN PROGRESSION
// ===========================================================================
function BattleStateTurnProgression() {
    battleText = "";
    turnCount++;
    turn++;

    if (turn > array_length(unitTurnOrder) - 1) {
        turn = 0;
        roundCount++;
    }

    battleState = BattleStateSelectAction;
}

// ===========================================================================
// BATTLE ENDING STATE
// ===========================================================================
function BattleStateEnding() {

    if (keyboard_check_pressed(ord("Z"))) {
        battleEndMessageProg++;
    }

    // All messages shown?
    if (battleEndMessageProg >= array_length(battleEndMessages)) {

        if (!variable_instance_exists(id, "conclusionType"))
            conclusionType = -1;

        var partyDown = false;

        // Revive unconscious members if win/escape
        if (conclusionType == 1 || conclusionType == 2) {

            if (is_array(partyUnits) && array_length(partyUnits) > 0) {

                var maxIndex =
                    min(array_length(global.party), array_length(partyUnits));

                for (var i = 0; i < maxIndex; i++) {
                    var _bu = partyUnits[i];

                    if (instance_exists(_bu)) {
                        var wasDown = (_bu.hp <= 0);

                        with (_bu) {
                            if ((other.conclusionType == 1 ||
                                 other.conclusionType == 2) &&
                                hp <= 0)
                            {
                                hp = floor(hpmax * 0.5);
                            }

                            global.party[i].hp        = clamp(hp, 0, hpmax);
                            global.party[i].mp        = clamp(mp, 0, mpmax);
                            global.party[i].level     = level;
                            global.party[i].currentXp = currentXp;
                            global.party[i].xpLevelUp = xpLevelUp;
                            global.party[i].hpmax     = hpmax;
                            global.party[i].mpmax     = mpmax;
                            global.party[i].strength  = strength;

                            global.party[i].debuffs = [];
                        }

                        if (wasDown)
                            partyDown = true;
                    }
                }
            }
        }

        // Game Over
        if (conclusionType == 0) {
    global.battle_lost = true;
    instance_activate_all();

    // ⭐ DESTROY PLAYER SO THEY DON'T APPEAR IN GAME OVER
    with (obj_player) instance_destroy();
    with (obj_follower) instance_destroy();

    room_goto(rm_GameOver);
    exit;
}

        // Someone was KO'd earlier → dialogue
        if (partyDown) {
    instance_activate_all();
    
    // ⭐ NEW: Store escape status globally before creating textbox
    global.party_escaped = (conclusionType == 2);
    
    create_textbox("party_member_down");
    instance_destroy();
    exit;
}


        // Music restore
        if (global.in_battle) {
    global.in_battle = false;

    // Stop the battle music INSTANCE (not asset)
    if (audio_is_playing(global.music_id)) {
        audio_stop_sound(global.music_id);
    }

    if (global.previous_music != noone) {
        // ✅ FIX: Play the previous music ASSET and get the INSTANCE
        global.music_id = audio_play_sound(global.previous_music, 10, true);
        
        // ✅ FIX: Apply volume to the INSTANCE (music_id), not the ASSET
        audio_sound_gain(global.music_id, global.music_volume * global.master_volume, 0);
        
        // Update tracker
        global.current_music = global.previous_music;
    }
    else {
        var room_name = room_get_name(room);

        if (string_pos("FOREST", room_name) > 0) {
            if (string_pos("CAVE", room_name) > 0) {
                global.music_id = audio_play_sound(global.music_cave, 10, true);
                audio_sound_gain(global.music_id, global.music_volume * global.master_volume, 0);
                global.current_music = global.music_cave;
            }
            else {
                global.music_id = audio_play_sound(global.music_forest, 10, true);
                audio_sound_gain(global.music_id, global.music_volume * global.master_volume, 0);
                global.current_music = global.music_forest;
            }
        }
        else if (string_pos("Plain", room_name) > 0) {
            global.music_id = audio_play_sound(global.music_plain, 10, true);
            audio_sound_gain(global.music_id, global.music_volume * global.master_volume, 0);
            global.current_music = global.music_plain;
        }
        else if (string_pos("Swamp", room_name) > 0) {
            global.music_id = audio_play_sound(global.music_swamp, 10, true);
            audio_sound_gain(global.music_id, global.music_volume * global.master_volume, 0);
            global.current_music = global.music_swamp;
        }
        else if (string_pos("Mountain", room_name) > 0) {
            global.music_id = audio_play_sound(global.music_mountain, 10, true);
            audio_sound_gain(global.music_id, global.music_volume * global.master_volume, 0);
            global.current_music = global.music_mountain;
        }
    }
}

        escaped = true;
        instance_destroy();
    }

    else {
        battleText = battleEndMessages[battleEndMessageProg];
    }
}

// ===========================================================================
// BATTLE INTRO MESSAGE STATE
// ===========================================================================
function BattleStateBegin() {

    battleState = BattleStateSelectAction;

    if (array_length(unitTurnOrder) > 0) {

        var _first = unitTurnOrder[0];

        if (_first.object_index == oBattleUnitEnemy) {

            battleText = _first.name + " Blocks our path!";
            battleWaitTimeRemaining = 120;

            battleState = function() {
                battleWaitTimeRemaining--;

                if (battleWaitTimeRemaining <= 0) {
                    battleState = BattleStateSelectAction;
                }
            };
        }
    }
}

// ===========================================================================
// TUTORIAL HANDLER
// ===========================================================================
function TutorialHandler() {

    if (!tutorialActive) return;

    tutorialTimer++;

    switch (tutorialStep) {

        case 0:
            tutorial_text = "Welcome to your first battle!";
            show_tutorial_text = true;
            tutorialLock = true;

            if (keyboard_check_pressed(ord("Z"))) {
                tutorialStep = 1;
                tutorialTimer = 0;
            }
        break;

        case 1:
            tutorial_text = "Let's start by attacking.";
            tutorialLock = true;

            if (instance_exists(oMenu)) {
                tutorialForceAttack = true;
                tutorialLock = false;
                tutorialStep = 2;
            }
        break;

        case 2:
            tutorial_text = "Press Z to select ATTACK.";

            if (cursor.active) {
                tutorialForceAttack = false;
                tutorialForceTarget = true;
                tutorialStep = 3;
            }
        break;

        case 3:
            tutorial_text = "Press Z to choose a target.";

            if (battleState == BattleStatePerformAction) {
                tutorialForceTarget = false;
                tutorialLock = true;
                tutorialStep = 4;
                tutorialTimer = 0;
            }
        break;

        case 4:
            tutorial_text = "Good! Actions consume your turn.";

            if (battleState == BattleStateSelectAction) {
                tutorialStep = 5;
            }
        break;

        case 5:
            var _haru = partyUnits[0];

            if (_haru.hp < _haru.hpmax) {
                tutorial_text = "You took damage, heal yourself!";
                show_tutorial_text = true;

                tutorialLock = true;
                tutorialTimer = 0;
                tutorialStep = 6;
            }
        break;

        case 6:
            tutorial_text = "Open the Item menu.";

            if (instance_exists(oMenu)) {
                tutorialForceItem = true;
                tutorialLock = false;
                tutorialStep = 7;
            }
        break;

        case 7:
            tutorial_text = "Select Small Potion.";

            if (instance_exists(oMenu) && oMenu.optionsPerRow == 1) {
                tutorialForcePotion = true;
                tutorialStep = 8;
            }
        break;

        case 8:
            tutorial_text = "Choose yourself to heal.";

            if (cursor.active) {
                tutorialForceHealTarget = true;
                tutorialStep = 9;
            }
        break;

        case 9:
            if (battleState == BattleStatePerformAction) {

                tutorial_text = "Good! Healing restores HP.";

                tutorialForceHealTarget = false;
                tutorialForcePotion     = false;
                tutorialForceItem       = false;

                tutorialLock = true;
                tutorialTimer = 0;
                tutorialStep = 10;
            }
        break;

        case 10:
            tutorial_text = "Good job! Now finish the battle!";
            show_tutorial_text = true;

            tutorialLock = false;

            if (tutorialTimer > 120) {
                tutorialStep = 11;
            }
        break;

        case 11:
            tutorial_text = "";
            show_tutorial_text = false;

            tutorialActive = false;
            tutorialLock   = false;
        break;
    }
}

// ===========================================================================
// START STATE MACHINE
// ===========================================================================
battleState = BattleStateBegin;
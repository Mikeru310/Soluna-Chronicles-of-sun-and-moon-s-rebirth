// ======================================================
// BATTLE INTRO FADE (VISIBLE → BLACK → VISIBLE)
// ======================================================
switch (battle_fade_state)
{
    case 0:
        battle_fade_alpha += battle_fade_speed;
        if (battle_fade_alpha >= 1) {
            battle_fade_alpha = 1;
            battle_fade_state = 1;
        }
        exit;

    case 1:
        battle_fade_alpha -= battle_fade_speed;
        if (battle_fade_alpha <= 0) {
            battle_fade_alpha = 0;
            battle_fade_state = 2;
        }
        exit;

    case 2:
        // continue
    break;
}


// ======================================================
// FADE-IN: BLACK → GAME
// ======================================================
if (transitionProg < 1) {
    transitionProg += 0.03;
    if (transitionProg > 1) transitionProg = 1;
}


// ======================================================
// TUTORIAL HANDLER
// ======================================================
if (tutorialActive) TutorialHandler();


// ======================================================
// NORMAL BATTLE UPDATE
// ======================================================
battleState();


// ======================================================
// TARGET CURSOR SYSTEM
// ======================================================
if (cursor.active)
{
    with (cursor)
    {
        // --------------------------------------------------
        // Tutorial locks
        // --------------------------------------------------
        if (instance_exists(oBattle))
        {
            if (oBattle.tutorialForceTarget || oBattle.tutorialForceHealTarget)
            {
                if (keyboard_check_pressed(ord("X"))) exit;
            }
        }

        if (instance_exists(oBattle) && oBattle.tutorialLock) exit;


        // --------------------------------------------------
        // Input
        // --------------------------------------------------
        var _keyUp      = keyboard_check_pressed(vk_up);
        var _keyDown    = keyboard_check_pressed(vk_down);
        var _keyLeft    = keyboard_check_pressed(vk_left);
        var _keyRight   = keyboard_check_pressed(vk_right);
        var _keyToggle  = false;
        var _keyConfirm = false;
        var _keyCancel  = false;

        confirmDelay++;

        if (confirmDelay > 1)
        {
            _keyConfirm = keyboard_check_pressed(ord("Z"));
            _keyCancel  = keyboard_check_pressed(ord("X"));
            _keyToggle  = keyboard_check_pressed(vk_shift);
        }

        var _moveH = _keyRight - _keyLeft;
        var _moveV = _keyDown  - _keyUp;


        // --------------------------------------------------
        // Prevent movement during forced tutorial
        // --------------------------------------------------
        if (instance_exists(oBattle))
        {
            if (oBattle.tutorialForceTarget || oBattle.tutorialForceHealTarget)
            {
                _moveH = 0;
                _moveV = 0;
            }
        }


        // --------------------------------------------------
        // Horizontal target side switch (WITH SOUND)
        // --------------------------------------------------
        if (instance_exists(oBattle) && oBattle.tutorialForceHealTarget)
        {
            targetSide   = oBattle.partyUnits;
            targetIndex  = 0;
            activeTarget = targetSide[0];
        }
        else
        {
            var _canTargetEnemies = activeAction.targetEnemyByDefault;

            if (_moveH == -1 && !activeAction.targetEnemyByDefault)
            {
                targetSide = oBattle.partyUnits;
                audio_play_sound(move_select_snd, 0, false);
            }

            if (_moveH == 1 && _canTargetEnemies)
            {
                targetSide = oBattle.enemyUnits;
                audio_play_sound(move_select_snd, 0, false);
            }
        }


        // --------------------------------------------------
        // Filter valid targets
        // --------------------------------------------------
        targetSide = array_filter(targetSide, function(_unit) {
            if (activeAction.name == "Revive" && IsAlly(activeUser, _unit))
                return true;
            return (_unit.hp > 0);
        });


        // --------------------------------------------------
        // Vertical selection / toggle ALL (WITH SOUND)
        // --------------------------------------------------
        if (!targetAll && !(instance_exists(oBattle) && oBattle.tutorialForceHealTarget))
        {
            if (_moveV == 1) {
                targetIndex++;
                audio_play_sound(move_select_snd, 0, false);
            }

            if (_moveV == -1) {
                targetIndex--;
                audio_play_sound(move_select_snd, 0, false);
            }

            var _count = array_length(targetSide);

            if (_count > 0)
            {
                if (targetIndex < 0)          targetIndex = _count - 1;
                if (targetIndex > _count - 1) targetIndex = 0;

                activeTarget = targetSide[targetIndex];
            }

            if ((activeAction.targetAll == Mode.Varies) && _keyToggle)
            {
                targetAll = true;
                audio_play_sound(move_select_snd, 0, false);
            }
        }
        else if (!(instance_exists(oBattle) && oBattle.tutorialForceHealTarget))
        {
            activeTarget = targetSide;

            if ((activeAction.targetAll == Mode.Varies) && _keyToggle)
            {
                targetAll = false;
                audio_play_sound(move_select_snd, 0, false);
            }
        }


        // --------------------------------------------------
        // CONFIRM (WITH SOUND)
        // --------------------------------------------------
        if (_keyConfirm)
        {
            audio_play_sound(move_select_snd, 0, false);

            with (oBattle)
                BeginAction(other.activeUser, other.activeAction, other.activeTarget);

            with (oMenu)
                instance_destroy();

            active = false;
            confirmDelay = 0;
        }


        // --------------------------------------------------
        // CANCEL / BACK (WITH SOUND)
        // --------------------------------------------------
        if (_keyCancel && !_keyConfirm)
        {
            if (instance_exists(oBattle))
            {
                if (oBattle.tutorialForceTarget || oBattle.tutorialForceHealTarget)
                    exit;
            }

            audio_play_sound(back_snd, 0, false);

            with (oMenu)
                active = true;

            active = false;
            confirmDelay = 0;
        }
    }
}

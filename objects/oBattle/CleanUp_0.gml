// =====================================================
// DESTROY UI + BATTLE OBJECTS
// =====================================================
with (oMenu)        instance_destroy();
with (oBattleUnit)  instance_destroy();
with (oBattle)      instance_destroy();

// =====================================================
// REACTIVATE EVERYTHING WE PAUSED IN CREATE
// =====================================================
instance_activate_all();

// =====================================================
// HANDLE ESCAPE
// =====================================================
if (conclusionType == 2) // escaped
{
    with (creator)
    {
        escapeDelay = 300;
        visible = true;
    }
}

// =====================================================
// HANDLE VICTORY
// =====================================================
if (conclusionType == 1) // victory
{
    with (creator)
    {
        dead = true;
        visible = true;
    }
}

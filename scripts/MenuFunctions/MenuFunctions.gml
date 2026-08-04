function Menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined)
{
    with (instance_create_depth(_x,_y,-99999,oMenu))
    {
        options = _options;
        description = _description;
        var _optionsCount = array_length(_options);
        visibleOptionsMax = _optionsCount;
        
        //Set up size
        xmargin = 10;
        ymargin = 8;
        draw_set_font(m3x6);
        heightLine = 12;
        
        //Auto width
        if (_width == undefined)
        {
            width = 1;
            if (description != -1) width = max(width, string_width(_description));
            for (var i = 0; i < _optionsCount; i++)
            {
                width = max(width, string_width(_options[i][0])); 
            }
            widthFull = width + xmargin * 2;
        } 
        
        else widthFull = _width;
        
        //Auto height
        if (_height == undefined)
        {
            height = heightLine * (_optionsCount + !(description == -1));
            heightFull = height + ymargin * 2;
        }
        else
        {
            heightFull = _height;
            //scrolling?
            if (heightLine * (_optionsCount + !(description == -1)) > _height - (ymargin*2))
            {
                scrolling = true;
                visibleOptionsMax = (_height - ymargin * 2) div heightLine;
            }
        }
    }
}

function SubMenu(_options) {
    optionsAbove[subMenuLevel] = options;
    subMenuLevel++;

    options = _options;
    hover = 0;

    // NEW: switch to single-column mode
    optionsPerRow = 1;

    scrollIndex = 0;
    scrollMax = max(0, array_length(options) - visibleOptionsMax);
}



function MenuGoBack() {
    subMenuLevel--;
    options = optionsAbove[subMenuLevel];
    hover = 0;

    // return to 2-column mode
    optionsPerRow = 2;
}

function MenuSelectAction(_user, _action) {

    // ------------------------------------
    // MP CHECK: BLOCK ACTION IF NOT ENOUGH
    // ------------------------------------
    if (variable_struct_exists(_action, "mpCost") && (_user.mp < _action.mpCost))
    {
        // Just set battleText and return.
        // Do NOT close menu, do NOT start targeting, do NOT skip turn.
        with (oBattle) {
            battleText = "Not enough MP!";
        }
        return;
    }

    // ------------------------------------
    // ORIGINAL BEHAVIOR (unchanged)
    // ------------------------------------

    // Close menu UI
    with (oMenu) active = false;

    // Clear hover description when selecting
    with (oBattle) {
        hover_description = "";
        show_hover_description = false;
    }

    with (oBattle) {
        if (_action.targetRequired) {

            // Enable cursor targeting
            with (cursor) {
                active = true;
                activeAction = _action;
                targetAll   = _action.targetAll;

                if (targetAll == Mode.Varies)
                    targetAll = true;

                activeUser  = _user;

                // Determine default target side
                if (_action.targetEnemyByDefault) {
                    targetIndex  = 0;
                    targetSide   = oBattle.enemyUnits;
                    activeTarget = oBattle.enemyUnits[targetIndex];
                }
                else {
                    // Target self / allies
                    targetSide   = oBattle.partyUnits;
                    activeTarget = activeUser;

                    var _findSelf = function(_element) {
                        return (_element == activeTarget);
                    };

                    targetIndex = array_find_index(oBattle.partyUnits, _findSelf);
                }
            }
        }

        else {
            // No target required → perform immediately
            BeginAction(_user, _action, -1);

            // Destroy menu after use
            with (oMenu) instance_destroy();
        }
    }
}





function isActionAvailable(_unit, _action) {
    // Always allow selection.
    // MP check will be handled when the player actually tries to use the action.
    return true;
}






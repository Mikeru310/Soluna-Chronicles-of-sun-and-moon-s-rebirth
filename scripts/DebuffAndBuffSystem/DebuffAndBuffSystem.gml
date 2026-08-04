

//------------------------------------DEBUFFS------------------------------------------------------------------------//

function createBurnedDebuff(duration) {
    return {
        name: "Burned",
        duration: duration,
        onTurnStart: function(target) {
            // Skip if already dead
            if (target.hp <= 0) return;

            var burnDamage = 1;
            BattleChangeHP(target, -burnDamage, 0, make_color_rgb(255, 140, 0)); // 🔸 orange

            // If burn kills the target, skip any other effects for this turn
            if (target.hp <= 0) return;
        }
    };
}

function createPoisonDebuff(duration) {
    return {
        name: "Poisoned",
        duration: duration,
        onTurnStart: function(target) {
            // Skip if already dead
            if (target.hp <= 0) return;

            var poisonDamage = 2;
            BattleChangeHP(target, -poisonDamage, 0, c_purple); // 🟢npurple

            if (target.hp <= 0) return;
        }
    };
}


function createStunDebuff(duration) {
    return {
        name: "Stunned",
        duration: duration,
        onTurnStart: function(target) {
            target.isStunned = true;
        }
    };
}


function createCleanseBuff() {
    return {
        name: "Cleanse",
        apply: function(target) {
            target.debuffs = [];  // remove all debuffs
        }
    };
}






function ProcessDebuffs(unit) {
    // Skip processing if unit is already dead
    if (unit.hp <= 0) return;

    for (var i = array_length(unit.debuffs) - 1; i >= 0; i--) {
        var debuff = unit.debuffs[i];

        if (debuff.onTurnStart) {
            debuff.onTurnStart(unit);
        }

        // If the unit dies mid-debuff (e.g., burn kills them), stop further processing
        if (unit.hp <= 0) return;

        debuff.duration -= 1;
        if (debuff.duration <= 0) {
            array_delete(unit.debuffs, i, 1);
        }
    }
}


//-------------------------------------------------SPRITE MANIPULATOR----------------------------------------------------------------------//



/// status_get_color(unit)
function status_get_color(_unit)
{
    var isBurned  = false;
    var isPoison  = false;

    for (var i = 0; i < array_length(_unit.debuffs); i++)
    {
        var d = _unit.debuffs[i].name;

        if (d == "Burned")    isBurned = true;
        if (d == "Poisoned")  isPoison = true;
    }

    if (isBurned)  return  c_orange//make_color_rgb(255,140,0); // 🔸 Orange
    if (isPoison)  return c_purple;                  // 🟣 Purple

    return c_white; // No status → normal
}




function AddOrRefreshDebuff(target, debuff) {
    for (var i = 0; i < array_length(target.debuffs); i++) {
        if (target.debuffs[i].name == debuff.name) {
            // Refresh duration
            target.debuffs[i].duration = debuff.duration;
            return;
        }
    }
    // Otherwise add new debuff
    array_push(target.debuffs, debuff);
}




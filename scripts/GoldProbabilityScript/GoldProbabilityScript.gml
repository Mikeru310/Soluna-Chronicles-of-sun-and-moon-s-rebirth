/// @function scr_get_gold_drop()
/// @description Returns a gold drop amount (10–20) based on weighted probability

function scr_get_gold_drop_act1() {
    var gold_values = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    var frequencies = [1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1]; // total 36

    var total_weight = 0;
    for (var i = 0; i < array_length(frequencies); i++) {
        total_weight += frequencies[i];
    }

    var r = irandom_range(1, total_weight);
    var cumulative = 0;

    for (var i = 0; i < array_length(gold_values); i++) {
        cumulative += frequencies[i];
        if (r <= cumulative) {
            return gold_values[i];
        }
    }

    return gold_values[array_length(gold_values) - 1]; // fallback
}


function scr_get_gold_drop_act2() {
    var gold_values = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
    var frequencies = [1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1]; // total 36

    var total_weight = 0;
    for (var i = 0; i < array_length(frequencies); i++) {
        total_weight += frequencies[i];
    }

    var r = irandom_range(1, total_weight);
    var cumulative = 0;

    for (var i = 0; i < array_length(gold_values); i++) {
        cumulative += frequencies[i];
        if (r <= cumulative) {
            return gold_values[i];
        }
    }

    return gold_values[array_length(gold_values) - 1]; // fallback
}

function scr_get_gold_drop_act3() {
    var gold_values = [40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50];
    var frequencies = [1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1]; // total 36

    var total_weight = 0;
    for (var i = 0; i < array_length(frequencies); i++) {
        total_weight += frequencies[i];
    }

    var r = irandom_range(1, total_weight);
    var cumulative = 0;

    for (var i = 0; i < array_length(gold_values); i++) {
        cumulative += frequencies[i];
        if (r <= cumulative) {
            return gold_values[i];
        }
    }

    return gold_values[array_length(gold_values) - 1]; // fallback
}


function scr_get_gold_drop_act4() {
    var gold_values = [30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40];
    var frequencies = [1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1]; // total 36

    var total_weight = 0;
    for (var i = 0; i < array_length(frequencies); i++) {
        total_weight += frequencies[i];
    }

    var r = irandom_range(1, total_weight);
    var cumulative = 0;

    for (var i = 0; i < array_length(gold_values); i++) {
        cumulative += frequencies[i];
        if (r <= cumulative) {
            return gold_values[i];
        }
    }

    return gold_values[array_length(gold_values) - 1]; // fallback
}





//ruined titan drop
function ruined_titanDrop() {
    return 200;
}

//lucian gold drop
function lucian_drop() {
    return 200;
}

//dusk reaper gold drop
function duskReaperDrop() {
    return 400;
}


//Maya gold drop
function corruptedMaya() {
    return 400
}


function AddItemToInventory(_item, _amount) {

    // --- SEARCH for matching item ---
    for (var i = 0; i < array_length(global.inventory); i++) {

        var entry = global.inventory[i];

        // Skip invalid entries
        if (entry == undefined) continue;
        if (!is_array(entry)) continue;
        if (array_length(entry) < 2) continue;
        if (entry[0] == undefined) continue;

        var inv_item   = entry[0];
        var inv_amount = entry[1];

        // Compare by struct reference
        if (inv_item == _item) {
            entry[1] = inv_amount + _amount;
            global.inventory[i] = entry;
            return;
        }
    }

    // NO MATCH FOUND → add new entry
    array_push(global.inventory, [_item, _amount]);
}

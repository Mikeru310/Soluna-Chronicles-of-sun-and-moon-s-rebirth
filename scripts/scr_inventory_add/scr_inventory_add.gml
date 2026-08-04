// Adds an item to the inventory
function inv_add_item(item_name) {
    for (var i = 0; i < array_length(global.inventory); i++) {
        if (global.inventory[i][0] == global.items[item_name]) {
            global.inventory[i][1] += 1;  // Increase item count
            return true;
        }
    }
    // If item not found, add a new entry
    array_push(global.inventory, [global.items[item_name], 1]);
    return true;
}

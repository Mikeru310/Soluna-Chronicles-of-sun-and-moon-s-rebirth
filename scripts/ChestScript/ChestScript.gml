function ChestAddToInventory(_item, _amount) {
    var found = false;

    for (var i = 0; i < array_length(global.inventory); i++) {
        if (global.inventory[i][0] == _item) {
            global.inventory[i][1] += _amount;
            found = true;
            break;
        }
    }

    if (!found) {
        array_push(global.inventory, [_item, _amount]);
    }
}

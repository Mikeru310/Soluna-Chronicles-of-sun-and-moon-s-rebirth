/// @function inv_use_item(slot_index, target_index)
/// @param slot_index   Index in inventory
/// @param target_index Index in global.party (0 = Haru, 1 = Maya)

function inv_use_item(slot_index, target_index) {
    var inv_entry = global.inventory[slot_index];
    if (inv_entry == undefined) return;

    var item = inv_entry[0];   // The item struct (from global.items)
    var amount = inv_entry[1]; // Quantity
    var target = global.party[target_index];

    if (item != undefined && amount > 0) {
        // === Inventory-only handler (no BattleChangeHP) ===
        switch (item.name) {
            case "Small Potion":
                target.hp = clamp(target.hp + 10, 0, target.hpmax);
                break;

            case "Large Potion":
                target.hp = clamp(target.hp + 20, 0, target.hpmax);
                break;

            case "Small mana potion":
                target.mp = clamp(target.mp + 5, 0, target.mpmax);
                break;

            case "Large mana potion":
                target.mp = clamp(target.mp + 10, 0, target.mpmax);
                break;

            case "Revive":
                if (target.hp <= 0) {
                    target.hp = 30; // bring back to life with 30 HP
                }
                break;
        }

        // === Feedback message ===
        global.feedback_message = "Used " + item.name + " on " + target.name + "!";
        global.feedback_timer = 60;

        // === Reduce quantity ===
global.inventory[slot_index][1] -= 1;
if (global.inventory[slot_index][1] <= 0) {
    array_delete(global.inventory, slot_index, 1);  // ✅ Removes the slot properly
}
    }
}

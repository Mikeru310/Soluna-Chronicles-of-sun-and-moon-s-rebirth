shop_cursor = 0;
item_desc = "";
shop_message = ""; // line that shows when buying

global.shop_inventory = [
    global.items.small_potion,
    global.items.Large_potion,
    global.items.small_mana_potion,
    global.items.large_mana_potion,
    global.items.revive
];

// shopkeeper flavor lines
shop_lines = [
    "Heh... always a pleasure taking your gold.",
    "Don't worry, it's only slightly cursed... maybe.",
    "You won't find it cheaper anywhere else... probably.",
    "Another satisfied customer... I hope.",
    "Spend big, live big, that's my motto!",
    "Eyy, you got it boss!"
];

display_set_gui_size(320, 180);
interaction_cooldown = 0;

shop_cursor = 0;
item_desc = "";
shop_message = ""; // line that shows when buying

global.shop_inventory = [
    global.items.small_potion,
    global.items.Large_potion,
    global.items.small_mana_potion,
   // global.items.large_mana_potion,
    //global.items.revive
];

// shopkeeper flavor lines
shop_lines = [
    "Thanks for your purchase!",
    "All set! Anything else you need?",
    "Pleasure doing business with you.",
    "That's yours now. Come again!",
    "Good choice! Hope it serves you well"
    
];

shop_insufficient = [
    "Sorry... you don't have enough gold for that.",
    "Looks like you're short on gold.",
    "Can't sell it to you unless you can afford it.",
    "Come back when you've got a bit more coin.",
    "Not enough gold. Maybe try something cheaper?"
];




display_set_gui_size(320, 180);
interaction_cooldown = 0;

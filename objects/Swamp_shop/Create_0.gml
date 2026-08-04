shop_cursor = 0;
item_desc = "";
shop_message = ""; // line that shows when buying

global.shop_inventory = [
    global.items.small_potion,
    global.items.Large_potion,
    global.items.small_mana_potion,
    global.items.large_mana_potion,
    //global.items.revive
];

// shopkeeper flavor lines
shop_lines = [
    "Heh, pleasure doing business... come back with more coin.",
    "Nice pick... hope it keeps you alive longer.",
    "Good choice... try not to break it immediately.",
    "Thanks for the gold... now get out there.",
    "Always happy to take your money... anything else?",
    
];

shop_insufficient = [
    "You kidding me...? That's not enough gold.",
    "Come back when your pockets aren't empty...",
    "No coin, no deal... rules are rules.",
    "Tch... you can’t afford that. Not even close.",
    "Try again when you actually have money..."
];




display_set_gui_size(320, 180);
interaction_cooldown = 0;

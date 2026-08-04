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
    "A fine choice! That one's treated me well until now.",
    "Pleasure doing business! May it serve you better than it served me",
    "Ha! Knew you had good taste the moment I saw you.",
    "Excellent pick. I almost didn't want to part with it... almost.",
    "Another deal struck! The winds favor you today, traveler.",
    
];

shop_insufficient = [
    "Oof seems your coin pouch is feeling light. Happens to the best of us.",
    "Not enough gold? A shame... that item was begging for a new owner.",
    "If wishes were coins, you'd be rich. Sadly, I only take the real kind.",
    "Hmm... looks like math isn't on your side today.",
    "No deal? Ah well this treasure remains mine a bit longer."
];




display_set_gui_size(320, 180);
interaction_cooldown = 0;

shop_cursor = 0;
item_desc = "";
shop_message = ""; // line that shows when buying

global.shop_inventory = [
    global.items.small_potion,
    //global.items.Large_potion,
    global.items.small_mana_potion,
   // global.items.large_mana_potion,
    //global.items.revive
];

// shopkeeper flavor lines
shop_lines = [
    "You've got good taste. Take care out there, alright?",
    "Here you go. If you need anything else, you know where to find me.",
    "You’re always welcome here. Don’t hesitate to drop by again.",
    "A fine choice. Hope it serves you well on your journey.",
    "Got it! I’ll wrap this up for you stay safe out there.",
    "Anything for you two. Come back if you run low"
];

shop_insufficient = [
    "Ah looks like you're a bit short on gold.",
    "Sorry, Haru, Maya… that one's out of reach right now.",
    "Wish I could give discounts, but I'm barely making it myself.",
    "Not enough gold. Maybe come back after a few battles?",
    "Hey, don’t stress it. Gather a bit more and I’ll save it for you."
];




display_set_gui_size(320, 180);
interaction_cooldown = 0;

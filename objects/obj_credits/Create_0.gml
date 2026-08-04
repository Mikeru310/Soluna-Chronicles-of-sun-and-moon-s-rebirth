/// Create Event - obj_credits

// Use a ds_list to avoid name/conflict/syntax issues
credit_list = ds_list_create();
ds_list_add(credit_list, "MAIN PROGRAMMER\nMichael Tosco");
ds_list_add(credit_list, "STORY WRITER\nMichael Tosco");
ds_list_add(credit_list, "ASSISTANT PROGRAMMER\nAdre Pol Suganob\n Emmanuel Tumbucon");
ds_list_add(credit_list, "SPRITE ARTIST\nMark Rellin\nEmmanuel Tumbucon");
ds_list_add(credit_list, "MAP MAKER\nMark Rellin");
ds_list_add(credit_list, "MUSIC PRODUCER\nMichael Tosco\nEmmanuel Tumbucon");
ds_list_add(credit_list, "FOUNDER\nBSIT 4-2 Soluna group");
ds_list_add(credit_list, "Thanks for Playing!");

// Index (0-based)
credit_index = 0;

// Alpha for fade in/out
alpha = 0;

// State machine: 0 = fade in, 1 = hold, 2 = fade out
state = 0;

// Timings
fade_speed = 0.02;    // raise to fade faster, lower to fade slower
hold_time = 60;      // frames to hold fully visible (60 = 1 second at 60fps)
hold_timer = 0;

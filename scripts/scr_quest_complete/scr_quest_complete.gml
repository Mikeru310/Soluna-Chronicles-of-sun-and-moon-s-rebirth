function scr_quest_complete(_id) {
    for (var i = 0; i < array_length(global.quest_data); i++) {
        if (global.quest_data[i][? "id"] == _id) {
            global.quest_data[i][? "completed"] = true;
            array_push(global.quest_completed, global.quest_data[i]);

            var popup = instance_create_layer(0, 0, "Instances", obj_quest_popup);
            popup.popup_text = "Quest Complete: " + string(global.quest_data[i][? "title"]);
        }
    }
}

/// scr_quest_add(_id, _title, _desc, _type)
function scr_quest_add(_id, _title, _desc, _type)
{
    if (argument_count == 1) {
        _title = string_replace_all(_id, "_", " ");
        _desc  = "No description provided.";
        _type  = "Main Quest";
    }

    // Prevent duplicates
    for (var i = 0; i < array_length(global.quest_data); i++)
    {
        if (global.quest_data[i][? "id"] == _id)
            return;
    }

    var q = ds_map_create();
    q[? "id"]          = _id;
    q[? "title"]       = _title;
    q[? "description"] = _desc;
    q[? "type"]        = _type;

    q[? "started"]   = true;
    q[? "completed"] = false;

    // ⭐ MAIN QUEST ALWAYS GOES FIRST
    if (_id == "main_quest") {
        array_insert(global.quest_data, 0, q);
    } else {
        array_push(global.quest_data, q);
    }
}

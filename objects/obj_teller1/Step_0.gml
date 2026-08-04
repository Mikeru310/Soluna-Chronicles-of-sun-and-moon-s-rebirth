if (interact && !instance_exists(obj_dialogue_box)) {
    var _box = instance_create_layer(x, y - 20, "Instances", obj_dialogue_box);
    _box.npc_id = id;
    interact = false;
}
